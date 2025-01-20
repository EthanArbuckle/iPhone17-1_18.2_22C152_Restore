@interface BMDeviceConnectivityContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceConnectivityContext)initWithGeohash:(id)a3 counter:(id)a4 event:(id)a5 ratType:(id)a6 rrcState:(id)a7 cellNsaEnabled:(id)a8 isFR1:(id)a9 cellARFCN:(id)a10 cellBandInfo:(id)a11 cellChannelBW:(id)a12 cellRsrp:(id)a13 cellSinr:(id)a14 cellLteRSRQ:(id)a15 cellNrRSRP:(id)a16 cellNrRSRQ:(id)a17 cellNrSNR:(id)a18 maxDLCAConfigured:(id)a19 totalConfiguredBw:(id)a20 nrConfiguredBw:(id)a21 nrTotalScheduledMimoLayers:(id)a22 totalConfiguredMimoLayers:(id)a23 lteMaxScheduledMimoLayersInACell:(id)a24 nrMaxDlModulation:(id)a25 actualHighBandwidth:(id)a26 actualLowBandwidth:(id)a27 pActualLowBandwidth:(id)a28 maxOfActualLowBandwidth:(id)a29 estimatedHighBandwidth:(id)a30 estimatedLowBandwidth:(id)a31 movingAvgHighBandwidth:(id)a32 movingAvgLowBandwidth:(id)a33 cmDataSentCount:(id)a34 cmDataSentDuration:(id)a35 tcpRTTAvg:(id)a36 tcpRTTvar:(id)a37 videoStreamingStallTime:(id)a38 numStall:(id)a39 stallDuration:(id)a40 cellEstimatedBW:(id)a41 cellLoad:(id)a42 cellModelConfidenceLevel:(id)a43 mlPredictedCellBW:(id)a44 qbssLoad:(id)a45 lqmScorecellular:(id)a46;
- (BMDeviceConnectivityContext)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)cellNsaEnabled;
- (BOOL)hasActualHighBandwidth;
- (BOOL)hasActualLowBandwidth;
- (BOOL)hasCellARFCN;
- (BOOL)hasCellBandInfo;
- (BOOL)hasCellChannelBW;
- (BOOL)hasCellEstimatedBW;
- (BOOL)hasCellLoad;
- (BOOL)hasCellLteRSRQ;
- (BOOL)hasCellModelConfidenceLevel;
- (BOOL)hasCellNrRSRP;
- (BOOL)hasCellNrRSRQ;
- (BOOL)hasCellNrSNR;
- (BOOL)hasCellNsaEnabled;
- (BOOL)hasCellRsrp;
- (BOOL)hasCellSinr;
- (BOOL)hasCmDataSentCount;
- (BOOL)hasCmDataSentDuration;
- (BOOL)hasCounter;
- (BOOL)hasEstimatedHighBandwidth;
- (BOOL)hasEstimatedLowBandwidth;
- (BOOL)hasEvent;
- (BOOL)hasIsFR1;
- (BOOL)hasLqmScorecellular;
- (BOOL)hasLteMaxScheduledMimoLayersInACell;
- (BOOL)hasMaxDLCAConfigured;
- (BOOL)hasMaxOfActualLowBandwidth;
- (BOOL)hasMlPredictedCellBW;
- (BOOL)hasMovingAvgHighBandwidth;
- (BOOL)hasMovingAvgLowBandwidth;
- (BOOL)hasNrConfiguredBw;
- (BOOL)hasNrMaxDlModulation;
- (BOOL)hasNrTotalScheduledMimoLayers;
- (BOOL)hasNumStall;
- (BOOL)hasPActualLowBandwidth;
- (BOOL)hasQbssLoad;
- (BOOL)hasRrcState;
- (BOOL)hasStallDuration;
- (BOOL)hasTcpRTTAvg;
- (BOOL)hasTcpRTTvar;
- (BOOL)hasTotalConfiguredBw;
- (BOOL)hasTotalConfiguredMimoLayers;
- (BOOL)hasVideoStreamingStallTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFR1;
- (NSString)description;
- (NSString)geohash;
- (NSString)ratType;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)cellLteRSRQ;
- (int)cellNrRSRP;
- (int)cellNrRSRQ;
- (int)cellNrSNR;
- (int)cellRsrp;
- (int)cellSinr;
- (unsigned)actualHighBandwidth;
- (unsigned)actualLowBandwidth;
- (unsigned)cellARFCN;
- (unsigned)cellBandInfo;
- (unsigned)cellChannelBW;
- (unsigned)cellEstimatedBW;
- (unsigned)cellLoad;
- (unsigned)cellModelConfidenceLevel;
- (unsigned)cmDataSentCount;
- (unsigned)cmDataSentDuration;
- (unsigned)counter;
- (unsigned)dataVersion;
- (unsigned)estimatedHighBandwidth;
- (unsigned)estimatedLowBandwidth;
- (unsigned)event;
- (unsigned)lqmScorecellular;
- (unsigned)lteMaxScheduledMimoLayersInACell;
- (unsigned)maxDLCAConfigured;
- (unsigned)maxOfActualLowBandwidth;
- (unsigned)mlPredictedCellBW;
- (unsigned)movingAvgHighBandwidth;
- (unsigned)movingAvgLowBandwidth;
- (unsigned)nrConfiguredBw;
- (unsigned)nrMaxDlModulation;
- (unsigned)nrTotalScheduledMimoLayers;
- (unsigned)numStall;
- (unsigned)pActualLowBandwidth;
- (unsigned)qbssLoad;
- (unsigned)rrcState;
- (unsigned)stallDuration;
- (unsigned)tcpRTTAvg;
- (unsigned)tcpRTTvar;
- (unsigned)totalConfiguredBw;
- (unsigned)totalConfiguredMimoLayers;
- (unsigned)videoStreamingStallTime;
- (void)setHasActualHighBandwidth:(BOOL)a3;
- (void)setHasActualLowBandwidth:(BOOL)a3;
- (void)setHasCellARFCN:(BOOL)a3;
- (void)setHasCellBandInfo:(BOOL)a3;
- (void)setHasCellChannelBW:(BOOL)a3;
- (void)setHasCellEstimatedBW:(BOOL)a3;
- (void)setHasCellLoad:(BOOL)a3;
- (void)setHasCellLteRSRQ:(BOOL)a3;
- (void)setHasCellModelConfidenceLevel:(BOOL)a3;
- (void)setHasCellNrRSRP:(BOOL)a3;
- (void)setHasCellNrRSRQ:(BOOL)a3;
- (void)setHasCellNrSNR:(BOOL)a3;
- (void)setHasCellNsaEnabled:(BOOL)a3;
- (void)setHasCellRsrp:(BOOL)a3;
- (void)setHasCellSinr:(BOOL)a3;
- (void)setHasCmDataSentCount:(BOOL)a3;
- (void)setHasCmDataSentDuration:(BOOL)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setHasEstimatedHighBandwidth:(BOOL)a3;
- (void)setHasEstimatedLowBandwidth:(BOOL)a3;
- (void)setHasEvent:(BOOL)a3;
- (void)setHasIsFR1:(BOOL)a3;
- (void)setHasLqmScorecellular:(BOOL)a3;
- (void)setHasLteMaxScheduledMimoLayersInACell:(BOOL)a3;
- (void)setHasMaxDLCAConfigured:(BOOL)a3;
- (void)setHasMaxOfActualLowBandwidth:(BOOL)a3;
- (void)setHasMlPredictedCellBW:(BOOL)a3;
- (void)setHasMovingAvgHighBandwidth:(BOOL)a3;
- (void)setHasMovingAvgLowBandwidth:(BOOL)a3;
- (void)setHasNrConfiguredBw:(BOOL)a3;
- (void)setHasNrMaxDlModulation:(BOOL)a3;
- (void)setHasNrTotalScheduledMimoLayers:(BOOL)a3;
- (void)setHasNumStall:(BOOL)a3;
- (void)setHasPActualLowBandwidth:(BOOL)a3;
- (void)setHasQbssLoad:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setHasStallDuration:(BOOL)a3;
- (void)setHasTcpRTTAvg:(BOOL)a3;
- (void)setHasTcpRTTvar:(BOOL)a3;
- (void)setHasTotalConfiguredBw:(BOOL)a3;
- (void)setHasTotalConfiguredMimoLayers:(BOOL)a3;
- (void)setHasVideoStreamingStallTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceConnectivityContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratType, 0);

  objc_storeStrong((id *)&self->_geohash, 0);
}

- (void)setHasLqmScorecellular:(BOOL)a3
{
  self->_hasLqmScorecellular = a3;
}

- (BOOL)hasLqmScorecellular
{
  return self->_hasLqmScorecellular;
}

- (unsigned)lqmScorecellular
{
  return self->_lqmScorecellular;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  self->_hasQbssLoad = a3;
}

- (BOOL)hasQbssLoad
{
  return self->_hasQbssLoad;
}

- (unsigned)qbssLoad
{
  return self->_qbssLoad;
}

- (void)setHasMlPredictedCellBW:(BOOL)a3
{
  self->_hasMlPredictedCellBW = a3;
}

- (BOOL)hasMlPredictedCellBW
{
  return self->_hasMlPredictedCellBW;
}

- (unsigned)mlPredictedCellBW
{
  return self->_mlPredictedCellBW;
}

- (void)setHasCellModelConfidenceLevel:(BOOL)a3
{
  self->_hasCellModelConfidenceLevel = a3;
}

- (BOOL)hasCellModelConfidenceLevel
{
  return self->_hasCellModelConfidenceLevel;
}

- (unsigned)cellModelConfidenceLevel
{
  return self->_cellModelConfidenceLevel;
}

- (void)setHasCellLoad:(BOOL)a3
{
  self->_hasCellLoad = a3;
}

- (BOOL)hasCellLoad
{
  return self->_hasCellLoad;
}

- (unsigned)cellLoad
{
  return self->_cellLoad;
}

- (void)setHasCellEstimatedBW:(BOOL)a3
{
  self->_hasCellEstimatedBW = a3;
}

- (BOOL)hasCellEstimatedBW
{
  return self->_hasCellEstimatedBW;
}

- (unsigned)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (void)setHasStallDuration:(BOOL)a3
{
  self->_hasStallDuration = a3;
}

- (BOOL)hasStallDuration
{
  return self->_hasStallDuration;
}

- (unsigned)stallDuration
{
  return self->_stallDuration;
}

- (void)setHasNumStall:(BOOL)a3
{
  self->_hasNumStall = a3;
}

- (BOOL)hasNumStall
{
  return self->_hasNumStall;
}

- (unsigned)numStall
{
  return self->_numStall;
}

- (void)setHasVideoStreamingStallTime:(BOOL)a3
{
  self->_hasVideoStreamingStallTime = a3;
}

- (BOOL)hasVideoStreamingStallTime
{
  return self->_hasVideoStreamingStallTime;
}

- (unsigned)videoStreamingStallTime
{
  return self->_videoStreamingStallTime;
}

- (void)setHasTcpRTTvar:(BOOL)a3
{
  self->_hasTcpRTTvar = a3;
}

- (BOOL)hasTcpRTTvar
{
  return self->_hasTcpRTTvar;
}

- (unsigned)tcpRTTvar
{
  return self->_tcpRTTvar;
}

- (void)setHasTcpRTTAvg:(BOOL)a3
{
  self->_hasTcpRTTAvg = a3;
}

- (BOOL)hasTcpRTTAvg
{
  return self->_hasTcpRTTAvg;
}

- (unsigned)tcpRTTAvg
{
  return self->_tcpRTTAvg;
}

- (void)setHasCmDataSentDuration:(BOOL)a3
{
  self->_hasCmDataSentDuration = a3;
}

- (BOOL)hasCmDataSentDuration
{
  return self->_hasCmDataSentDuration;
}

- (unsigned)cmDataSentDuration
{
  return self->_cmDataSentDuration;
}

- (void)setHasCmDataSentCount:(BOOL)a3
{
  self->_hasCmDataSentCount = a3;
}

- (BOOL)hasCmDataSentCount
{
  return self->_hasCmDataSentCount;
}

- (unsigned)cmDataSentCount
{
  return self->_cmDataSentCount;
}

- (void)setHasMovingAvgLowBandwidth:(BOOL)a3
{
  self->_hasMovingAvgLowBandwidth = a3;
}

- (BOOL)hasMovingAvgLowBandwidth
{
  return self->_hasMovingAvgLowBandwidth;
}

- (unsigned)movingAvgLowBandwidth
{
  return self->_movingAvgLowBandwidth;
}

- (void)setHasMovingAvgHighBandwidth:(BOOL)a3
{
  self->_hasMovingAvgHighBandwidth = a3;
}

- (BOOL)hasMovingAvgHighBandwidth
{
  return self->_hasMovingAvgHighBandwidth;
}

- (unsigned)movingAvgHighBandwidth
{
  return self->_movingAvgHighBandwidth;
}

- (void)setHasEstimatedLowBandwidth:(BOOL)a3
{
  self->_hasEstimatedLowBandwidth = a3;
}

- (BOOL)hasEstimatedLowBandwidth
{
  return self->_hasEstimatedLowBandwidth;
}

- (unsigned)estimatedLowBandwidth
{
  return self->_estimatedLowBandwidth;
}

- (void)setHasEstimatedHighBandwidth:(BOOL)a3
{
  self->_hasEstimatedHighBandwidth = a3;
}

- (BOOL)hasEstimatedHighBandwidth
{
  return self->_hasEstimatedHighBandwidth;
}

- (unsigned)estimatedHighBandwidth
{
  return self->_estimatedHighBandwidth;
}

- (void)setHasMaxOfActualLowBandwidth:(BOOL)a3
{
  self->_hasMaxOfActualLowBandwidth = a3;
}

- (BOOL)hasMaxOfActualLowBandwidth
{
  return self->_hasMaxOfActualLowBandwidth;
}

- (unsigned)maxOfActualLowBandwidth
{
  return self->_maxOfActualLowBandwidth;
}

- (void)setHasPActualLowBandwidth:(BOOL)a3
{
  self->_hasPActualLowBandwidth = a3;
}

- (BOOL)hasPActualLowBandwidth
{
  return self->_hasPActualLowBandwidth;
}

- (unsigned)pActualLowBandwidth
{
  return self->_pActualLowBandwidth;
}

- (void)setHasActualLowBandwidth:(BOOL)a3
{
  self->_hasActualLowBandwidth = a3;
}

- (BOOL)hasActualLowBandwidth
{
  return self->_hasActualLowBandwidth;
}

- (unsigned)actualLowBandwidth
{
  return self->_actualLowBandwidth;
}

- (void)setHasActualHighBandwidth:(BOOL)a3
{
  self->_hasActualHighBandwidth = a3;
}

- (BOOL)hasActualHighBandwidth
{
  return self->_hasActualHighBandwidth;
}

- (unsigned)actualHighBandwidth
{
  return self->_actualHighBandwidth;
}

- (void)setHasNrMaxDlModulation:(BOOL)a3
{
  self->_hasNrMaxDlModulation = a3;
}

- (BOOL)hasNrMaxDlModulation
{
  return self->_hasNrMaxDlModulation;
}

- (unsigned)nrMaxDlModulation
{
  return self->_nrMaxDlModulation;
}

- (void)setHasLteMaxScheduledMimoLayersInACell:(BOOL)a3
{
  self->_hasLteMaxScheduledMimoLayersInACell = a3;
}

- (BOOL)hasLteMaxScheduledMimoLayersInACell
{
  return self->_hasLteMaxScheduledMimoLayersInACell;
}

- (unsigned)lteMaxScheduledMimoLayersInACell
{
  return self->_lteMaxScheduledMimoLayersInACell;
}

- (void)setHasTotalConfiguredMimoLayers:(BOOL)a3
{
  self->_hasTotalConfiguredMimoLayers = a3;
}

- (BOOL)hasTotalConfiguredMimoLayers
{
  return self->_hasTotalConfiguredMimoLayers;
}

- (unsigned)totalConfiguredMimoLayers
{
  return self->_totalConfiguredMimoLayers;
}

- (void)setHasNrTotalScheduledMimoLayers:(BOOL)a3
{
  self->_hasNrTotalScheduledMimoLayers = a3;
}

- (BOOL)hasNrTotalScheduledMimoLayers
{
  return self->_hasNrTotalScheduledMimoLayers;
}

- (unsigned)nrTotalScheduledMimoLayers
{
  return self->_nrTotalScheduledMimoLayers;
}

- (void)setHasNrConfiguredBw:(BOOL)a3
{
  self->_hasNrConfiguredBw = a3;
}

- (BOOL)hasNrConfiguredBw
{
  return self->_hasNrConfiguredBw;
}

- (unsigned)nrConfiguredBw
{
  return self->_nrConfiguredBw;
}

- (void)setHasTotalConfiguredBw:(BOOL)a3
{
  self->_hasTotalConfiguredBw = a3;
}

- (BOOL)hasTotalConfiguredBw
{
  return self->_hasTotalConfiguredBw;
}

- (unsigned)totalConfiguredBw
{
  return self->_totalConfiguredBw;
}

- (void)setHasMaxDLCAConfigured:(BOOL)a3
{
  self->_hasMaxDLCAConfigured = a3;
}

- (BOOL)hasMaxDLCAConfigured
{
  return self->_hasMaxDLCAConfigured;
}

- (unsigned)maxDLCAConfigured
{
  return self->_maxDLCAConfigured;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  self->_hasCellNrSNR = a3;
}

- (BOOL)hasCellNrSNR
{
  return self->_hasCellNrSNR;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  self->_hasCellNrRSRQ = a3;
}

- (BOOL)hasCellNrRSRQ
{
  return self->_hasCellNrRSRQ;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  self->_hasCellNrRSRP = a3;
}

- (BOOL)hasCellNrRSRP
{
  return self->_hasCellNrRSRP;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  self->_hasCellLteRSRQ = a3;
}

- (BOOL)hasCellLteRSRQ
{
  return self->_hasCellLteRSRQ;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (void)setHasCellSinr:(BOOL)a3
{
  self->_hasCellSinr = a3;
}

- (BOOL)hasCellSinr
{
  return self->_hasCellSinr;
}

- (int)cellSinr
{
  return self->_cellSinr;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  self->_hasCellRsrp = a3;
}

- (BOOL)hasCellRsrp
{
  return self->_hasCellRsrp;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (void)setHasCellChannelBW:(BOOL)a3
{
  self->_hasCellChannelBW = a3;
}

- (BOOL)hasCellChannelBW
{
  return self->_hasCellChannelBW;
}

- (unsigned)cellChannelBW
{
  return self->_cellChannelBW;
}

- (void)setHasCellBandInfo:(BOOL)a3
{
  self->_hasCellBandInfo = a3;
}

- (BOOL)hasCellBandInfo
{
  return self->_hasCellBandInfo;
}

- (unsigned)cellBandInfo
{
  return self->_cellBandInfo;
}

- (void)setHasCellARFCN:(BOOL)a3
{
  self->_hasCellARFCN = a3;
}

- (BOOL)hasCellARFCN
{
  return self->_hasCellARFCN;
}

- (unsigned)cellARFCN
{
  return self->_cellARFCN;
}

- (void)setHasIsFR1:(BOOL)a3
{
  self->_hasIsFR1 = a3;
}

- (BOOL)hasIsFR1
{
  return self->_hasIsFR1;
}

- (BOOL)isFR1
{
  return self->_isFR1;
}

- (void)setHasCellNsaEnabled:(BOOL)a3
{
  self->_hasCellNsaEnabled = a3;
}

- (BOOL)hasCellNsaEnabled
{
  return self->_hasCellNsaEnabled;
}

- (BOOL)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (void)setHasRrcState:(BOOL)a3
{
  self->_hasRrcState = a3;
}

- (BOOL)hasRrcState
{
  return self->_hasRrcState;
}

- (unsigned)rrcState
{
  return self->_rrcState;
}

- (NSString)ratType
{
  return self->_ratType;
}

- (void)setHasEvent:(BOOL)a3
{
  self->_hasEvent = a3;
}

- (BOOL)hasEvent
{
  return self->_hasEvent;
}

- (unsigned)event
{
  return self->_event;
}

- (void)setHasCounter:(BOOL)a3
{
  self->_hasCounter = a3;
}

- (BOOL)hasCounter
{
  return self->_hasCounter;
}

- (unsigned)counter
{
  return self->_counter;
}

- (NSString)geohash
{
  return self->_geohash;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMDeviceConnectivityContext *)self geohash];
    uint64_t v7 = [v5 geohash];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDeviceConnectivityContext *)self geohash];
      v10 = [v5 geohash];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_221;
      }
    }
    if (-[BMDeviceConnectivityContext hasCounter](self, "hasCounter") || [v5 hasCounter])
    {
      if (![(BMDeviceConnectivityContext *)self hasCounter]) {
        goto LABEL_221;
      }
      if (![v5 hasCounter]) {
        goto LABEL_221;
      }
      unsigned int v13 = [(BMDeviceConnectivityContext *)self counter];
      if (v13 != [v5 counter]) {
        goto LABEL_221;
      }
    }
    if (-[BMDeviceConnectivityContext hasEvent](self, "hasEvent") || [v5 hasEvent])
    {
      if (![(BMDeviceConnectivityContext *)self hasEvent]) {
        goto LABEL_221;
      }
      if (![v5 hasEvent]) {
        goto LABEL_221;
      }
      unsigned int v14 = [(BMDeviceConnectivityContext *)self event];
      if (v14 != [v5 event]) {
        goto LABEL_221;
      }
    }
    v15 = [(BMDeviceConnectivityContext *)self ratType];
    uint64_t v16 = [v5 ratType];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(BMDeviceConnectivityContext *)self ratType];
      v19 = [v5 ratType];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_221;
      }
    }
    if (![(BMDeviceConnectivityContext *)self hasRrcState]
      && ![v5 hasRrcState]
      || [(BMDeviceConnectivityContext *)self hasRrcState]
      && [v5 hasRrcState]
      && (unsigned int v21 = [(BMDeviceConnectivityContext *)self rrcState],
          v21 == [v5 rrcState]))
    {
      if (![(BMDeviceConnectivityContext *)self hasCellNsaEnabled]
        && ![v5 hasCellNsaEnabled]
        || [(BMDeviceConnectivityContext *)self hasCellNsaEnabled]
        && [v5 hasCellNsaEnabled]
        && (int v22 = [(BMDeviceConnectivityContext *)self cellNsaEnabled],
            v22 == [v5 cellNsaEnabled]))
      {
        if (!-[BMDeviceConnectivityContext hasIsFR1](self, "hasIsFR1") && ![v5 hasIsFR1]
          || [(BMDeviceConnectivityContext *)self hasIsFR1]
          && [v5 hasIsFR1]
          && (int v23 = -[BMDeviceConnectivityContext isFR1](self, "isFR1"), v23 == [v5 isFR1]))
        {
          if (![(BMDeviceConnectivityContext *)self hasCellARFCN]
            && ![v5 hasCellARFCN]
            || [(BMDeviceConnectivityContext *)self hasCellARFCN]
            && [v5 hasCellARFCN]
            && (unsigned int v24 = [(BMDeviceConnectivityContext *)self cellARFCN],
                v24 == [v5 cellARFCN]))
          {
            if (![(BMDeviceConnectivityContext *)self hasCellBandInfo]
              && ![v5 hasCellBandInfo]
              || [(BMDeviceConnectivityContext *)self hasCellBandInfo]
              && [v5 hasCellBandInfo]
              && (unsigned int v25 = [(BMDeviceConnectivityContext *)self cellBandInfo],
                  v25 == [v5 cellBandInfo]))
            {
              if (![(BMDeviceConnectivityContext *)self hasCellChannelBW]
                && ![v5 hasCellChannelBW]
                || [(BMDeviceConnectivityContext *)self hasCellChannelBW]
                && [v5 hasCellChannelBW]
                && (unsigned int v26 = [(BMDeviceConnectivityContext *)self cellChannelBW],
                    v26 == [v5 cellChannelBW]))
              {
                if (![(BMDeviceConnectivityContext *)self hasCellRsrp]
                  && ![v5 hasCellRsrp]
                  || [(BMDeviceConnectivityContext *)self hasCellRsrp]
                  && [v5 hasCellRsrp]
                  && (int v27 = [(BMDeviceConnectivityContext *)self cellRsrp],
                      v27 == [v5 cellRsrp]))
                {
                  if (![(BMDeviceConnectivityContext *)self hasCellSinr]
                    && ![v5 hasCellSinr]
                    || [(BMDeviceConnectivityContext *)self hasCellSinr]
                    && [v5 hasCellSinr]
                    && (int v28 = [(BMDeviceConnectivityContext *)self cellSinr],
                        v28 == [v5 cellSinr]))
                  {
                    if (![(BMDeviceConnectivityContext *)self hasCellLteRSRQ]
                      && ![v5 hasCellLteRSRQ]
                      || [(BMDeviceConnectivityContext *)self hasCellLteRSRQ]
                      && [v5 hasCellLteRSRQ]
                      && (int v29 = [(BMDeviceConnectivityContext *)self cellLteRSRQ],
                          v29 == [v5 cellLteRSRQ]))
                    {
                      if (![(BMDeviceConnectivityContext *)self hasCellNrRSRP]
                        && ![v5 hasCellNrRSRP]
                        || [(BMDeviceConnectivityContext *)self hasCellNrRSRP]
                        && [v5 hasCellNrRSRP]
                        && (int v30 = [(BMDeviceConnectivityContext *)self cellNrRSRP],
                            v30 == [v5 cellNrRSRP]))
                      {
                        if (![(BMDeviceConnectivityContext *)self hasCellNrRSRQ]
                          && ![v5 hasCellNrRSRQ]
                          || [(BMDeviceConnectivityContext *)self hasCellNrRSRQ]
                          && [v5 hasCellNrRSRQ]
                          && (int v31 = [(BMDeviceConnectivityContext *)self cellNrRSRQ],
                              v31 == [v5 cellNrRSRQ]))
                        {
                          if (![(BMDeviceConnectivityContext *)self hasCellNrSNR]
                            && ![v5 hasCellNrSNR]
                            || [(BMDeviceConnectivityContext *)self hasCellNrSNR]
                            && [v5 hasCellNrSNR]
                            && (int v32 = [(BMDeviceConnectivityContext *)self cellNrSNR],
                                v32 == [v5 cellNrSNR]))
                          {
                            if (![(BMDeviceConnectivityContext *)self hasMaxDLCAConfigured]
                              && ![v5 hasMaxDLCAConfigured]
                              || [(BMDeviceConnectivityContext *)self hasMaxDLCAConfigured]
                              && [v5 hasMaxDLCAConfigured]
                              && (unsigned int v33 = [(BMDeviceConnectivityContext *)self maxDLCAConfigured],
                                  v33 == [v5 maxDLCAConfigured]))
                            {
                              if (![(BMDeviceConnectivityContext *)self hasTotalConfiguredBw]
                                && ![v5 hasTotalConfiguredBw]
                                || [(BMDeviceConnectivityContext *)self hasTotalConfiguredBw]
                                && [v5 hasTotalConfiguredBw]
                                && (unsigned int v34 = [(BMDeviceConnectivityContext *)self totalConfiguredBw],
                                    v34 == [v5 totalConfiguredBw]))
                              {
                                if (![(BMDeviceConnectivityContext *)self hasNrConfiguredBw]
                                  && ![v5 hasNrConfiguredBw]
                                  || [(BMDeviceConnectivityContext *)self hasNrConfiguredBw]
                                  && [v5 hasNrConfiguredBw]
                                  && (unsigned int v35 = [(BMDeviceConnectivityContext *)self nrConfiguredBw],
                                      v35 == [v5 nrConfiguredBw]))
                                {
                                  if (!-[BMDeviceConnectivityContext hasNrTotalScheduledMimoLayers](self, "hasNrTotalScheduledMimoLayers")&& ![v5 hasNrTotalScheduledMimoLayers]|| -[BMDeviceConnectivityContext hasNrTotalScheduledMimoLayers](self, "hasNrTotalScheduledMimoLayers")&& objc_msgSend(v5, "hasNrTotalScheduledMimoLayers")&& (unsigned int v36 = -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"), v36 == objc_msgSend(v5, "nrTotalScheduledMimoLayers")))
                                  {
                                    if (!-[BMDeviceConnectivityContext hasTotalConfiguredMimoLayers](self, "hasTotalConfiguredMimoLayers")&& ![v5 hasTotalConfiguredMimoLayers]|| -[BMDeviceConnectivityContext hasTotalConfiguredMimoLayers](self, "hasTotalConfiguredMimoLayers")&& objc_msgSend(v5, "hasTotalConfiguredMimoLayers")&& (unsigned int v37 = -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"), v37 == objc_msgSend(v5, "totalConfiguredMimoLayers")))
                                    {
                                      if (!-[BMDeviceConnectivityContext hasLteMaxScheduledMimoLayersInACell](self, "hasLteMaxScheduledMimoLayersInACell")&& ![v5 hasLteMaxScheduledMimoLayersInACell]|| -[BMDeviceConnectivityContext hasLteMaxScheduledMimoLayersInACell](self, "hasLteMaxScheduledMimoLayersInACell")&& objc_msgSend(v5, "hasLteMaxScheduledMimoLayersInACell")&& (unsigned int v38 = -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"), v38 == objc_msgSend(v5, "lteMaxScheduledMimoLayersInACell")))
                                      {
                                        if (!-[BMDeviceConnectivityContext hasNrMaxDlModulation](self, "hasNrMaxDlModulation")&& ![v5 hasNrMaxDlModulation]|| -[BMDeviceConnectivityContext hasNrMaxDlModulation](self, "hasNrMaxDlModulation")&& objc_msgSend(v5, "hasNrMaxDlModulation")&& (unsigned int v39 = -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"), v39 == objc_msgSend(v5, "nrMaxDlModulation")))
                                        {
                                          if (!-[BMDeviceConnectivityContext hasActualHighBandwidth](self, "hasActualHighBandwidth")&& ![v5 hasActualHighBandwidth]|| -[BMDeviceConnectivityContext hasActualHighBandwidth](self, "hasActualHighBandwidth")&& objc_msgSend(v5, "hasActualHighBandwidth")&& (unsigned int v40 = -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"), v40 == objc_msgSend(v5, "actualHighBandwidth")))
                                          {
                                            if (!-[BMDeviceConnectivityContext hasActualLowBandwidth](self, "hasActualLowBandwidth")&& ![v5 hasActualLowBandwidth]|| -[BMDeviceConnectivityContext hasActualLowBandwidth](self, "hasActualLowBandwidth")&& objc_msgSend(v5, "hasActualLowBandwidth")&& (unsigned int v41 = -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"), v41 == objc_msgSend(v5, "actualLowBandwidth")))
                                            {
                                              if (!-[BMDeviceConnectivityContext hasPActualLowBandwidth](self, "hasPActualLowBandwidth")&& ![v5 hasPActualLowBandwidth]|| -[BMDeviceConnectivityContext hasPActualLowBandwidth](self, "hasPActualLowBandwidth")&& objc_msgSend(v5, "hasPActualLowBandwidth")&& (unsigned int v42 = -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"), v42 == objc_msgSend(v5, "pActualLowBandwidth")))
                                              {
                                                if (!-[BMDeviceConnectivityContext hasMaxOfActualLowBandwidth](self, "hasMaxOfActualLowBandwidth")&& ![v5 hasMaxOfActualLowBandwidth]|| -[BMDeviceConnectivityContext hasMaxOfActualLowBandwidth](self, "hasMaxOfActualLowBandwidth")&& objc_msgSend(v5, "hasMaxOfActualLowBandwidth")&& (unsigned int v43 = -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"), v43 == objc_msgSend(v5, "maxOfActualLowBandwidth")))
                                                {
                                                  if (!-[BMDeviceConnectivityContext hasEstimatedHighBandwidth](self, "hasEstimatedHighBandwidth")&& ![v5 hasEstimatedHighBandwidth]|| -[BMDeviceConnectivityContext hasEstimatedHighBandwidth](self, "hasEstimatedHighBandwidth")&& objc_msgSend(v5, "hasEstimatedHighBandwidth")&& (unsigned int v44 = -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"), v44 == objc_msgSend(v5, "estimatedHighBandwidth")))
                                                  {
                                                    if (!-[BMDeviceConnectivityContext hasEstimatedLowBandwidth](self, "hasEstimatedLowBandwidth")&& ![v5 hasEstimatedLowBandwidth]|| -[BMDeviceConnectivityContext hasEstimatedLowBandwidth](self, "hasEstimatedLowBandwidth")&& objc_msgSend(v5, "hasEstimatedLowBandwidth")&& (unsigned int v45 = -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"), v45 == objc_msgSend(v5, "estimatedLowBandwidth")))
                                                    {
                                                      if (!-[BMDeviceConnectivityContext hasMovingAvgHighBandwidth](self, "hasMovingAvgHighBandwidth")&& ![v5 hasMovingAvgHighBandwidth]|| -[BMDeviceConnectivityContext hasMovingAvgHighBandwidth](self, "hasMovingAvgHighBandwidth")&& objc_msgSend(v5, "hasMovingAvgHighBandwidth")&& (unsigned int v46 = -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"), v46 == objc_msgSend(v5, "movingAvgHighBandwidth")))
                                                      {
                                                        if (!-[BMDeviceConnectivityContext hasMovingAvgLowBandwidth](self, "hasMovingAvgLowBandwidth")&& ![v5 hasMovingAvgLowBandwidth]|| -[BMDeviceConnectivityContext hasMovingAvgLowBandwidth](self, "hasMovingAvgLowBandwidth")&& objc_msgSend(v5, "hasMovingAvgLowBandwidth")&& (unsigned int v47 = -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"), v47 == objc_msgSend(v5, "movingAvgLowBandwidth")))
                                                        {
                                                          if (!-[BMDeviceConnectivityContext hasCmDataSentCount](self, "hasCmDataSentCount")&& ![v5 hasCmDataSentCount]|| -[BMDeviceConnectivityContext hasCmDataSentCount](self, "hasCmDataSentCount")&& objc_msgSend(v5, "hasCmDataSentCount")&& (unsigned int v48 = -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"), v48 == objc_msgSend(v5, "cmDataSentCount")))
                                                          {
                                                            if (!-[BMDeviceConnectivityContext hasCmDataSentDuration](self, "hasCmDataSentDuration")&& ![v5 hasCmDataSentDuration]|| -[BMDeviceConnectivityContext hasCmDataSentDuration](self, "hasCmDataSentDuration")&& objc_msgSend(v5, "hasCmDataSentDuration")&& (unsigned int v49 = -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"), v49 == objc_msgSend(v5, "cmDataSentDuration")))
                                                            {
                                                              if (!-[BMDeviceConnectivityContext hasTcpRTTAvg](self, "hasTcpRTTAvg")&& ![v5 hasTcpRTTAvg]|| -[BMDeviceConnectivityContext hasTcpRTTAvg](self, "hasTcpRTTAvg")&& objc_msgSend(v5, "hasTcpRTTAvg")&& (unsigned int v50 = -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"), v50 == objc_msgSend(v5, "tcpRTTAvg")))
                                                              {
                                                                if (!-[BMDeviceConnectivityContext hasTcpRTTvar](self, "hasTcpRTTvar")&& ![v5 hasTcpRTTvar]|| -[BMDeviceConnectivityContext hasTcpRTTvar](self, "hasTcpRTTvar")&& objc_msgSend(v5, "hasTcpRTTvar")&& (unsigned int v51 = -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"), v51 == objc_msgSend(v5, "tcpRTTvar")))
                                                                {
                                                                  if (!-[BMDeviceConnectivityContext hasVideoStreamingStallTime](self, "hasVideoStreamingStallTime")&& ![v5 hasVideoStreamingStallTime]|| -[BMDeviceConnectivityContext hasVideoStreamingStallTime](self, "hasVideoStreamingStallTime")&& objc_msgSend(v5, "hasVideoStreamingStallTime")&& (unsigned int v52 = -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"), v52 == objc_msgSend(v5, "videoStreamingStallTime")))
                                                                  {
                                                                    if (!-[BMDeviceConnectivityContext hasNumStall](self, "hasNumStall")&& ![v5 hasNumStall]|| -[BMDeviceConnectivityContext hasNumStall](self, "hasNumStall")&& objc_msgSend(v5, "hasNumStall")&& (unsigned int v53 = -[BMDeviceConnectivityContext numStall](self, "numStall"), v53 == objc_msgSend(v5, "numStall")))
                                                                    {
                                                                      if (!-[BMDeviceConnectivityContext hasStallDuration](self, "hasStallDuration")&& ![v5 hasStallDuration]|| -[BMDeviceConnectivityContext hasStallDuration](self, "hasStallDuration")&& objc_msgSend(v5, "hasStallDuration")&& (unsigned int v54 = -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"), v54 == objc_msgSend(v5, "stallDuration")))
                                                                      {
                                                                        if (!-[BMDeviceConnectivityContext hasCellEstimatedBW](self, "hasCellEstimatedBW")&& ![v5 hasCellEstimatedBW]|| -[BMDeviceConnectivityContext hasCellEstimatedBW](self, "hasCellEstimatedBW")&& objc_msgSend(v5, "hasCellEstimatedBW")&& (unsigned int v55 = -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"), v55 == objc_msgSend(v5, "cellEstimatedBW")))
                                                                        {
                                                                          if (!-[BMDeviceConnectivityContext hasCellLoad](self, "hasCellLoad")&& ![v5 hasCellLoad]|| -[BMDeviceConnectivityContext hasCellLoad](self, "hasCellLoad")&& objc_msgSend(v5, "hasCellLoad")&& (unsigned int v56 = -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"), v56 == objc_msgSend(v5, "cellLoad")))
                                                                          {
                                                                            if (!-[BMDeviceConnectivityContext hasCellModelConfidenceLevel](self, "hasCellModelConfidenceLevel")&& ![v5 hasCellModelConfidenceLevel]|| -[BMDeviceConnectivityContext hasCellModelConfidenceLevel](self, "hasCellModelConfidenceLevel")&& objc_msgSend(v5, "hasCellModelConfidenceLevel")&& (unsigned int v57 = -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"), v57 == objc_msgSend(v5, "cellModelConfidenceLevel")))
                                                                            {
                                                                              if (!-[BMDeviceConnectivityContext hasMlPredictedCellBW](self, "hasMlPredictedCellBW")&& ![v5 hasMlPredictedCellBW]|| -[BMDeviceConnectivityContext hasMlPredictedCellBW](self, "hasMlPredictedCellBW")&& objc_msgSend(v5, "hasMlPredictedCellBW")&& (unsigned int v58 = -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"), v58 == objc_msgSend(v5, "mlPredictedCellBW")))
                                                                              {
                                                                                if (!-[BMDeviceConnectivityContext hasQbssLoad](self, "hasQbssLoad")&& ![v5 hasQbssLoad]|| -[BMDeviceConnectivityContext hasQbssLoad](self, "hasQbssLoad")&& objc_msgSend(v5, "hasQbssLoad")&& (unsigned int v59 = -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"), v59 == objc_msgSend(v5, "qbssLoad")))
                                                                                {
                                                                                  if (!-[BMDeviceConnectivityContext hasLqmScorecellular](self, "hasLqmScorecellular")&& ![v5 hasLqmScorecellular])
                                                                                  {
                                                                                    BOOL v12 = 1;
                                                                                    goto LABEL_222;
                                                                                  }
                                                                                  if (-[BMDeviceConnectivityContext hasLqmScorecellular](self, "hasLqmScorecellular")&& [v5 hasLqmScorecellular])
                                                                                  {
                                                                                    unsigned int v60 = [(BMDeviceConnectivityContext *)self lqmScorecellular];
                                                                                    BOOL v12 = v60 == [v5 lqmScorecellular];
LABEL_222:

                                                                                    goto LABEL_223;
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_221:
    BOOL v12 = 0;
    goto LABEL_222;
  }
  BOOL v12 = 0;
LABEL_223:

  return v12;
}

- (id)jsonDictionary
{
  v142[44] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDeviceConnectivityContext *)self geohash];
  if ([(BMDeviceConnectivityContext *)self hasCounter])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext counter](self, "counter"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasEvent])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext event](self, "event"));
    id v104 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v104 = 0;
  }
  uint64_t v5 = [(BMDeviceConnectivityContext *)self ratType];
  if ([(BMDeviceConnectivityContext *)self hasRrcState])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext rrcState](self, "rrcState"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellNsaEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceConnectivityContext cellNsaEnabled](self, "cellNsaEnabled"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasIsFR1])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceConnectivityContext isFR1](self, "isFR1"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellARFCN])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellARFCN](self, "cellARFCN"));
    id v140 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v140 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellBandInfo])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellBandInfo](self, "cellBandInfo"));
    id v139 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v139 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellChannelBW])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellChannelBW](self, "cellChannelBW"));
    id v138 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v138 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellRsrp])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellRsrp](self, "cellRsrp"));
    id v137 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v137 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellSinr])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellSinr](self, "cellSinr"));
    id v136 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v136 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellLteRSRQ])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellLteRSRQ](self, "cellLteRSRQ"));
    id v135 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v135 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellNrRSRP])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRP](self, "cellNrRSRP"));
    id v134 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v134 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellNrRSRQ])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRQ](self, "cellNrRSRQ"));
    id v133 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v133 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellNrSNR])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrSNR](self, "cellNrSNR"));
    id v132 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v132 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasMaxDLCAConfigured])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxDLCAConfigured](self, "maxDLCAConfigured"));
    id v131 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v131 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasTotalConfiguredBw])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredBw](self, "totalConfiguredBw"));
    id v130 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v130 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasNrConfiguredBw])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrConfiguredBw](self, "nrConfiguredBw"));
    id v129 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v129 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasNrTotalScheduledMimoLayers])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"));
    id v128 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v128 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasTotalConfiguredMimoLayers])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"));
    id v127 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v127 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasLteMaxScheduledMimoLayersInACell])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"));
    id v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v126 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasNrMaxDlModulation])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"));
    id v125 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v125 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasActualHighBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"));
    id v124 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v124 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasActualLowBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"));
    id v123 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v123 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasPActualLowBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"));
    id v122 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v122 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasMaxOfActualLowBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"));
    id v121 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v121 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasEstimatedHighBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"));
    id v120 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v120 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasEstimatedLowBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"));
    id v119 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v119 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasMovingAvgHighBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"));
    id v118 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v118 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasMovingAvgLowBandwidth])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"));
    id v117 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v117 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCmDataSentCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"));
    id v116 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v116 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCmDataSentDuration])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"));
    id v115 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v115 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasTcpRTTAvg])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"));
    id v114 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v114 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasTcpRTTvar])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"));
    id v113 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v113 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasVideoStreamingStallTime])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"));
    id v112 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v112 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasNumStall])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext numStall](self, "numStall"));
    id v111 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v111 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasStallDuration])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"));
    id v110 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v110 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellEstimatedBW])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"));
    id v109 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v109 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellLoad])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"));
    id v108 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v108 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasCellModelConfidenceLevel])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"));
    id v107 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v107 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasMlPredictedCellBW])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"));
    id v106 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v106 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasQbssLoad])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"));
    id v105 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v105 = 0;
  }
  if ([(BMDeviceConnectivityContext *)self hasLqmScorecellular])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lqmScorecellular](self, "lqmScorecellular"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  v141[0] = @"geohash";
  uint64_t v10 = v3;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v10;
  v142[0] = v10;
  v141[1] = @"counter";
  uint64_t v11 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)v11;
  v142[1] = v11;
  v141[2] = @"event";
  uint64_t v12 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v93 = (void *)v12;
  v142[2] = v12;
  v141[3] = @"ratType";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)v13;
  v142[3] = v13;
  v141[4] = @"rrcState";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)v14;
  v142[4] = v14;
  v141[5] = @"cellNsaEnabled";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v90 = (void *)v15;
  v142[5] = v15;
  v141[6] = @"isFR1";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)v16;
  v142[6] = v16;
  v141[7] = @"cellARFCN";
  uint64_t v17 = (uint64_t)v140;
  if (!v140)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v142[7] = v17;
  v141[8] = @"cellBandInfo";
  uint64_t v18 = (uint64_t)v139;
  if (!v139)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v142[8] = v18;
  v141[9] = @"cellChannelBW";
  uint64_t v19 = (uint64_t)v138;
  if (!v138)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v20 = (void *)v5;
  v98 = (void *)v19;
  v142[9] = v19;
  v141[10] = @"cellRsrp";
  uint64_t v21 = (uint64_t)v137;
  if (!v137)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v22 = (void *)v3;
  v97 = (void *)v21;
  v142[10] = v21;
  v141[11] = @"cellSinr";
  uint64_t v23 = (uint64_t)v136;
  if (!v136)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v24 = (void *)v23;
  v142[11] = v23;
  v141[12] = @"cellLteRSRQ";
  uint64_t v25 = (uint64_t)v135;
  if (!v135)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)v25;
  v142[12] = v25;
  v141[13] = @"cellNrRSRP";
  uint64_t v26 = (uint64_t)v134;
  if (!v134)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)v26;
  v142[13] = v26;
  v141[14] = @"cellNrRSRQ";
  uint64_t v27 = (uint64_t)v133;
  if (!v133)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = (void *)v27;
  v142[14] = v27;
  v141[15] = @"cellNrSNR";
  uint64_t v28 = (uint64_t)v132;
  if (!v132)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)v28;
  v142[15] = v28;
  v141[16] = @"maxDLCAConfigured";
  uint64_t v29 = (uint64_t)v131;
  if (!v131)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)v29;
  v142[16] = v29;
  v141[17] = @"totalConfiguredBw";
  uint64_t v30 = (uint64_t)v130;
  if (!v130)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v81 = (void *)v30;
  v142[17] = v30;
  v141[18] = @"nrConfiguredBw";
  uint64_t v31 = (uint64_t)v129;
  if (!v129)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = (void *)v31;
  v142[18] = v31;
  v141[19] = @"nrTotalScheduledMimoLayers";
  uint64_t v32 = (uint64_t)v128;
  if (!v128)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)v32;
  v142[19] = v32;
  v141[20] = @"totalConfiguredMimoLayers";
  uint64_t v33 = (uint64_t)v127;
  if (!v127)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = (void *)v33;
  v142[20] = v33;
  v141[21] = @"lteMaxScheduledMimoLayersInACell";
  uint64_t v34 = (uint64_t)v126;
  if (!v126)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v34;
  v142[21] = v34;
  v141[22] = @"nrMaxDlModulation";
  uint64_t v35 = (uint64_t)v125;
  if (!v125)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)v35;
  v142[22] = v35;
  v141[23] = @"actualHighBandwidth";
  uint64_t v36 = (uint64_t)v124;
  if (!v124)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v36;
  v142[23] = v36;
  v141[24] = @"actualLowBandwidth";
  uint64_t v37 = (uint64_t)v123;
  if (!v123)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v37;
  v142[24] = v37;
  v141[25] = @"pActualLowBandwidth";
  uint64_t v38 = (uint64_t)v122;
  if (!v122)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v38;
  v142[25] = v38;
  v141[26] = @"maxOfActualLowBandwidth";
  uint64_t v39 = (uint64_t)v121;
  if (!v121)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)v39;
  v142[26] = v39;
  v141[27] = @"estimatedHighBandwidth";
  uint64_t v40 = (uint64_t)v120;
  if (!v120)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v40;
  v142[27] = v40;
  v141[28] = @"estimatedLowBandwidth";
  uint64_t v41 = (uint64_t)v119;
  if (!v119)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v41;
  v142[28] = v41;
  v141[29] = @"movingAvgHighBandwidth";
  uint64_t v42 = (uint64_t)v118;
  if (!v118)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v42;
  v142[29] = v42;
  v141[30] = @"movingAvgLowBandwidth";
  uint64_t v43 = (uint64_t)v117;
  if (!v117)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v43;
  v142[30] = v43;
  v141[31] = @"cmDataSentCount";
  uint64_t v44 = (uint64_t)v116;
  if (!v116)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v44;
  v142[31] = v44;
  v141[32] = @"cmDataSentDuration";
  uint64_t v45 = (uint64_t)v115;
  if (!v115)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = (void *)v45;
  v142[32] = v45;
  v141[33] = @"tcpRTTAvg";
  uint64_t v46 = (uint64_t)v114;
  if (!v114)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v46;
  v142[33] = v46;
  v141[34] = @"tcpRTTvar";
  uint64_t v47 = (uint64_t)v113;
  if (!v113)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = v4;
  v64 = (void *)v47;
  v142[34] = v47;
  v141[35] = @"videoStreamingStallTime";
  uint64_t v48 = (uint64_t)v112;
  if (!v112)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = v6;
  v63 = (void *)v48;
  v142[35] = v48;
  v141[36] = @"numStall";
  uint64_t v49 = (uint64_t)v111;
  if (!v111)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v88 = (void *)v17;
  v62 = (void *)v49;
  v142[36] = v49;
  v141[37] = @"stallDuration";
  uint64_t v50 = (uint64_t)v110;
  if (!v110)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = v7;
  uint64_t v60 = v50;
  v142[37] = v50;
  v141[38] = @"cellEstimatedBW";
  unsigned int v51 = v109;
  if (!v109)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v50, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77,
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      v84,
      v85,
    unsigned int v51 = v86);
  }
  v99 = v22;
  v142[38] = v51;
  v141[39] = @"cellLoad";
  unsigned int v52 = v108;
  if (!v108)
  {
    unsigned int v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = (void *)v18;
  v103 = v9;
  v142[39] = v52;
  v141[40] = @"cellModelConfidenceLevel";
  unsigned int v53 = v107;
  if (!v107)
  {
    unsigned int v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v142[40] = v53;
  v141[41] = @"mlPredictedCellBW";
  unsigned int v54 = v106;
  if (!v106)
  {
    unsigned int v54 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v55 = v8;
  v142[41] = v54;
  v141[42] = @"qbssLoad";
  unsigned int v56 = v105;
  if (!v105)
  {
    unsigned int v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v142[42] = v56;
  v141[43] = @"lqmScorecellular";
  id v57 = v9;
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v142[43] = v9;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v142, v141, 44, v60);
  id v96 = (id)objc_claimAutoreleasedReturnValue();
  if (!v57) {

  }
  unsigned int v58 = v24;
  if (!v105)
  {

    unsigned int v58 = v24;
  }
  if (!v106)
  {

    unsigned int v58 = v24;
  }
  if (!v107)
  {

    unsigned int v58 = v24;
  }
  if (!v108)
  {

    unsigned int v58 = v24;
  }
  if (!v109)
  {

    unsigned int v58 = v24;
  }
  if (!v110)
  {

    unsigned int v58 = v24;
  }
  if (!v111)
  {

    unsigned int v58 = v24;
  }
  if (!v112)
  {

    unsigned int v58 = v24;
  }
  if (!v113)
  {

    unsigned int v58 = v24;
  }
  if (!v114)
  {

    unsigned int v58 = v24;
  }
  if (!v115)
  {

    unsigned int v58 = v24;
  }
  if (!v116)
  {

    unsigned int v58 = v24;
  }
  if (!v117)
  {

    unsigned int v58 = v24;
  }
  if (!v118)
  {

    unsigned int v58 = v24;
  }
  if (!v119)
  {

    unsigned int v58 = v24;
  }
  if (!v120)
  {

    unsigned int v58 = v24;
  }
  if (!v121)
  {

    unsigned int v58 = v24;
  }
  if (!v122)
  {

    unsigned int v58 = v24;
  }
  if (!v123)
  {

    unsigned int v58 = v24;
  }
  if (!v124)
  {

    unsigned int v58 = v24;
  }
  if (!v125)
  {

    unsigned int v58 = v24;
  }
  if (!v126)
  {

    unsigned int v58 = v24;
  }
  if (!v127)
  {

    unsigned int v58 = v24;
  }
  if (!v128)
  {

    unsigned int v58 = v24;
  }
  if (!v129)
  {

    unsigned int v58 = v24;
  }
  if (!v130)
  {

    unsigned int v58 = v24;
  }
  if (!v131)
  {

    unsigned int v58 = v24;
  }
  if (!v132)
  {

    unsigned int v58 = v24;
  }
  if (!v133)
  {

    unsigned int v58 = v24;
  }
  if (!v134)
  {

    unsigned int v58 = v24;
  }
  if (!v135)
  {

    unsigned int v58 = v24;
  }
  if (!v136) {

  }
  if (!v137) {
  if (!v138)
  }

  if (!v139) {
  if (v140)
  }
  {
    if (v55) {
      goto LABEL_289;
    }
  }
  else
  {

    if (v55)
    {
LABEL_289:
      if (v100) {
        goto LABEL_290;
      }
      goto LABEL_300;
    }
  }

  if (v100)
  {
LABEL_290:
    if (v101) {
      goto LABEL_291;
    }
    goto LABEL_301;
  }
LABEL_300:

  if (v101)
  {
LABEL_291:
    if (v20) {
      goto LABEL_292;
    }
    goto LABEL_302;
  }
LABEL_301:

  if (v20)
  {
LABEL_292:
    if (v104) {
      goto LABEL_293;
    }
    goto LABEL_303;
  }
LABEL_302:

  if (v104)
  {
LABEL_293:
    if (v102) {
      goto LABEL_294;
    }
LABEL_304:

    if (v99) {
      goto LABEL_295;
    }
    goto LABEL_305;
  }
LABEL_303:

  if (!v102) {
    goto LABEL_304;
  }
LABEL_294:
  if (v99) {
    goto LABEL_295;
  }
LABEL_305:

LABEL_295:

  return v96;
}

- (BMDeviceConnectivityContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v491[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v403 = [v6 objectForKeyedSubscript:@"geohash"];
  if (!v403 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v401 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v401 = v403;
LABEL_4:
    v402 = [v6 objectForKeyedSubscript:@"counter"];
    if (!v402 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v400 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v400 = v402;
LABEL_7:
      id v7 = [v6 objectForKeyedSubscript:@"event"];
      if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v8 = a4;
        a4 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = a4;
        a4 = v7;
LABEL_10:
        id v9 = [v6 objectForKeyedSubscript:@"ratType"];
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v398 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v398 = v9;
LABEL_13:
          uint64_t v10 = [v6 objectForKeyedSubscript:@"rrcState"];
          v395 = self;
          if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v392 = v10;
            id v396 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v392 = v10;
            id v396 = v10;
LABEL_16:
            v399 = [v6 objectForKeyedSubscript:@"cellNsaEnabled"];
            if (!v399 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v394 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v394 = v399;
LABEL_19:
              v397 = [v6 objectForKeyedSubscript:@"isFR1"];
              v389 = a4;
              if (!v397 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v391 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v391 = v397;
LABEL_22:
                uint64_t v11 = [v6 objectForKeyedSubscript:@"cellARFCN"];
                v390 = (void *)v11;
                if (!v11 || (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v388 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v388 = v12;
LABEL_25:
                  uint64_t v13 = [v6 objectForKeyedSubscript:@"cellBandInfo"];
                  v349 = (void *)v13;
                  if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v348 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v348 = v14;
LABEL_28:
                    uint64_t v15 = [v6 objectForKeyedSubscript:@"cellChannelBW"];
                    v346 = (void *)v15;
                    if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v345 = 0;
LABEL_31:
                      uint64_t v17 = [v6 objectForKeyedSubscript:@"cellRsrp"];
                      v344 = v17;
                      if (!v17) {
                        goto LABEL_69;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v17 = 0;
                        goto LABEL_69;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        uint64_t v17 = v17;
LABEL_69:
                        [v6 objectForKeyedSubscript:@"cellSinr"];
                        v49 = uint64_t v48 = v8;
                        v342 = v17;
                        if (!v49 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v341 = 0;
                          goto LABEL_72;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v341 = v49;
LABEL_72:
                          uint64_t v50 = [v6 objectForKeyedSubscript:@"cellLteRSRQ"];
                          v343 = (void *)v50;
                          if (!v50 || (unsigned int v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            v336 = 0;
                            goto LABEL_75;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v336 = v51;
LABEL_75:
                            uint64_t v52 = [v6 objectForKeyedSubscript:@"cellNrRSRP"];
                            v337 = (void *)v52;
                            if (!v52 || (unsigned int v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              unsigned int v54 = v49;
                              id v338 = 0;
                              goto LABEL_78;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              unsigned int v54 = v49;
                              id v338 = v53;
LABEL_78:
                              uint64_t v55 = [v6 objectForKeyedSubscript:@"cellNrRSRQ"];
                              v333 = v54;
                              v335 = (void *)v55;
                              if (!v55 || (unsigned int v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v57 = 0;
                                goto LABEL_81;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v57 = v56;
LABEL_81:
                                uint64_t v58 = [v6 objectForKeyedSubscript:@"cellNrSNR"];
                                v334 = (void *)v58;
                                if (!v58 || (unsigned int v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v329 = v48;
                                  id v339 = 0;
LABEL_84:
                                  id v330 = v57;
                                  uint64_t v60 = [v6 objectForKeyedSubscript:@"maxDLCAConfigured"];
                                  v331 = (void *)v60;
                                  if (!v60)
                                  {
                                    id v332 = 0;
                                    id v63 = v339;
                                    goto LABEL_119;
                                  }
                                  v61 = (void *)v60;
                                  objc_opt_class();
                                  v62 = v339;
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v63 = v339;
                                    id v332 = 0;
                                    goto LABEL_119;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v63 = v339;
                                    id v332 = v61;
LABEL_119:
                                    uint64_t v89 = [v6 objectForKeyedSubscript:@"totalConfiguredBw"];
                                    v328 = (void *)v89;
                                    if (!v89
                                      || (v90 = (void *)v89, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v91 = 0;
LABEL_122:
                                      [v6 objectForKeyedSubscript:@"nrConfiguredBw"];
                                      v62 = v63;
                                      id v92 = (id)objc_claimAutoreleasedReturnValue();
                                      v327 = v92;
                                      v340 = v62;
                                      if (!v92) {
                                        goto LABEL_137;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v92 = 0;
                                        goto LABEL_137;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v92 = v92;
LABEL_137:
                                        id v101 = v91;
                                        uint64_t v102 = [v6 objectForKeyedSubscript:@"nrTotalScheduledMimoLayers"];
                                        v325 = (void *)v102;
                                        v326 = v92;
                                        if (!v102
                                          || (v103 = (void *)v102, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v324 = 0;
LABEL_140:
                                          uint64_t v104 = [v6 objectForKeyedSubscript:@"totalConfiguredMimoLayers"];
                                          id v105 = v101;
                                          v323 = (void *)v104;
                                          if (!v104)
                                          {
                                            id v322 = 0;
                                            v62 = v340;
                                            goto LABEL_156;
                                          }
                                          id v106 = (void *)v104;
                                          objc_opt_class();
                                          v62 = v340;
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v322 = 0;
                                            goto LABEL_156;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v322 = v106;
LABEL_156:
                                            uint64_t v115 = [v6 objectForKeyedSubscript:@"lteMaxScheduledMimoLayersInACell"];
                                            v321 = (void *)v115;
                                            if (!v115
                                              || (id v116 = (void *)v115,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v320 = 0;
                                              goto LABEL_159;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v320 = v116;
LABEL_159:
                                              uint64_t v117 = [v6 objectForKeyedSubscript:@"nrMaxDlModulation"];
                                              v319 = (void *)v117;
                                              if (!v117
                                                || (id v118 = (void *)v117,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v318 = 0;
                                                goto LABEL_162;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v318 = v118;
LABEL_162:
                                                uint64_t v119 = [v6 objectForKeyedSubscript:@"actualHighBandwidth"];
                                                v317 = (void *)v119;
                                                if (!v119
                                                  || (id v120 = (void *)v119,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v316 = 0;
                                                  goto LABEL_165;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v316 = v120;
LABEL_165:
                                                  uint64_t v121 = [v6 objectForKeyedSubscript:@"actualLowBandwidth"];
                                                  v315 = (void *)v121;
                                                  if (!v121
                                                    || (id v122 = (void *)v121,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v314 = 0;
                                                    goto LABEL_168;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v314 = v122;
LABEL_168:
                                                    uint64_t v123 = [v6 objectForKeyedSubscript:@"pActualLowBandwidth"];
                                                    v313 = (void *)v123;
                                                    if (!v123
                                                      || (id v124 = (void *)v123,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v312 = 0;
                                                      goto LABEL_171;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v312 = v124;
LABEL_171:
                                                      uint64_t v125 = [v6 objectForKeyedSubscript:@"maxOfActualLowBandwidth"];
                                                      v311 = (void *)v125;
                                                      if (!v125
                                                        || (id v126 = (void *)v125,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v310 = 0;
                                                        goto LABEL_174;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v310 = v126;
LABEL_174:
                                                        uint64_t v127 = [v6 objectForKeyedSubscript:@"estimatedHighBandwidth"];
                                                        v309 = (void *)v127;
                                                        if (!v127
                                                          || (id v128 = (void *)v127,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v308 = 0;
                                                          goto LABEL_177;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v308 = v128;
LABEL_177:
                                                          uint64_t v129 = [v6 objectForKeyedSubscript:@"estimatedLowBandwidth"];
                                                          v307 = (void *)v129;
                                                          if (!v129
                                                            || (id v130 = (void *)v129,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v306 = 0;
                                                            goto LABEL_180;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v306 = v130;
LABEL_180:
                                                            uint64_t v131 = [v6 objectForKeyedSubscript:@"movingAvgHighBandwidth"];
                                                            v305 = (void *)v131;
                                                            if (!v131
                                                              || (id v132 = (void *)v131,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v304 = 0;
                                                              goto LABEL_183;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v304 = v132;
LABEL_183:
                                                              uint64_t v133 = [v6 objectForKeyedSubscript:@"movingAvgLowBandwidth"];
                                                              v303 = (void *)v133;
                                                              if (!v133
                                                                || (id v134 = (void *)v133,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v302 = 0;
                                                                goto LABEL_186;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v302 = v134;
LABEL_186:
                                                                uint64_t v135 = [v6 objectForKeyedSubscript:@"cmDataSentCount"];
                                                                v300 = (void *)v135;
                                                                if (!v135
                                                                  || (id v136 = (void *)v135,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v301 = 0;
                                                                  goto LABEL_189;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v301 = v136;
LABEL_189:
                                                                  uint64_t v137 = [v6 objectForKeyedSubscript:@"cmDataSentDuration"];
                                                                  v298 = (void *)v137;
                                                                  if (!v137
                                                                    || (id v138 = (void *)v137,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v299 = 0;
                                                                    goto LABEL_192;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v299 = v138;
LABEL_192:
                                                                    uint64_t v139 = [v6 objectForKeyedSubscript:@"tcpRTTAvg"];
                                                                    v296 = (void *)v139;
                                                                    if (!v139
                                                                      || (id v140 = (void *)v139,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v297 = 0;
LABEL_195:
                                                                      uint64_t v141 = [v6 objectForKeyedSubscript:@"tcpRTTvar"];
                                                                      v294 = (void *)v141;
                                                                      if (v141
                                                                        && (v142 = (void *)v141,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v235 = v105;
                                                                          if (!v329)
                                                                          {
                                                                            id v295 = 0;
                                                                            int v20 = 0;
                                                                            uint64_t v37 = v392;
                                                                            v82 = v341;
                                                                            uint64_t v48 = v336;
                                                                            id v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_365;
                                                                          }
                                                                          id v236 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          v380 = v9;
                                                                          uint64_t v237 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v422 = *MEMORY[0x1E4F28568];
                                                                          id v293 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tcpRTTvar"];
                                                                          id v423 = v293;
                                                                          uint64_t v238 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v423 forKeys:&v422 count:1];
                                                                          uint64_t v239 = v237;
                                                                          id v9 = v380;
                                                                          int v20 = 0;
                                                                          id v295 = 0;
                                                                          void *v329 = (id)[v236 initWithDomain:v239 code:2 userInfo:v238];
                                                                          v240 = (void *)v238;
                                                                          uint64_t v37 = v392;
                                                                          v82 = v341;
                                                                          uint64_t v48 = v336;
                                                                          id v57 = v330;
                                                                          id v105 = v235;
                                                                          v62 = v340;
LABEL_364:

LABEL_365:
                                                                          v234 = v294;
                                                                          goto LABEL_366;
                                                                        }
                                                                        id v295 = v142;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v295 = 0;
                                                                      }
                                                                      uint64_t v143 = [v6 objectForKeyedSubscript:@"videoStreamingStallTime"];
                                                                      v291 = (void *)v143;
                                                                      if (v143
                                                                        && (v144 = (void *)v143,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          v241 = v105;
                                                                          if (!v329)
                                                                          {
                                                                            id v293 = 0;
                                                                            int v20 = 0;
                                                                            uint64_t v37 = v392;
                                                                            v82 = v341;
                                                                            uint64_t v48 = v336;
                                                                            id v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_363;
                                                                          }
                                                                          id v242 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          v381 = v9;
                                                                          uint64_t v243 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v420 = *MEMORY[0x1E4F28568];
                                                                          id v292 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"videoStreamingStallTime"];
                                                                          id v421 = v292;
                                                                          uint64_t v244 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v421 forKeys:&v420 count:1];
                                                                          uint64_t v245 = v243;
                                                                          id v9 = v381;
                                                                          int v20 = 0;
                                                                          id v293 = 0;
                                                                          void *v329 = (id)[v242 initWithDomain:v245 code:2 userInfo:v244];
                                                                          v246 = (void *)v244;
                                                                          uint64_t v37 = v392;
                                                                          v82 = v341;
                                                                          uint64_t v48 = v336;
                                                                          id v57 = v330;
                                                                          id v105 = v241;
                                                                          v62 = v340;
LABEL_362:

LABEL_363:
                                                                          v240 = v291;
                                                                          goto LABEL_364;
                                                                        }
                                                                        id v293 = v144;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v293 = 0;
                                                                      }
                                                                      uint64_t v145 = [v6 objectForKeyedSubscript:@"numStall"];
                                                                      v289 = (void *)v145;
                                                                      if (v145
                                                                        && (v146 = (void *)v145,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          if (!v329)
                                                                          {
                                                                            id v292 = 0;
                                                                            int v20 = 0;
                                                                            uint64_t v37 = v392;
                                                                            v82 = v341;
                                                                            uint64_t v48 = v336;
                                                                            id v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_361;
                                                                          }
                                                                          id v247 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          v382 = v9;
                                                                          uint64_t v248 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v418 = *MEMORY[0x1E4F28568];
                                                                          id v290 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numStall"];
                                                                          id v419 = v290;
                                                                          uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v419 forKeys:&v418 count:1];
                                                                          uint64_t v250 = v248;
                                                                          id v9 = v382;
                                                                          v288 = (void *)v249;
                                                                          int v20 = 0;
                                                                          id v292 = 0;
                                                                          void *v329 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v250, 2);
                                                                          goto LABEL_413;
                                                                        }
                                                                        id v292 = v146;
                                                                      }
                                                                      else
                                                                      {
                                                                        id v292 = 0;
                                                                      }
                                                                      uint64_t v147 = [v6 objectForKeyedSubscript:@"stallDuration"];
                                                                      v288 = (void *)v147;
                                                                      if (!v147
                                                                        || (v148 = (void *)v147,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v290 = 0;
                                                                        goto LABEL_207;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v290 = v148;
LABEL_207:
                                                                        uint64_t v149 = [v6 objectForKeyedSubscript:@"cellEstimatedBW"];
                                                                        v286 = (void *)v149;
                                                                        if (!v149
                                                                          || (v150 = (void *)v149,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v287 = 0;
                                                                          goto LABEL_210;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v287 = v150;
LABEL_210:
                                                                          uint64_t v151 = [v6 objectForKeyedSubscript:@"cellLoad"];
                                                                          v284 = (void *)v151;
                                                                          if (!v151
                                                                            || (v152 = (void *)v151,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v285 = 0;
                                                                            goto LABEL_213;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v285 = v152;
LABEL_213:
                                                                            uint64_t v153 = [v6 objectForKeyedSubscript:@"cellModelConfidenceLevel"];
                                                                            v281 = (void *)v153;
                                                                            if (!v153
                                                                              || (v154 = (void *)v153,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v283 = 0;
LABEL_216:
                                                                              uint64_t v155 = [v6 objectForKeyedSubscript:@"mlPredictedCellBW"];
                                                                              v280 = (void *)v155;
                                                                              if (v155
                                                                                && (v156 = (void *)v155,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (!v329)
                                                                                  {
                                                                                    id v282 = 0;
                                                                                    int v20 = 0;
                                                                                    uint64_t v37 = v392;
                                                                                    v82 = v341;
                                                                                    uint64_t v48 = v336;
                                                                                    v62 = v340;
                                                                                    id v57 = v330;
                                                                                    goto LABEL_356;
                                                                                  }
                                                                                  id v268 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v269 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v408 = *MEMORY[0x1E4F28568];
                                                                                  id v393 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mlPredictedCellBW"];
                                                                                  id v409 = v393;
                                                                                  v347 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v409 forKeys:&v408 count:1];
                                                                                  id v270 = (id)objc_msgSend(v268, "initWithDomain:code:userInfo:", v269, 2);
                                                                                  int v20 = 0;
                                                                                  id v282 = 0;
                                                                                  void *v329 = v270;
                                                                                  goto LABEL_425;
                                                                                }
                                                                                id v282 = v156;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v282 = 0;
                                                                              }
                                                                              uint64_t v157 = [v6 objectForKeyedSubscript:@"qbssLoad"];
                                                                              v347 = (void *)v157;
                                                                              if (!v157
                                                                                || (v158 = (void *)v157,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v393 = 0;
LABEL_222:
                                                                                id v159 = [v6 objectForKeyedSubscript:@"lqmScorecellular"];
                                                                                id v57 = v330;
                                                                                v279 = v159;
                                                                                if (v159)
                                                                                {
                                                                                  v160 = v159;
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    id v159 = 0;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                    {
                                                                                      v387 = v9;
                                                                                      if (v329)
                                                                                      {
                                                                                        id v274 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v275 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v404 = *MEMORY[0x1E4F28568];
                                                                                        v276 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lqmScorecellular"];
                                                                                        v405 = v276;
                                                                                        v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v405 forKeys:&v404 count:1];
                                                                                        void *v329 = (id)[v274 initWithDomain:v275 code:2 userInfo:v277];
                                                                                      }
                                                                                      v278 = 0;
                                                                                      int v20 = 0;
                                                                                      id v9 = v387;
                                                                                      uint64_t v37 = v392;
                                                                                      v82 = v341;
                                                                                      uint64_t v48 = v336;
                                                                                      goto LABEL_354;
                                                                                    }
                                                                                    id v159 = v160;
                                                                                  }
                                                                                }
                                                                                uint64_t v37 = v392;
                                                                                v278 = v159;
                                                                                uint64_t v48 = v336;
                                                                                v82 = v341;
                                                                                int v20 = objc_retain(-[BMDeviceConnectivityContext initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount:cmDataSentDuration:tcpRTTAvg:tcpRTTvar:videoStreamingStallTime:numStall:stallDuration:cellEstimatedBW:cellLoad:cellModelConfidenceLevel:mlPredictedCellBW:qbssLoad:lqmScorecellular:](v395, "initWithGeohash:counter:event:ratType:rrcState:cellNsaEnabled:isFR1:cellARFCN:cellBandInfo:cellChannelBW:cellRsrp:cellSinr:cellLteRSRQ:cellNrRSRP:cellNrRSRQ:cellNrSNR:maxDLCAConfigured:totalConfiguredBw:nrConfiguredBw:nrTotalScheduledMimoLayers:totalConfiguredMimoLayers:lteMaxScheduledMimoLayersInACell:nrMaxDlModulation:actualHighBandwidth:actualLowBandwidth:pActualLowBandwidth:maxOfActualLowBandwidth:estimatedHighBandwidth:estimatedLowBandwidth:movingAvgHighBandwidth:movingAvgLowBandwidth:cmDataSentCount"
                                                                                          ":cmDataSentDuration:tcpRTTAvg:"
                                                                                          "tcpRTTvar:videoStreamingStallT"
                                                                                          "ime:numStall:stallDuration:cel"
                                                                                          "lEstimatedBW:cellLoad:cellMode"
                                                                                          "lConfidenceLevel:mlPredictedCe"
                                                                                          "llBW:qbssLoad:lqmScorecellular:",
                                                                                          v401,
                                                                                          v400,
                                                                                          v389,
                                                                                          v398,
                                                                                          v396,
                                                                                          v394,
                                                                                          v391,
                                                                                          v388,
                                                                                          v348,
                                                                                          v345,
                                                                                          v342,
                                                                                          v341,
                                                                                          v336,
                                                                                          v338,
                                                                                          v330,
                                                                                          v62,
                                                                                          v332,
                                                                                          v105,
                                                                                          v326,
                                                                                          v324,
                                                                                          v322,
                                                                                          v320,
                                                                                          v318,
                                                                                          v316,
                                                                                          v314,
                                                                                          v312,
                                                                                          v310,
                                                                                          v308,
                                                                                          v306,
                                                                                          v304,
                                                                                          v302,
                                                                                          v301,
                                                                                          v299,
                                                                                          v297,
                                                                                          v295,
                                                                                          v293,
                                                                                          v292,
                                                                                          v290,
                                                                                          v287,
                                                                                          v285,
                                                                                          v283,
                                                                                          v282,
                                                                                          v393,
                                                                                          v159));
                                                                                v395 = v20;
LABEL_354:

LABEL_355:
LABEL_356:

LABEL_357:
LABEL_358:

LABEL_359:
LABEL_360:

LABEL_361:
                                                                                v246 = v289;
                                                                                goto LABEL_362;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v393 = v158;
                                                                                goto LABEL_222;
                                                                              }
                                                                              if (v329)
                                                                              {
                                                                                id v271 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v272 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v406 = *MEMORY[0x1E4F28568];
                                                                                v278 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"qbssLoad"];
                                                                                v407 = v278;
                                                                                v279 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v407 forKeys:&v406 count:1];
                                                                                id v273 = (id)objc_msgSend(v271, "initWithDomain:code:userInfo:", v272, 2);
                                                                                int v20 = 0;
                                                                                id v393 = 0;
                                                                                void *v329 = v273;
                                                                                uint64_t v37 = v392;
                                                                                v82 = v341;
                                                                                uint64_t v48 = v336;
                                                                                v62 = v340;
                                                                                id v57 = v330;
                                                                                goto LABEL_354;
                                                                              }
                                                                              id v393 = 0;
                                                                              int v20 = 0;
LABEL_425:
                                                                              uint64_t v37 = v392;
                                                                              v82 = v341;
                                                                              uint64_t v48 = v336;
                                                                              v62 = v340;
                                                                              id v57 = v330;
                                                                              goto LABEL_355;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v283 = v154;
                                                                              goto LABEL_216;
                                                                            }
                                                                            if (v329)
                                                                            {
                                                                              id v264 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              v386 = v9;
                                                                              uint64_t v265 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v410 = *MEMORY[0x1E4F28568];
                                                                              id v282 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellModelConfidenceLevel"];
                                                                              id v411 = v282;
                                                                              uint64_t v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v411 forKeys:&v410 count:1];
                                                                              uint64_t v267 = v265;
                                                                              id v9 = v386;
                                                                              v280 = (void *)v266;
                                                                              int v20 = 0;
                                                                              id v283 = 0;
                                                                              void *v329 = (id)objc_msgSend(v264, "initWithDomain:code:userInfo:", v267, 2);
                                                                              uint64_t v37 = v392;
                                                                              v82 = v341;
                                                                              uint64_t v48 = v336;
                                                                              id v57 = v330;
                                                                              v62 = v340;
                                                                              goto LABEL_356;
                                                                            }
                                                                            id v283 = 0;
                                                                            int v20 = 0;
LABEL_422:
                                                                            uint64_t v37 = v392;
                                                                            v82 = v341;
                                                                            uint64_t v48 = v336;
                                                                            id v57 = v330;
                                                                            v62 = v340;
                                                                            goto LABEL_357;
                                                                          }
                                                                          if (v329)
                                                                          {
                                                                            id v260 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            v385 = v9;
                                                                            uint64_t v261 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v412 = *MEMORY[0x1E4F28568];
                                                                            id v283 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellLoad"];
                                                                            id v413 = v283;
                                                                            uint64_t v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v413 forKeys:&v412 count:1];
                                                                            uint64_t v263 = v261;
                                                                            id v9 = v385;
                                                                            v281 = (void *)v262;
                                                                            int v20 = 0;
                                                                            id v285 = 0;
                                                                            void *v329 = (id)objc_msgSend(v260, "initWithDomain:code:userInfo:", v263, 2);
                                                                            goto LABEL_422;
                                                                          }
                                                                          id v285 = 0;
                                                                          int v20 = 0;
LABEL_420:
                                                                          uint64_t v37 = v392;
                                                                          v82 = v341;
                                                                          uint64_t v48 = v336;
                                                                          id v57 = v330;
                                                                          v62 = v340;
                                                                          goto LABEL_358;
                                                                        }
                                                                        if (v329)
                                                                        {
                                                                          id v255 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          v384 = v9;
                                                                          uint64_t v256 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v414 = *MEMORY[0x1E4F28568];
                                                                          id v285 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellEstimatedBW"];
                                                                          id v415 = v285;
                                                                          uint64_t v257 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v415 forKeys:&v414 count:1];
                                                                          uint64_t v258 = v256;
                                                                          id v9 = v384;
                                                                          v284 = (void *)v257;
                                                                          int v20 = 0;
                                                                          id v287 = 0;
                                                                          void *v329 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v258, 2);
                                                                          goto LABEL_420;
                                                                        }
                                                                        id v287 = 0;
                                                                        int v20 = 0;
LABEL_418:
                                                                        uint64_t v37 = v392;
                                                                        v82 = v341;
                                                                        uint64_t v48 = v336;
                                                                        id v57 = v330;
                                                                        v62 = v340;
                                                                        goto LABEL_359;
                                                                      }
                                                                      if (v329)
                                                                      {
                                                                        id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        v383 = v9;
                                                                        uint64_t v252 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v416 = *MEMORY[0x1E4F28568];
                                                                        id v287 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stallDuration"];
                                                                        id v417 = v287;
                                                                        uint64_t v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v417 forKeys:&v416 count:1];
                                                                        uint64_t v254 = v252;
                                                                        id v9 = v383;
                                                                        v286 = (void *)v253;
                                                                        int v20 = 0;
                                                                        id v290 = 0;
                                                                        void *v329 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v254, 2);
                                                                        goto LABEL_418;
                                                                      }
                                                                      id v290 = 0;
                                                                      int v20 = 0;
LABEL_413:
                                                                      uint64_t v37 = v392;
                                                                      v82 = v341;
                                                                      uint64_t v48 = v336;
                                                                      id v57 = v330;
                                                                      v62 = v340;
                                                                      goto LABEL_360;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v297 = v140;
                                                                      goto LABEL_195;
                                                                    }
                                                                    v229 = v105;
                                                                    if (v329)
                                                                    {
                                                                      id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      v379 = v9;
                                                                      uint64_t v231 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v424 = *MEMORY[0x1E4F28568];
                                                                      id v295 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tcpRTTAvg"];
                                                                      id v425 = v295;
                                                                      uint64_t v232 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v425 forKeys:&v424 count:1];
                                                                      uint64_t v233 = v231;
                                                                      id v9 = v379;
                                                                      int v20 = 0;
                                                                      id v297 = 0;
                                                                      void *v329 = (id)[v230 initWithDomain:v233 code:2 userInfo:v232];
                                                                      v234 = (void *)v232;
                                                                      uint64_t v37 = v392;
                                                                      v82 = v341;
                                                                      uint64_t v48 = v336;
                                                                      id v57 = v330;
                                                                      id v105 = v229;
                                                                      v62 = v340;
LABEL_366:

                                                                      goto LABEL_367;
                                                                    }
                                                                    id v297 = 0;
                                                                    int v20 = 0;
                                                                    uint64_t v37 = v392;
                                                                    v82 = v341;
                                                                    uint64_t v48 = v336;
                                                                    id v57 = v330;
LABEL_350:
                                                                    v62 = v340;
LABEL_367:

                                                                    goto LABEL_368;
                                                                  }
                                                                  if (v329)
                                                                  {
                                                                    id v225 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    v378 = v9;
                                                                    uint64_t v226 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v426 = *MEMORY[0x1E4F28568];
                                                                    id v297 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cmDataSentDuration"];
                                                                    id v427 = v297;
                                                                    uint64_t v227 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v427 forKeys:&v426 count:1];
                                                                    uint64_t v228 = v226;
                                                                    id v9 = v378;
                                                                    v296 = (void *)v227;
                                                                    int v20 = 0;
                                                                    id v299 = 0;
                                                                    void *v329 = (id)objc_msgSend(v225, "initWithDomain:code:userInfo:", v228, 2);
                                                                    uint64_t v37 = v392;
                                                                    v82 = v341;
                                                                    uint64_t v48 = v336;
                                                                    id v57 = v330;
                                                                    goto LABEL_350;
                                                                  }
                                                                  id v299 = 0;
                                                                  int v20 = 0;
LABEL_344:
                                                                  uint64_t v37 = v392;
                                                                  v82 = v341;
                                                                  uint64_t v48 = v336;
                                                                  id v57 = v330;
                                                                  v62 = v340;
LABEL_368:

                                                                  goto LABEL_369;
                                                                }
                                                                if (v329)
                                                                {
                                                                  id v221 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  v377 = v9;
                                                                  uint64_t v222 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v428 = *MEMORY[0x1E4F28568];
                                                                  id v299 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cmDataSentCount"];
                                                                  id v429 = v299;
                                                                  uint64_t v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v429 forKeys:&v428 count:1];
                                                                  uint64_t v224 = v222;
                                                                  id v9 = v377;
                                                                  v298 = (void *)v223;
                                                                  int v20 = 0;
                                                                  id v301 = 0;
                                                                  void *v329 = (id)objc_msgSend(v221, "initWithDomain:code:userInfo:", v224, 2);
                                                                  goto LABEL_344;
                                                                }
                                                                id v301 = 0;
                                                                int v20 = 0;
LABEL_338:
                                                                uint64_t v37 = v392;
                                                                v82 = v341;
                                                                uint64_t v48 = v336;
                                                                id v57 = v330;
                                                                v62 = v340;
LABEL_369:

                                                                goto LABEL_370;
                                                              }
                                                              if (v329)
                                                              {
                                                                id v217 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                v376 = v9;
                                                                uint64_t v218 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v430 = *MEMORY[0x1E4F28568];
                                                                id v301 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"movingAvgLowBandwidth"];
                                                                id v431 = v301;
                                                                uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v431 forKeys:&v430 count:1];
                                                                uint64_t v220 = v218;
                                                                id v9 = v376;
                                                                v300 = (void *)v219;
                                                                int v20 = 0;
                                                                id v302 = 0;
                                                                void *v329 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v220, 2);
                                                                goto LABEL_338;
                                                              }
                                                              id v302 = 0;
                                                              int v20 = 0;
LABEL_332:
                                                              uint64_t v37 = v392;
                                                              v82 = v341;
                                                              uint64_t v48 = v336;
                                                              id v57 = v330;
                                                              v62 = v340;
LABEL_370:

                                                              goto LABEL_371;
                                                            }
                                                            if (v329)
                                                            {
                                                              id v213 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              v375 = v9;
                                                              uint64_t v214 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v432 = *MEMORY[0x1E4F28568];
                                                              id v302 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"movingAvgHighBandwidth"];
                                                              id v433 = v302;
                                                              uint64_t v215 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v433 forKeys:&v432 count:1];
                                                              uint64_t v216 = v214;
                                                              id v9 = v375;
                                                              v303 = (void *)v215;
                                                              int v20 = 0;
                                                              id v304 = 0;
                                                              void *v329 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v216, 2);
                                                              goto LABEL_332;
                                                            }
                                                            id v304 = 0;
                                                            int v20 = 0;
LABEL_326:
                                                            uint64_t v37 = v392;
                                                            v82 = v341;
                                                            uint64_t v48 = v336;
                                                            id v57 = v330;
                                                            v62 = v340;
LABEL_371:

                                                            goto LABEL_372;
                                                          }
                                                          if (v329)
                                                          {
                                                            id v209 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            v374 = v9;
                                                            uint64_t v210 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v434 = *MEMORY[0x1E4F28568];
                                                            id v304 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"estimatedLowBandwidth"];
                                                            id v435 = v304;
                                                            uint64_t v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v435 forKeys:&v434 count:1];
                                                            uint64_t v212 = v210;
                                                            id v9 = v374;
                                                            v305 = (void *)v211;
                                                            int v20 = 0;
                                                            id v306 = 0;
                                                            void *v329 = (id)objc_msgSend(v209, "initWithDomain:code:userInfo:", v212, 2);
                                                            goto LABEL_326;
                                                          }
                                                          id v306 = 0;
                                                          int v20 = 0;
LABEL_320:
                                                          uint64_t v37 = v392;
                                                          v82 = v341;
                                                          uint64_t v48 = v336;
                                                          id v57 = v330;
                                                          v62 = v340;
LABEL_372:

                                                          goto LABEL_373;
                                                        }
                                                        if (v329)
                                                        {
                                                          id v205 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          v373 = v9;
                                                          uint64_t v206 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v436 = *MEMORY[0x1E4F28568];
                                                          id v306 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"estimatedHighBandwidth"];
                                                          id v437 = v306;
                                                          uint64_t v207 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v437 forKeys:&v436 count:1];
                                                          uint64_t v208 = v206;
                                                          id v9 = v373;
                                                          v307 = (void *)v207;
                                                          int v20 = 0;
                                                          id v308 = 0;
                                                          void *v329 = (id)objc_msgSend(v205, "initWithDomain:code:userInfo:", v208, 2);
                                                          goto LABEL_320;
                                                        }
                                                        id v308 = 0;
                                                        int v20 = 0;
LABEL_314:
                                                        uint64_t v37 = v392;
                                                        v82 = v341;
                                                        uint64_t v48 = v336;
                                                        id v57 = v330;
                                                        v62 = v340;
LABEL_373:

                                                        goto LABEL_374;
                                                      }
                                                      if (v329)
                                                      {
                                                        id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        v372 = v9;
                                                        uint64_t v202 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v438 = *MEMORY[0x1E4F28568];
                                                        id v308 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"maxOfActualLowBandwidth"];
                                                        id v439 = v308;
                                                        uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v439 forKeys:&v438 count:1];
                                                        uint64_t v204 = v202;
                                                        id v9 = v372;
                                                        v309 = (void *)v203;
                                                        int v20 = 0;
                                                        id v310 = 0;
                                                        void *v329 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v204, 2);
                                                        goto LABEL_314;
                                                      }
                                                      id v310 = 0;
                                                      int v20 = 0;
LABEL_308:
                                                      uint64_t v37 = v392;
                                                      v82 = v341;
                                                      uint64_t v48 = v336;
                                                      id v57 = v330;
                                                      v62 = v340;
LABEL_374:

                                                      goto LABEL_375;
                                                    }
                                                    if (v329)
                                                    {
                                                      id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      v371 = v9;
                                                      uint64_t v198 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v440 = *MEMORY[0x1E4F28568];
                                                      id v310 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pActualLowBandwidth"];
                                                      id v441 = v310;
                                                      uint64_t v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v441 forKeys:&v440 count:1];
                                                      uint64_t v200 = v198;
                                                      id v9 = v371;
                                                      v311 = (void *)v199;
                                                      int v20 = 0;
                                                      id v312 = 0;
                                                      void *v329 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v200, 2);
                                                      goto LABEL_308;
                                                    }
                                                    id v312 = 0;
                                                    int v20 = 0;
LABEL_302:
                                                    uint64_t v37 = v392;
                                                    v82 = v341;
                                                    uint64_t v48 = v336;
                                                    id v57 = v330;
                                                    v62 = v340;
LABEL_375:

                                                    goto LABEL_376;
                                                  }
                                                  if (v329)
                                                  {
                                                    id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    v370 = v9;
                                                    uint64_t v194 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v442 = *MEMORY[0x1E4F28568];
                                                    id v312 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"actualLowBandwidth"];
                                                    id v443 = v312;
                                                    uint64_t v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v443 forKeys:&v442 count:1];
                                                    uint64_t v196 = v194;
                                                    id v9 = v370;
                                                    v313 = (void *)v195;
                                                    int v20 = 0;
                                                    id v314 = 0;
                                                    void *v329 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v196, 2);
                                                    goto LABEL_302;
                                                  }
                                                  id v314 = 0;
                                                  int v20 = 0;
LABEL_296:
                                                  uint64_t v37 = v392;
                                                  v82 = v341;
                                                  uint64_t v48 = v336;
                                                  id v57 = v330;
                                                  v62 = v340;
LABEL_376:

                                                  goto LABEL_377;
                                                }
                                                if (v329)
                                                {
                                                  id v189 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  v369 = v9;
                                                  uint64_t v190 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v444 = *MEMORY[0x1E4F28568];
                                                  id v314 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"actualHighBandwidth"];
                                                  id v445 = v314;
                                                  uint64_t v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v445 forKeys:&v444 count:1];
                                                  uint64_t v192 = v190;
                                                  id v9 = v369;
                                                  v315 = (void *)v191;
                                                  int v20 = 0;
                                                  id v316 = 0;
                                                  void *v329 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v192, 2);
                                                  goto LABEL_296;
                                                }
                                                id v316 = 0;
                                                int v20 = 0;
LABEL_290:
                                                uint64_t v37 = v392;
                                                v82 = v341;
                                                uint64_t v48 = v336;
                                                id v57 = v330;
                                                v62 = v340;
LABEL_377:

                                                goto LABEL_378;
                                              }
                                              if (v329)
                                              {
                                                id v185 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                v368 = v9;
                                                uint64_t v186 = *MEMORY[0x1E4F502C8];
                                                uint64_t v446 = *MEMORY[0x1E4F28568];
                                                id v316 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nrMaxDlModulation"];
                                                id v447 = v316;
                                                uint64_t v187 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v447 forKeys:&v446 count:1];
                                                uint64_t v188 = v186;
                                                id v9 = v368;
                                                v317 = (void *)v187;
                                                int v20 = 0;
                                                id v318 = 0;
                                                void *v329 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v188, 2);
                                                goto LABEL_290;
                                              }
                                              id v318 = 0;
                                              int v20 = 0;
LABEL_284:
                                              uint64_t v37 = v392;
                                              v82 = v341;
                                              uint64_t v48 = v336;
                                              id v57 = v330;
                                              v62 = v340;
LABEL_378:

                                              goto LABEL_379;
                                            }
                                            if (v329)
                                            {
                                              id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              v367 = v9;
                                              uint64_t v182 = *MEMORY[0x1E4F502C8];
                                              uint64_t v448 = *MEMORY[0x1E4F28568];
                                              id v318 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lteMaxScheduledMimoLayersInACell"];
                                              id v449 = v318;
                                              uint64_t v183 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v449 forKeys:&v448 count:1];
                                              uint64_t v184 = v182;
                                              id v9 = v367;
                                              v319 = (void *)v183;
                                              int v20 = 0;
                                              id v320 = 0;
                                              void *v329 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v184, 2);
                                              goto LABEL_284;
                                            }
                                            id v320 = 0;
                                            int v20 = 0;
                                            uint64_t v37 = v392;
                                            v82 = v341;
                                            uint64_t v48 = v336;
                                            id v57 = v330;
                                            v62 = v340;
LABEL_379:

                                            goto LABEL_380;
                                          }
                                          if (v329)
                                          {
                                            id v177 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            v366 = v9;
                                            uint64_t v178 = *MEMORY[0x1E4F502C8];
                                            uint64_t v450 = *MEMORY[0x1E4F28568];
                                            id v320 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalConfiguredMimoLayers"];
                                            id v451 = v320;
                                            uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v451 forKeys:&v450 count:1];
                                            uint64_t v180 = v178;
                                            id v9 = v366;
                                            v321 = (void *)v179;
                                            int v20 = 0;
                                            id v322 = 0;
                                            void *v329 = (id)objc_msgSend(v177, "initWithDomain:code:userInfo:", v180, 2);
                                            uint64_t v37 = v392;
                                            v82 = v341;
                                            uint64_t v48 = v336;
                                            id v57 = v330;
                                            goto LABEL_379;
                                          }
                                          id v322 = 0;
                                          int v20 = 0;
                                          uint64_t v37 = v392;
                                          v82 = v341;
                                          uint64_t v48 = v336;
                                          id v57 = v330;
LABEL_380:

                                          goto LABEL_381;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v324 = v103;
                                          goto LABEL_140;
                                        }
                                        if (v329)
                                        {
                                          id v173 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          v365 = v9;
                                          uint64_t v174 = *MEMORY[0x1E4F502C8];
                                          uint64_t v452 = *MEMORY[0x1E4F28568];
                                          id v322 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nrTotalScheduledMimoLayers"];
                                          id v453 = v322;
                                          uint64_t v175 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v453 forKeys:&v452 count:1];
                                          uint64_t v176 = v174;
                                          id v9 = v365;
                                          v323 = (void *)v175;
                                          int v20 = 0;
                                          id v324 = 0;
                                          void *v329 = (id)objc_msgSend(v173, "initWithDomain:code:userInfo:", v176, 2);
                                          uint64_t v37 = v392;
                                          v82 = v341;
                                          uint64_t v48 = v336;
                                          id v57 = v330;
                                          id v105 = v101;
                                          v62 = v340;
                                          goto LABEL_380;
                                        }
                                        id v324 = 0;
                                        int v20 = 0;
                                        uint64_t v37 = v392;
                                        v82 = v341;
                                        uint64_t v48 = v336;
                                        id v57 = v330;
                                        id v105 = v101;
                                        v62 = v340;
LABEL_381:

                                        goto LABEL_382;
                                      }
                                      if (v329)
                                      {
                                        id v169 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        v364 = v9;
                                        uint64_t v170 = *MEMORY[0x1E4F502C8];
                                        uint64_t v454 = *MEMORY[0x1E4F28568];
                                        id v324 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nrConfiguredBw"];
                                        id v455 = v324;
                                        uint64_t v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v455 forKeys:&v454 count:1];
                                        uint64_t v172 = v170;
                                        id v9 = v364;
                                        v325 = (void *)v171;
                                        int v20 = 0;
                                        v326 = 0;
                                        void *v329 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v172, 2);
                                        uint64_t v37 = v392;
                                        v82 = v341;
                                        uint64_t v48 = v336;
                                        id v105 = v91;
                                        id v57 = v330;
                                        goto LABEL_381;
                                      }
                                      v326 = 0;
                                      int v20 = 0;
                                      uint64_t v37 = v392;
                                      v82 = v341;
                                      uint64_t v48 = v336;
                                      id v105 = v91;
                                      id v57 = v330;
LABEL_382:

                                      goto LABEL_383;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v91 = v90;
                                      goto LABEL_122;
                                    }
                                    if (v329)
                                    {
                                      id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      v363 = v9;
                                      uint64_t v166 = *MEMORY[0x1E4F502C8];
                                      uint64_t v456 = *MEMORY[0x1E4F28568];
                                      v326 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalConfiguredBw"];
                                      v457 = v326;
                                      uint64_t v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v457 forKeys:&v456 count:1];
                                      uint64_t v168 = v166;
                                      id v9 = v363;
                                      v327 = (void *)v167;
                                      int v20 = 0;
                                      void *v329 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v168, 2);
                                      uint64_t v37 = v392;
                                      v82 = v341;
                                      uint64_t v48 = v336;
                                      v62 = v63;
                                      id v105 = 0;
                                      goto LABEL_382;
                                    }
                                    int v20 = 0;
                                    uint64_t v37 = v392;
                                    v82 = v341;
                                    uint64_t v48 = v336;
                                    v62 = v63;
                                    id v105 = 0;
LABEL_383:

                                    goto LABEL_384;
                                  }
                                  if (v329)
                                  {
                                    id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    v362 = v9;
                                    uint64_t v162 = *MEMORY[0x1E4F502C8];
                                    uint64_t v458 = *MEMORY[0x1E4F28568];
                                    id v105 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"maxDLCAConfigured"];
                                    v459 = v105;
                                    uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v459 forKeys:&v458 count:1];
                                    uint64_t v164 = v162;
                                    id v9 = v362;
                                    v328 = (void *)v163;
                                    int v20 = 0;
                                    id v332 = 0;
                                    void *v329 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v164, 2);
                                    uint64_t v37 = v392;
                                    v82 = v341;
                                    uint64_t v48 = v336;
                                    goto LABEL_383;
                                  }
                                  id v332 = 0;
                                  int v20 = 0;
                                  uint64_t v37 = v392;
                                  v82 = v341;
                                  uint64_t v48 = v336;
LABEL_384:

                                  goto LABEL_385;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  v329 = v48;
                                  id v339 = v59;
                                  goto LABEL_84;
                                }
                                if (v48)
                                {
                                  id v111 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  v361 = v9;
                                  uint64_t v112 = *MEMORY[0x1E4F502C8];
                                  uint64_t v460 = *MEMORY[0x1E4F28568];
                                  id v332 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellNrSNR"];
                                  id v461 = v332;
                                  uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v461 forKeys:&v460 count:1];
                                  uint64_t v114 = v112;
                                  id v9 = v361;
                                  v331 = (void *)v113;
                                  int v20 = 0;
                                  *uint64_t v48 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v114, 2);
                                  uint64_t v37 = v392;
                                  v82 = v341;
                                  uint64_t v48 = v336;
                                  v62 = 0;
                                  goto LABEL_384;
                                }
                                int v20 = 0;
                                uint64_t v37 = v392;
                                v82 = v341;
                                uint64_t v48 = v336;
                                v62 = 0;
LABEL_385:

                                uint64_t v49 = v333;
                                goto LABEL_386;
                              }
                              if (v48)
                              {
                                id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                                v360 = v9;
                                uint64_t v108 = *MEMORY[0x1E4F502C8];
                                uint64_t v462 = *MEMORY[0x1E4F28568];
                                v62 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellNrRSRQ"];
                                v463 = v62;
                                uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v463 forKeys:&v462 count:1];
                                uint64_t v110 = v108;
                                id v9 = v360;
                                v334 = (void *)v109;
                                int v20 = 0;
                                id v57 = 0;
                                *uint64_t v48 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v110, 2);
                                uint64_t v37 = v392;
                                v82 = v341;
                                uint64_t v48 = v336;
                                goto LABEL_385;
                              }
                              id v57 = 0;
                              int v20 = 0;
                              uint64_t v37 = v392;
                              v82 = v341;
                              uint64_t v48 = v336;
                              uint64_t v49 = v54;
LABEL_386:

                              goto LABEL_387;
                            }
                            if (v48)
                            {
                              id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                              v359 = v9;
                              uint64_t v98 = *MEMORY[0x1E4F502C8];
                              uint64_t v464 = *MEMORY[0x1E4F28568];
                              id v57 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellNrRSRP"];
                              id v465 = v57;
                              uint64_t v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v465 forKeys:&v464 count:1];
                              uint64_t v100 = v98;
                              id v9 = v359;
                              v335 = (void *)v99;
                              int v20 = 0;
                              id v338 = 0;
                              *uint64_t v48 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v100, 2);
                              uint64_t v37 = v392;
                              v82 = v341;
                              uint64_t v48 = v336;
                              goto LABEL_386;
                            }
                            id v338 = 0;
                            int v20 = 0;
                            uint64_t v37 = v392;
                            v82 = v341;
                            uint64_t v48 = v336;
LABEL_387:

                            goto LABEL_388;
                          }
                          if (v48)
                          {
                            id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                            v358 = v9;
                            uint64_t v94 = *MEMORY[0x1E4F502C8];
                            uint64_t v466 = *MEMORY[0x1E4F28568];
                            id v338 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellLteRSRQ"];
                            id v467 = v338;
                            uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v467 forKeys:&v466 count:1];
                            uint64_t v96 = v94;
                            id v9 = v358;
                            v337 = (void *)v95;
                            int v20 = 0;
                            *uint64_t v48 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v96, 2);
                            uint64_t v48 = 0;
                            uint64_t v37 = v392;
                            v82 = v341;
                            goto LABEL_387;
                          }
                          int v20 = 0;
                          uint64_t v37 = v392;
                          v82 = v341;
LABEL_388:

                          uint64_t v17 = v342;
                          goto LABEL_389;
                        }
                        if (v48)
                        {
                          id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v357 = v9;
                          uint64_t v85 = *MEMORY[0x1E4F502C8];
                          uint64_t v468 = *MEMORY[0x1E4F28568];
                          uint64_t v86 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellSinr"];
                          uint64_t v469 = v86;
                          uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v469 forKeys:&v468 count:1];
                          uint64_t v88 = v85;
                          id v9 = v357;
                          v343 = (void *)v87;
                          int v20 = 0;
                          v82 = 0;
                          *uint64_t v48 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v88, 2);
                          uint64_t v48 = (void *)v86;
                          uint64_t v37 = v392;
                          goto LABEL_388;
                        }
                        v82 = 0;
                        int v20 = 0;
LABEL_228:
                        uint64_t v37 = v392;
LABEL_389:

                        goto LABEL_390;
                      }
                      uint64_t v17 = v8;
                      if (v8)
                      {
                        id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                        v356 = v9;
                        uint64_t v81 = *MEMORY[0x1E4F502C8];
                        uint64_t v470 = *MEMORY[0x1E4F28568];
                        v82 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellRsrp"];
                        v471 = v82;
                        uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v471 forKeys:&v470 count:1];
                        uint64_t v83 = v81;
                        id v9 = v356;
                        int v20 = 0;
                        void *v17 = (id)[v80 initWithDomain:v83 code:2 userInfo:v49];
                        uint64_t v17 = 0;
                        goto LABEL_228;
                      }
                      int v20 = 0;
LABEL_153:
                      uint64_t v37 = v392;
LABEL_390:

                      goto LABEL_391;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v345 = v16;
                      goto LABEL_31;
                    }
                    if (v8)
                    {
                      id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
                      v355 = v9;
                      uint64_t v77 = *MEMORY[0x1E4F502C8];
                      uint64_t v472 = *MEMORY[0x1E4F28568];
                      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellChannelBW"];
                      v473 = v17;
                      uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v473 forKeys:&v472 count:1];
                      uint64_t v79 = v77;
                      id v9 = v355;
                      v344 = (void *)v78;
                      int v20 = 0;
                      id v345 = 0;
                      id *v8 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v79, 2);
                      goto LABEL_153;
                    }
                    id v345 = 0;
                    int v20 = 0;
LABEL_146:
                    uint64_t v37 = v392;
LABEL_391:

                    goto LABEL_392;
                  }
                  if (v8)
                  {
                    id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
                    v354 = v9;
                    uint64_t v73 = *MEMORY[0x1E4F502C8];
                    uint64_t v474 = *MEMORY[0x1E4F28568];
                    id v345 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellBandInfo"];
                    id v475 = v345;
                    uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v475 forKeys:&v474 count:1];
                    uint64_t v75 = v73;
                    id v9 = v354;
                    v346 = (void *)v74;
                    int v20 = 0;
                    id v348 = 0;
                    id *v8 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v75, 2);
                    goto LABEL_146;
                  }
                  id v348 = 0;
                  int v20 = 0;
LABEL_134:
                  uint64_t v37 = v392;
LABEL_392:

                  goto LABEL_393;
                }
                if (v8)
                {
                  id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v353 = v9;
                  uint64_t v69 = *MEMORY[0x1E4F502C8];
                  uint64_t v476 = *MEMORY[0x1E4F28568];
                  id v348 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellARFCN"];
                  id v477 = v348;
                  uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v477 forKeys:&v476 count:1];
                  uint64_t v71 = v69;
                  id v9 = v353;
                  v349 = (void *)v70;
                  int v20 = 0;
                  id v388 = 0;
                  id *v8 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v71, 2);
                  goto LABEL_134;
                }
                id v388 = 0;
                int v20 = 0;
LABEL_128:
                uint64_t v37 = v392;
LABEL_393:

                a4 = v389;
                goto LABEL_394;
              }
              if (v8)
              {
                id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
                v352 = v9;
                uint64_t v65 = *MEMORY[0x1E4F502C8];
                uint64_t v478 = *MEMORY[0x1E4F28568];
                id v388 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFR1"];
                id v479 = v388;
                uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v479 forKeys:&v478 count:1];
                uint64_t v67 = v65;
                id v9 = v352;
                v390 = (void *)v66;
                int v20 = 0;
                id v391 = 0;
                id *v8 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v67, 2);
                goto LABEL_128;
              }
              id v391 = 0;
              int v20 = 0;
LABEL_116:
              uint64_t v37 = v392;
LABEL_394:

              goto LABEL_395;
            }
            if (v8)
            {
              id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
              v351 = v9;
              uint64_t v45 = *MEMORY[0x1E4F502C8];
              uint64_t v480 = *MEMORY[0x1E4F28568];
              id v391 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cellNsaEnabled"];
              id v481 = v391;
              uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v481 forKeys:&v480 count:1];
              uint64_t v47 = v45;
              id v9 = v351;
              v397 = (void *)v46;
              int v20 = 0;
              id v394 = 0;
              id *v8 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v47, 2);
              goto LABEL_116;
            }
            id v394 = 0;
            int v20 = 0;
            uint64_t v37 = v392;
LABEL_395:

            self = v395;
            goto LABEL_396;
          }
          uint64_t v37 = v10;
          if (v8)
          {
            uint64_t v38 = a4;
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            v350 = v9;
            uint64_t v40 = *MEMORY[0x1E4F502C8];
            uint64_t v482 = *MEMORY[0x1E4F28568];
            id v394 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rrcState"];
            id v483 = v394;
            uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v483 forKeys:&v482 count:1];
            uint64_t v42 = v39;
            a4 = v38;
            uint64_t v43 = v40;
            id v9 = v350;
            v399 = (void *)v41;
            int v20 = 0;
            id v396 = 0;
            id *v8 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2);
            goto LABEL_395;
          }
          id v396 = 0;
          int v20 = 0;
LABEL_396:

          goto LABEL_397;
        }
        uint64_t v32 = v9;
        if (v8)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v484 = *MEMORY[0x1E4F28568];
          id v396 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ratType"];
          id v485 = v396;
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v485 forKeys:&v484 count:1];
          uint64_t v36 = v34;
          uint64_t v37 = (void *)v35;
          int v20 = 0;
          id v398 = 0;
          id *v8 = (id)[v33 initWithDomain:v36 code:2 userInfo:v35];
          id v9 = v32;
          goto LABEL_396;
        }
        id v398 = 0;
        int v20 = 0;
LABEL_397:

        goto LABEL_398;
      }
      if (a4)
      {
        uint64_t v25 = a4;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = self;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v486 = *MEMORY[0x1E4F28568];
        id v398 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"event"];
        id v487 = v398;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v487 forKeys:&v486 count:1];
        uint64_t v30 = v26;
        id v9 = (void *)v29;
        uint64_t v31 = v28;
        self = v27;
        int v20 = 0;
        a4 = 0;
        *uint64_t v25 = (id)[v30 initWithDomain:v31 code:2 userInfo:v29];
        goto LABEL_397;
      }
      int v20 = 0;
LABEL_398:

      goto LABEL_399;
    }
    if (a4)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v22 = *MEMORY[0x1E4F502C8];
      uint64_t v488 = *MEMORY[0x1E4F28568];
      uint64_t v23 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"counter"];
      v489 = v23;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v489 forKeys:&v488 count:1];
      unsigned int v24 = a4;
      a4 = v23;
      int v20 = 0;
      id v400 = 0;
      *unsigned int v24 = (id)[v21 initWithDomain:v22 code:2 userInfo:v7];
      goto LABEL_398;
    }
    id v400 = 0;
    int v20 = 0;
LABEL_399:

    goto LABEL_400;
  }
  if (a4)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v490 = *MEMORY[0x1E4F28568];
    id v400 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"geohash"];
    v491[0] = v400;
    v402 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v491 forKeys:&v490 count:1];
    int v20 = 0;
    id v401 = 0;
    *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2);
    goto LABEL_399;
  }
  int v20 = 0;
  id v401 = 0;
LABEL_400:

  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDeviceConnectivityContext *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasCounter)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasEvent)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_ratType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRrcState)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellNsaEnabled)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsFR1)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasCellARFCN)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellBandInfo)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellChannelBW)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellRsrp)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCellSinr)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCellLteRSRQ)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCellNrRSRP)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCellNrRSRQ)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCellNrSNR)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasMaxDLCAConfigured)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasTotalConfiguredBw)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasNrConfiguredBw)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasNrTotalScheduledMimoLayers)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasTotalConfiguredMimoLayers)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasLteMaxScheduledMimoLayersInACell)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasNrMaxDlModulation)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasActualHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasPActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasMaxOfActualLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasEstimatedHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasEstimatedLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasMovingAvgHighBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasMovingAvgLowBandwidth)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCmDataSentCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCmDataSentDuration)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasTcpRTTAvg)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasTcpRTTvar)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasVideoStreamingStallTime)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasNumStall)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasStallDuration)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellEstimatedBW)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellLoad)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasCellModelConfidenceLevel)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasMlPredictedCellBW)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasQbssLoad)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasLqmScorecellular)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v240.receiver = self;
  v240.super_class = (Class)BMDeviceConnectivityContext;
  id v5 = [(BMEventBase *)&v240 init];
  if (!v5) {
    goto LABEL_492;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 224;
          goto LABEL_38;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasCounter = 1;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_322;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_322:
          uint64_t v235 = 64;
          goto LABEL_488;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          v5->_hasEvent = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_326;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_326:
          uint64_t v235 = 68;
          goto LABEL_488;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 232;
LABEL_38:
          uint64_t v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v23 = 0;
          v5->_hasRrcState = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            unint64_t v36 = *(void *)&v4[v35];
            if (v36 == -1 || v36 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v36 + 1;
              v23 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_330:
          uint64_t v235 = 72;
          goto LABEL_488;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasCellNsaEnabled = 1;
          while (2)
          {
            uint64_t v41 = *v6;
            unint64_t v42 = *(void *)&v4[v41];
            if (v42 == -1 || v42 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
              *(void *)&v4[v41] = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v16 = v39++ >= 9;
                if (v16)
                {
                  uint64_t v40 = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v40 = 0;
          }
LABEL_334:
          BOOL v236 = v40 != 0;
          uint64_t v237 = 19;
          goto LABEL_339;
        case 7u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasIsFR1 = 1;
          while (2)
          {
            uint64_t v47 = *v6;
            unint64_t v48 = *(void *)&v4[v47];
            if (v48 == -1 || v48 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v16 = v45++ >= 9;
                if (v16)
                {
                  uint64_t v46 = 0;
                  goto LABEL_338;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v46 = 0;
          }
LABEL_338:
          BOOL v236 = v46 != 0;
          uint64_t v237 = 21;
LABEL_339:
          *((unsigned char *)&v5->super.super.isa + v237) = v236;
          continue;
        case 8u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v23 = 0;
          v5->_hasCellARFCN = 1;
          while (2)
          {
            uint64_t v52 = *v6;
            unint64_t v53 = *(void *)&v4[v52];
            if (v53 == -1 || v53 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v53);
              *(void *)&v4[v52] = v53 + 1;
              v23 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v16 = v51++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_343;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_343:
          uint64_t v235 = 76;
          goto LABEL_488;
        case 9u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v23 = 0;
          v5->_hasCellBandInfo = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            unint64_t v58 = *(void *)&v4[v57];
            if (v58 == -1 || v58 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)&v4[*v9] + v58);
              *(void *)&v4[v57] = v58 + 1;
              v23 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v16 = v56++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_347;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_347:
          uint64_t v235 = 80;
          goto LABEL_488;
        case 0xAu:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v23 = 0;
          v5->_hasCellChannelBW = 1;
          while (2)
          {
            uint64_t v62 = *v6;
            unint64_t v63 = *(void *)&v4[v62];
            if (v63 == -1 || v63 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v63);
              *(void *)&v4[v62] = v63 + 1;
              v23 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                BOOL v16 = v61++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_351;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_351:
          uint64_t v235 = 84;
          goto LABEL_488;
        case 0xBu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v23 = 0;
          v5->_hasCellRsrp = 1;
          while (2)
          {
            uint64_t v67 = *v6;
            unint64_t v68 = *(void *)&v4[v67];
            if (v68 == -1 || v68 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v69 = *(unsigned char *)(*(void *)&v4[*v9] + v68);
              *(void *)&v4[v67] = v68 + 1;
              v23 |= (unint64_t)(v69 & 0x7F) << v65;
              if (v69 < 0)
              {
                v65 += 7;
                BOOL v16 = v66++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_355;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_355:
          uint64_t v235 = 88;
          goto LABEL_488;
        case 0xCu:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v23 = 0;
          v5->_hasCellSinr = 1;
          while (2)
          {
            uint64_t v72 = *v6;
            unint64_t v73 = *(void *)&v4[v72];
            if (v73 == -1 || v73 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)&v4[*v9] + v73);
              *(void *)&v4[v72] = v73 + 1;
              v23 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                BOOL v16 = v71++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_359;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_359:
          uint64_t v235 = 92;
          goto LABEL_488;
        case 0xDu:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v23 = 0;
          v5->_hasCellLteRSRQ = 1;
          while (2)
          {
            uint64_t v77 = *v6;
            unint64_t v78 = *(void *)&v4[v77];
            if (v78 == -1 || v78 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v79 = *(unsigned char *)(*(void *)&v4[*v9] + v78);
              *(void *)&v4[v77] = v78 + 1;
              v23 |= (unint64_t)(v79 & 0x7F) << v75;
              if (v79 < 0)
              {
                v75 += 7;
                BOOL v16 = v76++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_363;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_363:
          uint64_t v235 = 96;
          goto LABEL_488;
        case 0xEu:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v23 = 0;
          v5->_hasCellNrRSRP = 1;
          while (2)
          {
            uint64_t v82 = *v6;
            unint64_t v83 = *(void *)&v4[v82];
            if (v83 == -1 || v83 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v84 = *(unsigned char *)(*(void *)&v4[*v9] + v83);
              *(void *)&v4[v82] = v83 + 1;
              v23 |= (unint64_t)(v84 & 0x7F) << v80;
              if (v84 < 0)
              {
                v80 += 7;
                BOOL v16 = v81++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_367;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_367:
          uint64_t v235 = 100;
          goto LABEL_488;
        case 0xFu:
          char v85 = 0;
          unsigned int v86 = 0;
          uint64_t v23 = 0;
          v5->_hasCellNrRSRQ = 1;
          while (2)
          {
            uint64_t v87 = *v6;
            unint64_t v88 = *(void *)&v4[v87];
            if (v88 == -1 || v88 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)&v4[*v9] + v88);
              *(void *)&v4[v87] = v88 + 1;
              v23 |= (unint64_t)(v89 & 0x7F) << v85;
              if (v89 < 0)
              {
                v85 += 7;
                BOOL v16 = v86++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_371;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_371:
          uint64_t v235 = 104;
          goto LABEL_488;
        case 0x10u:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v23 = 0;
          v5->_hasCellNrSNR = 1;
          while (2)
          {
            uint64_t v92 = *v6;
            unint64_t v93 = *(void *)&v4[v92];
            if (v93 == -1 || v93 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v94 = *(unsigned char *)(*(void *)&v4[*v9] + v93);
              *(void *)&v4[v92] = v93 + 1;
              v23 |= (unint64_t)(v94 & 0x7F) << v90;
              if (v94 < 0)
              {
                v90 += 7;
                BOOL v16 = v91++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_375;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_375:
          uint64_t v235 = 108;
          goto LABEL_488;
        case 0x11u:
          char v95 = 0;
          unsigned int v96 = 0;
          uint64_t v23 = 0;
          v5->_hasMaxDLCAConfigured = 1;
          while (2)
          {
            uint64_t v97 = *v6;
            unint64_t v98 = *(void *)&v4[v97];
            if (v98 == -1 || v98 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)&v4[*v9] + v98);
              *(void *)&v4[v97] = v98 + 1;
              v23 |= (unint64_t)(v99 & 0x7F) << v95;
              if (v99 < 0)
              {
                v95 += 7;
                BOOL v16 = v96++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_379;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_379:
          uint64_t v235 = 112;
          goto LABEL_488;
        case 0x12u:
          char v100 = 0;
          unsigned int v101 = 0;
          uint64_t v23 = 0;
          v5->_hasTotalConfiguredBw = 1;
          while (2)
          {
            uint64_t v102 = *v6;
            unint64_t v103 = *(void *)&v4[v102];
            if (v103 == -1 || v103 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v104 = *(unsigned char *)(*(void *)&v4[*v9] + v103);
              *(void *)&v4[v102] = v103 + 1;
              v23 |= (unint64_t)(v104 & 0x7F) << v100;
              if (v104 < 0)
              {
                v100 += 7;
                BOOL v16 = v101++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_383;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_383:
          uint64_t v235 = 116;
          goto LABEL_488;
        case 0x13u:
          char v105 = 0;
          unsigned int v106 = 0;
          uint64_t v23 = 0;
          v5->_hasNrConfiguredBw = 1;
          while (2)
          {
            uint64_t v107 = *v6;
            unint64_t v108 = *(void *)&v4[v107];
            if (v108 == -1 || v108 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v109 = *(unsigned char *)(*(void *)&v4[*v9] + v108);
              *(void *)&v4[v107] = v108 + 1;
              v23 |= (unint64_t)(v109 & 0x7F) << v105;
              if (v109 < 0)
              {
                v105 += 7;
                BOOL v16 = v106++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_387;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_387:
          uint64_t v235 = 120;
          goto LABEL_488;
        case 0x14u:
          char v110 = 0;
          unsigned int v111 = 0;
          uint64_t v23 = 0;
          v5->_hasNrTotalScheduledMimoLayers = 1;
          while (2)
          {
            uint64_t v112 = *v6;
            unint64_t v113 = *(void *)&v4[v112];
            if (v113 == -1 || v113 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v114 = *(unsigned char *)(*(void *)&v4[*v9] + v113);
              *(void *)&v4[v112] = v113 + 1;
              v23 |= (unint64_t)(v114 & 0x7F) << v110;
              if (v114 < 0)
              {
                v110 += 7;
                BOOL v16 = v111++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_391;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_391:
          uint64_t v235 = 124;
          goto LABEL_488;
        case 0x15u:
          char v115 = 0;
          unsigned int v116 = 0;
          uint64_t v23 = 0;
          v5->_hasTotalConfiguredMimoLayers = 1;
          while (2)
          {
            uint64_t v117 = *v6;
            unint64_t v118 = *(void *)&v4[v117];
            if (v118 == -1 || v118 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v119 = *(unsigned char *)(*(void *)&v4[*v9] + v118);
              *(void *)&v4[v117] = v118 + 1;
              v23 |= (unint64_t)(v119 & 0x7F) << v115;
              if (v119 < 0)
              {
                v115 += 7;
                BOOL v16 = v116++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_395;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_395:
          uint64_t v235 = 128;
          goto LABEL_488;
        case 0x16u:
          char v120 = 0;
          unsigned int v121 = 0;
          uint64_t v23 = 0;
          v5->_hasLteMaxScheduledMimoLayersInACell = 1;
          while (2)
          {
            uint64_t v122 = *v6;
            unint64_t v123 = *(void *)&v4[v122];
            if (v123 == -1 || v123 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v124 = *(unsigned char *)(*(void *)&v4[*v9] + v123);
              *(void *)&v4[v122] = v123 + 1;
              v23 |= (unint64_t)(v124 & 0x7F) << v120;
              if (v124 < 0)
              {
                v120 += 7;
                BOOL v16 = v121++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_399:
          uint64_t v235 = 132;
          goto LABEL_488;
        case 0x17u:
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v23 = 0;
          v5->_hasNrMaxDlModulation = 1;
          while (2)
          {
            uint64_t v127 = *v6;
            unint64_t v128 = *(void *)&v4[v127];
            if (v128 == -1 || v128 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v129 = *(unsigned char *)(*(void *)&v4[*v9] + v128);
              *(void *)&v4[v127] = v128 + 1;
              v23 |= (unint64_t)(v129 & 0x7F) << v125;
              if (v129 < 0)
              {
                v125 += 7;
                BOOL v16 = v126++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_403;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_403:
          uint64_t v235 = 136;
          goto LABEL_488;
        case 0x18u:
          char v130 = 0;
          unsigned int v131 = 0;
          uint64_t v23 = 0;
          v5->_hasActualHighBandwidth = 1;
          while (2)
          {
            uint64_t v132 = *v6;
            unint64_t v133 = *(void *)&v4[v132];
            if (v133 == -1 || v133 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v134 = *(unsigned char *)(*(void *)&v4[*v9] + v133);
              *(void *)&v4[v132] = v133 + 1;
              v23 |= (unint64_t)(v134 & 0x7F) << v130;
              if (v134 < 0)
              {
                v130 += 7;
                BOOL v16 = v131++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_407;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_407:
          uint64_t v235 = 140;
          goto LABEL_488;
        case 0x19u:
          char v135 = 0;
          unsigned int v136 = 0;
          uint64_t v23 = 0;
          v5->_hasActualLowBandwidth = 1;
          while (2)
          {
            uint64_t v137 = *v6;
            unint64_t v138 = *(void *)&v4[v137];
            if (v138 == -1 || v138 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)&v4[*v9] + v138);
              *(void *)&v4[v137] = v138 + 1;
              v23 |= (unint64_t)(v139 & 0x7F) << v135;
              if (v139 < 0)
              {
                v135 += 7;
                BOOL v16 = v136++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_411;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_411:
          uint64_t v235 = 144;
          goto LABEL_488;
        case 0x1Au:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v23 = 0;
          v5->_hasPActualLowBandwidth = 1;
          while (2)
          {
            uint64_t v142 = *v6;
            unint64_t v143 = *(void *)&v4[v142];
            if (v143 == -1 || v143 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v144 = *(unsigned char *)(*(void *)&v4[*v9] + v143);
              *(void *)&v4[v142] = v143 + 1;
              v23 |= (unint64_t)(v144 & 0x7F) << v140;
              if (v144 < 0)
              {
                v140 += 7;
                BOOL v16 = v141++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_415;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_415:
          uint64_t v235 = 148;
          goto LABEL_488;
        case 0x1Bu:
          char v145 = 0;
          unsigned int v146 = 0;
          uint64_t v23 = 0;
          v5->_hasMaxOfActualLowBandwidth = 1;
          while (2)
          {
            uint64_t v147 = *v6;
            unint64_t v148 = *(void *)&v4[v147];
            if (v148 == -1 || v148 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v149 = *(unsigned char *)(*(void *)&v4[*v9] + v148);
              *(void *)&v4[v147] = v148 + 1;
              v23 |= (unint64_t)(v149 & 0x7F) << v145;
              if (v149 < 0)
              {
                v145 += 7;
                BOOL v16 = v146++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_419;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_419:
          uint64_t v235 = 152;
          goto LABEL_488;
        case 0x1Cu:
          char v150 = 0;
          unsigned int v151 = 0;
          uint64_t v23 = 0;
          v5->_hasEstimatedHighBandwidth = 1;
          while (2)
          {
            uint64_t v152 = *v6;
            unint64_t v153 = *(void *)&v4[v152];
            if (v153 == -1 || v153 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v154 = *(unsigned char *)(*(void *)&v4[*v9] + v153);
              *(void *)&v4[v152] = v153 + 1;
              v23 |= (unint64_t)(v154 & 0x7F) << v150;
              if (v154 < 0)
              {
                v150 += 7;
                BOOL v16 = v151++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_423:
          uint64_t v235 = 156;
          goto LABEL_488;
        case 0x1Du:
          char v155 = 0;
          unsigned int v156 = 0;
          uint64_t v23 = 0;
          v5->_hasEstimatedLowBandwidth = 1;
          while (2)
          {
            uint64_t v157 = *v6;
            unint64_t v158 = *(void *)&v4[v157];
            if (v158 == -1 || v158 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v159 = *(unsigned char *)(*(void *)&v4[*v9] + v158);
              *(void *)&v4[v157] = v158 + 1;
              v23 |= (unint64_t)(v159 & 0x7F) << v155;
              if (v159 < 0)
              {
                v155 += 7;
                BOOL v16 = v156++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_427;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_427:
          uint64_t v235 = 160;
          goto LABEL_488;
        case 0x1Eu:
          char v160 = 0;
          unsigned int v161 = 0;
          uint64_t v23 = 0;
          v5->_hasMovingAvgHighBandwidth = 1;
          while (2)
          {
            uint64_t v162 = *v6;
            unint64_t v163 = *(void *)&v4[v162];
            if (v163 == -1 || v163 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v164 = *(unsigned char *)(*(void *)&v4[*v9] + v163);
              *(void *)&v4[v162] = v163 + 1;
              v23 |= (unint64_t)(v164 & 0x7F) << v160;
              if (v164 < 0)
              {
                v160 += 7;
                BOOL v16 = v161++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_431;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_431:
          uint64_t v235 = 164;
          goto LABEL_488;
        case 0x1Fu:
          char v165 = 0;
          unsigned int v166 = 0;
          uint64_t v23 = 0;
          v5->_hasMovingAvgLowBandwidth = 1;
          while (2)
          {
            uint64_t v167 = *v6;
            unint64_t v168 = *(void *)&v4[v167];
            if (v168 == -1 || v168 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)&v4[*v9] + v168);
              *(void *)&v4[v167] = v168 + 1;
              v23 |= (unint64_t)(v169 & 0x7F) << v165;
              if (v169 < 0)
              {
                v165 += 7;
                BOOL v16 = v166++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_435;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_435:
          uint64_t v235 = 168;
          goto LABEL_488;
        case 0x20u:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v23 = 0;
          v5->_hasCmDataSentCount = 1;
          while (2)
          {
            uint64_t v172 = *v6;
            unint64_t v173 = *(void *)&v4[v172];
            if (v173 == -1 || v173 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v174 = *(unsigned char *)(*(void *)&v4[*v9] + v173);
              *(void *)&v4[v172] = v173 + 1;
              v23 |= (unint64_t)(v174 & 0x7F) << v170;
              if (v174 < 0)
              {
                v170 += 7;
                BOOL v16 = v171++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_439;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_439:
          uint64_t v235 = 172;
          goto LABEL_488;
        case 0x21u:
          char v175 = 0;
          unsigned int v176 = 0;
          uint64_t v23 = 0;
          v5->_hasCmDataSentDuration = 1;
          while (2)
          {
            uint64_t v177 = *v6;
            unint64_t v178 = *(void *)&v4[v177];
            if (v178 == -1 || v178 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v179 = *(unsigned char *)(*(void *)&v4[*v9] + v178);
              *(void *)&v4[v177] = v178 + 1;
              v23 |= (unint64_t)(v179 & 0x7F) << v175;
              if (v179 < 0)
              {
                v175 += 7;
                BOOL v16 = v176++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_443;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_443:
          uint64_t v235 = 176;
          goto LABEL_488;
        case 0x22u:
          char v180 = 0;
          unsigned int v181 = 0;
          uint64_t v23 = 0;
          v5->_hasTcpRTTAvg = 1;
          while (2)
          {
            uint64_t v182 = *v6;
            unint64_t v183 = *(void *)&v4[v182];
            if (v183 == -1 || v183 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v184 = *(unsigned char *)(*(void *)&v4[*v9] + v183);
              *(void *)&v4[v182] = v183 + 1;
              v23 |= (unint64_t)(v184 & 0x7F) << v180;
              if (v184 < 0)
              {
                v180 += 7;
                BOOL v16 = v181++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_447;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_447:
          uint64_t v235 = 180;
          goto LABEL_488;
        case 0x23u:
          char v185 = 0;
          unsigned int v186 = 0;
          uint64_t v23 = 0;
          v5->_hasTcpRTTvar = 1;
          while (2)
          {
            uint64_t v187 = *v6;
            unint64_t v188 = *(void *)&v4[v187];
            if (v188 == -1 || v188 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v189 = *(unsigned char *)(*(void *)&v4[*v9] + v188);
              *(void *)&v4[v187] = v188 + 1;
              v23 |= (unint64_t)(v189 & 0x7F) << v185;
              if (v189 < 0)
              {
                v185 += 7;
                BOOL v16 = v186++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_451;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_451:
          uint64_t v235 = 184;
          goto LABEL_488;
        case 0x24u:
          char v190 = 0;
          unsigned int v191 = 0;
          uint64_t v23 = 0;
          v5->_hasVideoStreamingStallTime = 1;
          while (2)
          {
            uint64_t v192 = *v6;
            unint64_t v193 = *(void *)&v4[v192];
            if (v193 == -1 || v193 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v194 = *(unsigned char *)(*(void *)&v4[*v9] + v193);
              *(void *)&v4[v192] = v193 + 1;
              v23 |= (unint64_t)(v194 & 0x7F) << v190;
              if (v194 < 0)
              {
                v190 += 7;
                BOOL v16 = v191++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_455;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_455:
          uint64_t v235 = 188;
          goto LABEL_488;
        case 0x25u:
          char v195 = 0;
          unsigned int v196 = 0;
          uint64_t v23 = 0;
          v5->_hasNumStall = 1;
          while (2)
          {
            uint64_t v197 = *v6;
            unint64_t v198 = *(void *)&v4[v197];
            if (v198 == -1 || v198 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v199 = *(unsigned char *)(*(void *)&v4[*v9] + v198);
              *(void *)&v4[v197] = v198 + 1;
              v23 |= (unint64_t)(v199 & 0x7F) << v195;
              if (v199 < 0)
              {
                v195 += 7;
                BOOL v16 = v196++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_459;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_459:
          uint64_t v235 = 192;
          goto LABEL_488;
        case 0x26u:
          char v200 = 0;
          unsigned int v201 = 0;
          uint64_t v23 = 0;
          v5->_hasStallDuration = 1;
          while (2)
          {
            uint64_t v202 = *v6;
            unint64_t v203 = *(void *)&v4[v202];
            if (v203 == -1 || v203 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v204 = *(unsigned char *)(*(void *)&v4[*v9] + v203);
              *(void *)&v4[v202] = v203 + 1;
              v23 |= (unint64_t)(v204 & 0x7F) << v200;
              if (v204 < 0)
              {
                v200 += 7;
                BOOL v16 = v201++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_463;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_463:
          uint64_t v235 = 196;
          goto LABEL_488;
        case 0x27u:
          char v205 = 0;
          unsigned int v206 = 0;
          uint64_t v23 = 0;
          v5->_hasCellEstimatedBW = 1;
          while (2)
          {
            uint64_t v207 = *v6;
            unint64_t v208 = *(void *)&v4[v207];
            if (v208 == -1 || v208 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v209 = *(unsigned char *)(*(void *)&v4[*v9] + v208);
              *(void *)&v4[v207] = v208 + 1;
              v23 |= (unint64_t)(v209 & 0x7F) << v205;
              if (v209 < 0)
              {
                v205 += 7;
                BOOL v16 = v206++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_467;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_467:
          uint64_t v235 = 200;
          goto LABEL_488;
        case 0x28u:
          char v210 = 0;
          unsigned int v211 = 0;
          uint64_t v23 = 0;
          v5->_hasCellLoad = 1;
          while (2)
          {
            uint64_t v212 = *v6;
            unint64_t v213 = *(void *)&v4[v212];
            if (v213 == -1 || v213 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v214 = *(unsigned char *)(*(void *)&v4[*v9] + v213);
              *(void *)&v4[v212] = v213 + 1;
              v23 |= (unint64_t)(v214 & 0x7F) << v210;
              if (v214 < 0)
              {
                v210 += 7;
                BOOL v16 = v211++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_471;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_471:
          uint64_t v235 = 204;
          goto LABEL_488;
        case 0x29u:
          char v215 = 0;
          unsigned int v216 = 0;
          uint64_t v23 = 0;
          v5->_hasCellModelConfidenceLevel = 1;
          while (2)
          {
            uint64_t v217 = *v6;
            unint64_t v218 = *(void *)&v4[v217];
            if (v218 == -1 || v218 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v219 = *(unsigned char *)(*(void *)&v4[*v9] + v218);
              *(void *)&v4[v217] = v218 + 1;
              v23 |= (unint64_t)(v219 & 0x7F) << v215;
              if (v219 < 0)
              {
                v215 += 7;
                BOOL v16 = v216++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_475;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_475:
          uint64_t v235 = 208;
          goto LABEL_488;
        case 0x2Au:
          char v220 = 0;
          unsigned int v221 = 0;
          uint64_t v23 = 0;
          v5->_hasMlPredictedCellBW = 1;
          while (2)
          {
            uint64_t v222 = *v6;
            unint64_t v223 = *(void *)&v4[v222];
            if (v223 == -1 || v223 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v224 = *(unsigned char *)(*(void *)&v4[*v9] + v223);
              *(void *)&v4[v222] = v223 + 1;
              v23 |= (unint64_t)(v224 & 0x7F) << v220;
              if (v224 < 0)
              {
                v220 += 7;
                BOOL v16 = v221++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_479;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_479:
          uint64_t v235 = 212;
          goto LABEL_488;
        case 0x2Bu:
          char v225 = 0;
          unsigned int v226 = 0;
          uint64_t v23 = 0;
          v5->_hasQbssLoad = 1;
          while (2)
          {
            uint64_t v227 = *v6;
            unint64_t v228 = *(void *)&v4[v227];
            if (v228 == -1 || v228 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v229 = *(unsigned char *)(*(void *)&v4[*v9] + v228);
              *(void *)&v4[v227] = v228 + 1;
              v23 |= (unint64_t)(v229 & 0x7F) << v225;
              if (v229 < 0)
              {
                v225 += 7;
                BOOL v16 = v226++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_483;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_483:
          uint64_t v235 = 216;
          goto LABEL_488;
        case 0x2Cu:
          char v230 = 0;
          unsigned int v231 = 0;
          uint64_t v23 = 0;
          v5->_hasLqmScorecellular = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_491;
          }
          continue;
      }
      while (1)
      {
        uint64_t v232 = *v6;
        unint64_t v233 = *(void *)&v4[v232];
        if (v233 == -1 || v233 >= *(void *)&v4[*v7]) {
          break;
        }
        char v234 = *(unsigned char *)(*(void *)&v4[*v9] + v233);
        *(void *)&v4[v232] = v233 + 1;
        v23 |= (unint64_t)(v234 & 0x7F) << v230;
        if ((v234 & 0x80) == 0) {
          goto LABEL_485;
        }
        v230 += 7;
        BOOL v16 = v231++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_487;
        }
      }
      v4[*v8] = 1;
LABEL_485:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_487:
      uint64_t v235 = 220;
LABEL_488:
      *(_DWORD *)((char *)&v5->super.super.isa + v235) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_491:
  }
    uint64_t v238 = 0;
  else {
LABEL_492:
  }
    uint64_t v238 = v5;

  return v238;
}

- (NSString)description
{
  id v19 = [NSString alloc];
  char v49 = [(BMDeviceConnectivityContext *)self geohash];
  uint64_t v46 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext counter](self, "counter"));
  unint64_t v48 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext event](self, "event"));
  unsigned int v45 = [(BMDeviceConnectivityContext *)self ratType];
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext rrcState](self, "rrcState"));
  char v43 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceConnectivityContext cellNsaEnabled](self, "cellNsaEnabled"));
  char v44 = objc_msgSend(NSNumber, "numberWithBool:", -[BMDeviceConnectivityContext isFR1](self, "isFR1"));
  unint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellARFCN](self, "cellARFCN"));
  unsigned int v39 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellBandInfo](self, "cellBandInfo"));
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellChannelBW](self, "cellChannelBW"));
  char v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellRsrp](self, "cellRsrp"));
  uint64_t v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellSinr](self, "cellSinr"));
  unint64_t v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellLteRSRQ](self, "cellLteRSRQ"));
  char v38 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRP](self, "cellNrRSRP"));
  unsigned int v34 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrRSRQ](self, "cellNrRSRQ"));
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceConnectivityContext cellNrSNR](self, "cellNrSNR"));
  char v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxDLCAConfigured](self, "maxDLCAConfigured"));
  char v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredBw](self, "totalConfiguredBw"));
  unint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrConfiguredBw](self, "nrConfiguredBw"));
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrTotalScheduledMimoLayers](self, "nrTotalScheduledMimoLayers"));
  unsigned int v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext totalConfiguredMimoLayers](self, "totalConfiguredMimoLayers"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lteMaxScheduledMimoLayersInACell](self, "lteMaxScheduledMimoLayersInACell"));
  char v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext nrMaxDlModulation](self, "nrMaxDlModulation"));
  char v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualHighBandwidth](self, "actualHighBandwidth"));
  unint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext actualLowBandwidth](self, "actualLowBandwidth"));
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext pActualLowBandwidth](self, "pActualLowBandwidth"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext maxOfActualLowBandwidth](self, "maxOfActualLowBandwidth"));
  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedHighBandwidth](self, "estimatedHighBandwidth"));
  int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext estimatedLowBandwidth](self, "estimatedLowBandwidth"));
  unsigned int v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgHighBandwidth](self, "movingAvgHighBandwidth"));
  BOOL v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext movingAvgLowBandwidth](self, "movingAvgLowBandwidth"));
  char v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentCount](self, "cmDataSentCount"));
  char v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cmDataSentDuration](self, "cmDataSentDuration"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTAvg](self, "tcpRTTAvg"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext tcpRTTvar](self, "tcpRTTvar"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext videoStreamingStallTime](self, "videoStreamingStallTime"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext numStall](self, "numStall"));
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext stallDuration](self, "stallDuration"));
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellEstimatedBW](self, "cellEstimatedBW"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellLoad](self, "cellLoad"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext cellModelConfidenceLevel](self, "cellModelConfidenceLevel"));
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext mlPredictedCellBW](self, "mlPredictedCellBW"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext qbssLoad](self, "qbssLoad"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceConnectivityContext lqmScorecellular](self, "lqmScorecellular"));
  id v20 = (id)objc_msgSend(v19, "initWithFormat:", @"BMDeviceConnectivityContext with geohash: %@, counter: %@, event: %@, ratType: %@, rrcState: %@, cellNsaEnabled: %@, isFR1: %@, cellARFCN: %@, cellBandInfo: %@, cellChannelBW: %@, cellRsrp: %@, cellSinr: %@, cellLteRSRQ: %@, cellNrRSRP: %@, cellNrRSRQ: %@, cellNrSNR: %@, maxDLCAConfigured: %@, totalConfiguredBw: %@, nrConfiguredBw: %@, nrTotalScheduledMimoLayers: %@, totalConfiguredMimoLayers: %@, lteMaxScheduledMimoLayersInACell: %@, nrMaxDlModulation: %@, actualHighBandwidth: %@, actualLowBandwidth: %@, pActualLowBandwidth: %@, maxOfActualLowBandwidth: %@, estimatedHighBandwidth: %@, estimatedLowBandwidth: %@, movingAvgHighBandwidth: %@, movingAvgLowBandwidth: %@, cmDataSentCount: %@, cmDataSentDuration: %@, tcpRTTAvg: %@, tcpRTTvar: %@, videoStreamingStallTime: %@, numStall: %@, stallDuration: %@, cellEstimatedBW: %@, cellLoad: %@, cellModelConfidenceLevel: %@, mlPredictedCellBW: %@, qbssLoad: %@, lqmScorecellular: %@", v49, v46, v48, v45, v47, v43, v44, v42, v39, v41, v37, v40, v36, v38, v34, v35,
              v31,
              v33,
              v30,
              v29,
              v28,
              v32,
              v26,
              v27,
              v25,
              v24,
              v23,
              v18,
              v17,
              v22,
              v16,
              v21,
              v15,
              v12,
              v14,
              v11,
              v13,
              v10,
              v9,
              v8,
              v3,
              v4,
              v5,
              v6);

  return (NSString *)v20;
}

- (BMDeviceConnectivityContext)initWithGeohash:(id)a3 counter:(id)a4 event:(id)a5 ratType:(id)a6 rrcState:(id)a7 cellNsaEnabled:(id)a8 isFR1:(id)a9 cellARFCN:(id)a10 cellBandInfo:(id)a11 cellChannelBW:(id)a12 cellRsrp:(id)a13 cellSinr:(id)a14 cellLteRSRQ:(id)a15 cellNrRSRP:(id)a16 cellNrRSRQ:(id)a17 cellNrSNR:(id)a18 maxDLCAConfigured:(id)a19 totalConfiguredBw:(id)a20 nrConfiguredBw:(id)a21 nrTotalScheduledMimoLayers:(id)a22 totalConfiguredMimoLayers:(id)a23 lteMaxScheduledMimoLayersInACell:(id)a24 nrMaxDlModulation:(id)a25 actualHighBandwidth:(id)a26 actualLowBandwidth:(id)a27 pActualLowBandwidth:(id)a28 maxOfActualLowBandwidth:(id)a29 estimatedHighBandwidth:(id)a30 estimatedLowBandwidth:(id)a31 movingAvgHighBandwidth:(id)a32 movingAvgLowBandwidth:(id)a33 cmDataSentCount:(id)a34 cmDataSentDuration:(id)a35 tcpRTTAvg:(id)a36 tcpRTTvar:(id)a37 videoStreamingStallTime:(id)a38 numStall:(id)a39 stallDuration:(id)a40 cellEstimatedBW:(id)a41 cellLoad:(id)a42 cellModelConfidenceLevel:(id)a43 mlPredictedCellBW:(id)a44 qbssLoad:(id)a45 lqmScorecellular:(id)a46
{
  id v106 = a3;
  id v140 = a4;
  id v136 = a5;
  id v103 = a6;
  id v105 = a6;
  id v137 = a7;
  id v139 = a8;
  id v135 = a9;
  id v134 = a10;
  id v133 = a11;
  id v132 = a12;
  id v131 = a13;
  id v50 = a14;
  id v51 = a15;
  id v52 = a16;
  id v53 = a17;
  id v54 = a18;
  id v55 = a19;
  id v56 = a20;
  id v57 = a21;
  id v58 = a22;
  id v130 = a23;
  id v129 = a24;
  id v128 = a25;
  id v127 = a26;
  id v126 = a27;
  id v125 = a28;
  id v124 = a29;
  id v123 = a30;
  id v122 = a31;
  id v121 = a32;
  id v120 = a33;
  id v119 = a34;
  id v118 = a35;
  id v117 = a36;
  id v116 = a37;
  id v115 = a38;
  id v114 = a39;
  id v113 = a40;
  id v112 = a41;
  id v111 = a42;
  id v110 = a43;
  id v109 = a44;
  id v108 = a45;
  id v107 = a46;
  v141.receiver = self;
  v141.super_class = (Class)BMDeviceConnectivityContext;
  char v59 = [(BMEventBase *)&v141 init];

  if (v59)
  {
    v59->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v59->_geohash, a3);
    if (v140)
    {
      v59->_hasCounter = 1;
      unsigned int v60 = [v140 unsignedIntValue];
    }
    else
    {
      unsigned int v60 = 0;
      v59->_hasCounter = 0;
    }
    v59->_counter = v60;
    if (v136)
    {
      v59->_hasEvent = 1;
      unsigned int v61 = [v136 unsignedIntValue];
    }
    else
    {
      unsigned int v61 = 0;
      v59->_hasEvent = 0;
    }
    v59->_event = v61;
    objc_storeStrong((id *)&v59->_ratType, v103);
    if (v137)
    {
      v59->_hasRrcState = 1;
      unsigned int v62 = [v137 unsignedIntValue];
    }
    else
    {
      unsigned int v62 = 0;
      v59->_hasRrcState = 0;
    }
    v59->_rrcState = v62;
    if (v139)
    {
      v59->_hasCellNsaEnabled = 1;
      v59->_cellNsaEnabled = [v139 BOOLValue];
    }
    else
    {
      v59->_hasCellNsaEnabled = 0;
      v59->_cellNsaEnabled = 0;
    }
    if (v135)
    {
      v59->_hasIsFR1 = 1;
      v59->_isFR1 = [v135 BOOLValue];
    }
    else
    {
      v59->_hasIsFR1 = 0;
      v59->_isFR1 = 0;
    }
    unsigned int v63 = v134;
    if (v134)
    {
      v59->_hasCellARFCN = 1;
      unsigned int v63 = [v134 unsignedIntValue];
    }
    else
    {
      v59->_hasCellARFCN = 0;
    }
    v59->_cellARFCN = v63;
    unsigned int v64 = v133;
    if (v133)
    {
      v59->_hasCellBandInfo = 1;
      unsigned int v64 = [v133 unsignedIntValue];
    }
    else
    {
      v59->_hasCellBandInfo = 0;
    }
    v59->_cellBandInfo = v64;
    unsigned int v65 = v132;
    if (v132)
    {
      v59->_hasCellChannelBW = 1;
      unsigned int v65 = [v132 unsignedIntValue];
    }
    else
    {
      v59->_hasCellChannelBW = 0;
    }
    v59->_cellChannelBW = v65;
    if (v131)
    {
      v59->_hasCellRsrp = 1;
      int v66 = [v131 intValue];
    }
    else
    {
      v59->_hasCellRsrp = 0;
      int v66 = -1;
    }
    v59->_cellRsrp = v66;
    if (v50)
    {
      v59->_hasCellSinr = 1;
      int v67 = [v50 intValue];
    }
    else
    {
      v59->_hasCellSinr = 0;
      int v67 = -1;
    }
    v59->_cellSinr = v67;
    if (v51)
    {
      v59->_hasCellLteRSRQ = 1;
      int v68 = [v51 intValue];
    }
    else
    {
      v59->_hasCellLteRSRQ = 0;
      int v68 = -1;
    }
    v59->_cellLteRSRQ = v68;
    if (v52)
    {
      v59->_hasCellNrRSRP = 1;
      int v69 = [v52 intValue];
    }
    else
    {
      v59->_hasCellNrRSRP = 0;
      int v69 = -1;
    }
    v59->_cellNrRSRP = v69;
    if (v53)
    {
      v59->_hasCellNrRSRQ = 1;
      int v70 = [v53 intValue];
    }
    else
    {
      v59->_hasCellNrRSRQ = 0;
      int v70 = -1;
    }
    v59->_cellNrRSRQ = v70;
    if (v54)
    {
      v59->_hasCellNrSNR = 1;
      int v71 = [v54 intValue];
    }
    else
    {
      v59->_hasCellNrSNR = 0;
      int v71 = -1;
    }
    v59->_cellNrSNR = v71;
    if (v55)
    {
      v59->_hasMaxDLCAConfigured = 1;
      unsigned int v72 = [v55 unsignedIntValue];
    }
    else
    {
      unsigned int v72 = 0;
      v59->_hasMaxDLCAConfigured = 0;
    }
    v59->_maxDLCAConfigured = v72;
    if (v56)
    {
      v59->_hasTotalConfiguredBw = 1;
      unsigned int v73 = [v56 unsignedIntValue];
    }
    else
    {
      unsigned int v73 = 0;
      v59->_hasTotalConfiguredBw = 0;
    }
    v59->_totalConfiguredBw = v73;
    if (v57)
    {
      v59->_hasNrConfiguredBw = 1;
      unsigned int v74 = [v57 unsignedIntValue];
    }
    else
    {
      unsigned int v74 = 0;
      v59->_hasNrConfiguredBw = 0;
    }
    v59->_nrConfiguredBw = v74;
    if (v58)
    {
      v59->_hasNrTotalScheduledMimoLayers = 1;
      unsigned int v75 = [v58 unsignedIntValue];
    }
    else
    {
      unsigned int v75 = 0;
      v59->_hasNrTotalScheduledMimoLayers = 0;
    }
    v59->_nrTotalScheduledMimoLayers = v75;
    unsigned int v76 = v130;
    if (v130)
    {
      v59->_hasTotalConfiguredMimoLayers = 1;
      unsigned int v76 = [v130 unsignedIntValue];
    }
    else
    {
      v59->_hasTotalConfiguredMimoLayers = 0;
    }
    v59->_totalConfiguredMimoLayers = v76;
    unsigned int v77 = v129;
    if (v129)
    {
      v59->_hasLteMaxScheduledMimoLayersInACell = 1;
      unsigned int v77 = [v129 unsignedIntValue];
    }
    else
    {
      v59->_hasLteMaxScheduledMimoLayersInACell = 0;
    }
    v59->_lteMaxScheduledMimoLayersInACell = v77;
    unsigned int v78 = v128;
    if (v128)
    {
      v59->_hasNrMaxDlModulation = 1;
      unsigned int v78 = [v128 unsignedIntValue];
    }
    else
    {
      v59->_hasNrMaxDlModulation = 0;
    }
    v59->_nrMaxDlModulation = v78;
    unsigned int v79 = v127;
    if (v127)
    {
      v59->_hasActualHighBandwidth = 1;
      unsigned int v79 = [v127 unsignedIntValue];
    }
    else
    {
      v59->_hasActualHighBandwidth = 0;
    }
    v59->_actualHighBandwidth = v79;
    unsigned int v80 = v126;
    if (v126)
    {
      v59->_hasActualLowBandwidth = 1;
      unsigned int v80 = [v126 unsignedIntValue];
    }
    else
    {
      v59->_hasActualLowBandwidth = 0;
    }
    v59->_actualLowBandwidth = v80;
    unsigned int v81 = v125;
    if (v125)
    {
      v59->_hasPActualLowBandwidth = 1;
      unsigned int v81 = [v125 unsignedIntValue];
    }
    else
    {
      v59->_hasPActualLowBandwidth = 0;
    }
    v59->_pActualLowBandwidth = v81;
    unsigned int v82 = v124;
    if (v124)
    {
      v59->_hasMaxOfActualLowBandwidth = 1;
      unsigned int v82 = [v124 unsignedIntValue];
    }
    else
    {
      v59->_hasMaxOfActualLowBandwidth = 0;
    }
    v59->_maxOfActualLowBandwidth = v82;
    unsigned int v83 = v123;
    if (v123)
    {
      v59->_hasEstimatedHighBandwidth = 1;
      unsigned int v83 = [v123 unsignedIntValue];
    }
    else
    {
      v59->_hasEstimatedHighBandwidth = 0;
    }
    v59->_estimatedHighBandwidth = v83;
    unsigned int v84 = v122;
    if (v122)
    {
      v59->_hasEstimatedLowBandwidth = 1;
      unsigned int v84 = [v122 unsignedIntValue];
    }
    else
    {
      v59->_hasEstimatedLowBandwidth = 0;
    }
    v59->_estimatedLowBandwidth = v84;
    unsigned int v85 = v121;
    if (v121)
    {
      v59->_hasMovingAvgHighBandwidth = 1;
      unsigned int v85 = [v121 unsignedIntValue];
    }
    else
    {
      v59->_hasMovingAvgHighBandwidth = 0;
    }
    v59->_movingAvgHighBandwidth = v85;
    unsigned int v86 = v120;
    if (v120)
    {
      v59->_hasMovingAvgLowBandwidth = 1;
      unsigned int v86 = [v120 unsignedIntValue];
    }
    else
    {
      v59->_hasMovingAvgLowBandwidth = 0;
    }
    v59->_movingAvgLowBandwidth = v86;
    unsigned int v87 = v119;
    if (v119)
    {
      v59->_hasCmDataSentCount = 1;
      unsigned int v87 = [v119 unsignedIntValue];
    }
    else
    {
      v59->_hasCmDataSentCount = 0;
    }
    v59->_cmDataSentCount = v87;
    unsigned int v88 = v118;
    if (v118)
    {
      v59->_hasCmDataSentDuration = 1;
      unsigned int v88 = [v118 unsignedIntValue];
    }
    else
    {
      v59->_hasCmDataSentDuration = 0;
    }
    v59->_cmDataSentDuration = v88;
    unsigned int v89 = v117;
    if (v117)
    {
      v59->_hasTcpRTTAvg = 1;
      unsigned int v89 = [v117 unsignedIntValue];
    }
    else
    {
      v59->_hasTcpRTTAvg = 0;
    }
    v59->_tcpRTTAvg = v89;
    unsigned int v90 = v116;
    if (v116)
    {
      v59->_hasTcpRTTvar = 1;
      unsigned int v90 = [v116 unsignedIntValue];
    }
    else
    {
      v59->_hasTcpRTTvar = 0;
    }
    v59->_tcpRTTvar = v90;
    unsigned int v91 = v115;
    if (v115)
    {
      v59->_hasVideoStreamingStallTime = 1;
      unsigned int v91 = [v115 unsignedIntValue];
    }
    else
    {
      v59->_hasVideoStreamingStallTime = 0;
    }
    v59->_videoStreamingStallTime = v91;
    unsigned int v92 = v114;
    if (v114)
    {
      v59->_hasNumStall = 1;
      unsigned int v92 = [v114 unsignedIntValue];
    }
    else
    {
      v59->_hasNumStall = 0;
    }
    v59->_numStall = v92;
    unsigned int v93 = v113;
    if (v113)
    {
      v59->_hasStallDuration = 1;
      unsigned int v93 = [v113 unsignedIntValue];
    }
    else
    {
      v59->_hasStallDuration = 0;
    }
    v59->_stallDuration = v93;
    unsigned int v94 = v112;
    if (v112)
    {
      v59->_hasCellEstimatedBW = 1;
      unsigned int v94 = [v112 unsignedIntValue];
    }
    else
    {
      v59->_hasCellEstimatedBW = 0;
    }
    v59->_cellEstimatedBW = v94;
    unsigned int v95 = v111;
    if (v111)
    {
      v59->_hasCellLoad = 1;
      unsigned int v95 = [v111 unsignedIntValue];
    }
    else
    {
      v59->_hasCellLoad = 0;
    }
    v59->_cellLoad = v95;
    unsigned int v96 = v110;
    if (v110)
    {
      v59->_hasCellModelConfidenceLevel = 1;
      unsigned int v96 = [v110 unsignedIntValue];
    }
    else
    {
      v59->_hasCellModelConfidenceLevel = 0;
    }
    v59->_cellModelConfidenceLevel = v96;
    unsigned int v97 = v109;
    if (v109)
    {
      v59->_hasMlPredictedCellBW = 1;
      unsigned int v97 = [v109 unsignedIntValue];
    }
    else
    {
      v59->_hasMlPredictedCellBW = 0;
    }
    v59->_mlPredictedCellBW = v97;
    unsigned int v98 = v108;
    if (v108)
    {
      v59->_hasQbssLoad = 1;
      unsigned int v98 = [v108 unsignedIntValue];
    }
    else
    {
      v59->_hasQbssLoad = 0;
    }
    v59->_qbssLoad = v98;
    unsigned int v99 = v107;
    if (v107)
    {
      v59->_hasLqmScorecellular = 1;
      unsigned int v99 = [v107 unsignedIntValue];
    }
    else
    {
      v59->_hasLqmScorecellular = 0;
    }
    v59->_lqmScorecellular = v99;
  }
  char v100 = v59;

  return v100;
}

+ (id)protoFields
{
  v48[44] = *MEMORY[0x1E4F143B8];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"geohash" number:1 type:13 subMessageClass:0];
  v48[0] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"counter" number:2 type:4 subMessageClass:0];
  v48[1] = v46;
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"event" number:3 type:4 subMessageClass:0];
  v48[2] = v45;
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ratType" number:4 type:13 subMessageClass:0];
  v48[3] = v44;
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rrcState" number:5 type:4 subMessageClass:0];
  v48[4] = v43;
  unint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellNsaEnabled" number:6 type:12 subMessageClass:0];
  v48[5] = v42;
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFR1" number:7 type:12 subMessageClass:0];
  v48[6] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellARFCN" number:8 type:4 subMessageClass:0];
  v48[7] = v40;
  unsigned int v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellBandInfo" number:9 type:4 subMessageClass:0];
  v48[8] = v39;
  char v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellChannelBW" number:10 type:4 subMessageClass:0];
  v48[9] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellRsrp" number:11 type:2 subMessageClass:0];
  v48[10] = v37;
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellSinr" number:12 type:2 subMessageClass:0];
  v48[11] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellLteRSRQ" number:13 type:2 subMessageClass:0];
  v48[12] = v35;
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellNrRSRP" number:14 type:2 subMessageClass:0];
  v48[13] = v34;
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellNrRSRQ" number:15 type:2 subMessageClass:0];
  v48[14] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellNrSNR" number:16 type:2 subMessageClass:0];
  v48[15] = v32;
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxDLCAConfigured" number:17 type:4 subMessageClass:0];
  v48[16] = v31;
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalConfiguredBw" number:18 type:4 subMessageClass:0];
  v48[17] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nrConfiguredBw" number:19 type:4 subMessageClass:0];
  v48[18] = v29;
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nrTotalScheduledMimoLayers" number:20 type:4 subMessageClass:0];
  v48[19] = v28;
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalConfiguredMimoLayers" number:21 type:4 subMessageClass:0];
  v48[20] = v27;
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lteMaxScheduledMimoLayersInACell" number:22 type:4 subMessageClass:0];
  v48[21] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nrMaxDlModulation" number:23 type:4 subMessageClass:0];
  v48[22] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actualHighBandwidth" number:24 type:4 subMessageClass:0];
  v48[23] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actualLowBandwidth" number:25 type:4 subMessageClass:0];
  v48[24] = v23;
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pActualLowBandwidth" number:26 type:4 subMessageClass:0];
  v48[25] = v22;
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxOfActualLowBandwidth" number:27 type:4 subMessageClass:0];
  v48[26] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"estimatedHighBandwidth" number:28 type:4 subMessageClass:0];
  v48[27] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"estimatedLowBandwidth" number:29 type:4 subMessageClass:0];
  v48[28] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"movingAvgHighBandwidth" number:30 type:4 subMessageClass:0];
  v48[29] = v18;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"movingAvgLowBandwidth" number:31 type:4 subMessageClass:0];
  v48[30] = v17;
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cmDataSentCount" number:32 type:4 subMessageClass:0];
  v48[31] = v16;
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cmDataSentDuration" number:33 type:4 subMessageClass:0];
  v48[32] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tcpRTTAvg" number:34 type:4 subMessageClass:0];
  v48[33] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tcpRTTvar" number:35 type:4 subMessageClass:0];
  v48[34] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"videoStreamingStallTime" number:36 type:4 subMessageClass:0];
  v48[35] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numStall" number:37 type:4 subMessageClass:0];
  v48[36] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stallDuration" number:38 type:4 subMessageClass:0];
  v48[37] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellEstimatedBW" number:39 type:4 subMessageClass:0];
  v48[38] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellLoad" number:40 type:4 subMessageClass:0];
  v48[39] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cellModelConfidenceLevel" number:41 type:4 subMessageClass:0];
  v48[40] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mlPredictedCellBW" number:42 type:4 subMessageClass:0];
  v48[41] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qbssLoad" number:43 type:4 subMessageClass:0];
  v48[42] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lqmScorecellular" number:44 type:4 subMessageClass:0];
  v48[43] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:44];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4560;
}

+ (id)columns
{
  v48[44] = *MEMORY[0x1E4F143B8];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"geohash" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"counter" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"event" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ratType" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rrcState" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  unint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellNsaEnabled" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFR1" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellARFCN" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  unsigned int v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellBandInfo" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  char v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellChannelBW" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellRsrp" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  unint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellSinr" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellLteRSRQ" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:2 convertedType:0];
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellNrRSRP" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:2 convertedType:0];
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellNrRSRQ" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:2 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellNrSNR" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxDLCAConfigured" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalConfiguredBw" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nrConfiguredBw" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nrTotalScheduledMimoLayers" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalConfiguredMimoLayers" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lteMaxScheduledMimoLayersInACell" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:4 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nrMaxDlModulation" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actualHighBandwidth" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:4 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actualLowBandwidth" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:4 convertedType:0];
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pActualLowBandwidth" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:4 convertedType:0];
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxOfActualLowBandwidth" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:4 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"estimatedHighBandwidth" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:4 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"estimatedLowBandwidth" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:4 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"movingAvgHighBandwidth" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:4 convertedType:0];
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"movingAvgLowBandwidth" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:4 convertedType:0];
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cmDataSentCount" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:4 convertedType:0];
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cmDataSentDuration" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:4 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tcpRTTAvg" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tcpRTTvar" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"videoStreamingStallTime" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numStall" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stallDuration" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellEstimatedBW" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:4 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellLoad" dataType:0 requestOnly:0 fieldNumber:40 protoDataType:4 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cellModelConfidenceLevel" dataType:0 requestOnly:0 fieldNumber:41 protoDataType:4 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mlPredictedCellBW" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:4 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"qbssLoad" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:4 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lqmScorecellular" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:4 convertedType:0];
  v48[0] = v47;
  v48[1] = v46;
  v48[2] = v45;
  v48[3] = v44;
  v48[4] = v43;
  v48[5] = v42;
  v48[6] = v41;
  v48[7] = v40;
  v48[8] = v39;
  v48[9] = v38;
  v48[10] = v37;
  v48[11] = v36;
  v48[12] = v35;
  v48[13] = v34;
  v48[14] = v33;
  v48[15] = v32;
  v48[16] = v31;
  v48[17] = v30;
  v48[18] = v29;
  v48[19] = v28;
  v48[20] = v27;
  v48[21] = v26;
  v48[22] = v25;
  v48[23] = v24;
  v48[24] = v23;
  v48[25] = v22;
  v48[26] = v21;
  v48[27] = v20;
  v48[28] = v19;
  v48[29] = v18;
  v48[30] = v17;
  v48[31] = v16;
  v48[32] = v15;
  v48[33] = v14;
  v48[34] = v2;
  v48[35] = v3;
  v48[36] = v4;
  v48[37] = v5;
  v48[38] = v6;
  v48[39] = v7;
  v48[40] = v8;
  v48[41] = v13;
  v48[42] = v9;
  v48[43] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:44];

  return v12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDeviceConnectivityContext alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[15] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end