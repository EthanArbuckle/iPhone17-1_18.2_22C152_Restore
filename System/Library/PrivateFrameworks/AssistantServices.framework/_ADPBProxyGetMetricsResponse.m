@interface _ADPBProxyGetMetricsResponse
+ (Class)tcpInfoMetricsType;
- (BOOL)hasAttemptCount;
- (BOOL)hasConnectedSubflowCount;
- (BOOL)hasConnectionEdgeIDName;
- (BOOL)hasConnectionEdgeType;
- (BOOL)hasConnectionFallbackReason;
- (BOOL)hasConnectionMethodName;
- (BOOL)hasFirstByteReadInterval;
- (BOOL)hasMetricsCount;
- (BOOL)hasOpenInterval;
- (BOOL)hasPingCount;
- (BOOL)hasPingMean;
- (BOOL)hasPrimarySubflowIface;
- (BOOL)hasPrimarySubflowSwitchCount;
- (BOOL)hasRttBest;
- (BOOL)hasRttCurrent;
- (BOOL)hasRttSmoothed;
- (BOOL)hasRttVariance;
- (BOOL)hasRxBytes;
- (BOOL)hasRxDuplicateBytes;
- (BOOL)hasRxOooBytes;
- (BOOL)hasRxPackets;
- (BOOL)hasSndBandwidth;
- (BOOL)hasSubflowCount;
- (BOOL)hasSynRetransmits;
- (BOOL)hasTuscanyConnectionDelay;
- (BOOL)hasTxBytes;
- (BOOL)hasTxPackets;
- (BOOL)hasTxRetransmitBytes;
- (BOOL)hasTxUnacked;
- (BOOL)hasUnacknowledgedPingCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tcpInfoMetrics;
- (NSString)connectionEdgeIDName;
- (NSString)connectionEdgeType;
- (NSString)connectionMethodName;
- (NSString)primarySubflowIface;
- (SiriCoreConnectionMetrics)_ad_metrics;
- (double)firstByteReadInterval;
- (double)openInterval;
- (double)pingMean;
- (double)tuscanyConnectionDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tcpInfoMetricsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxDuplicateBytes;
- (unint64_t)rxOooBytes;
- (unint64_t)rxPackets;
- (unint64_t)sndBandwidth;
- (unint64_t)tcpInfoMetricsCount;
- (unint64_t)txBytes;
- (unint64_t)txPackets;
- (unint64_t)txRetransmitBytes;
- (unint64_t)txUnacked;
- (unsigned)attemptCount;
- (unsigned)connectedSubflowCount;
- (unsigned)connectionFallbackReason;
- (unsigned)metricsCount;
- (unsigned)pingCount;
- (unsigned)primarySubflowSwitchCount;
- (unsigned)rttBest;
- (unsigned)rttCurrent;
- (unsigned)rttSmoothed;
- (unsigned)rttVariance;
- (unsigned)subflowCount;
- (unsigned)synRetransmits;
- (unsigned)unacknowledgedPingCount;
- (void)_ad_setMetrics:(id)a3;
- (void)addTcpInfoMetrics:(id)a3;
- (void)clearTcpInfoMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttemptCount:(unsigned int)a3;
- (void)setConnectedSubflowCount:(unsigned int)a3;
- (void)setConnectionEdgeIDName:(id)a3;
- (void)setConnectionEdgeType:(id)a3;
- (void)setConnectionFallbackReason:(unsigned int)a3;
- (void)setConnectionMethodName:(id)a3;
- (void)setFirstByteReadInterval:(double)a3;
- (void)setHasAttemptCount:(BOOL)a3;
- (void)setHasConnectedSubflowCount:(BOOL)a3;
- (void)setHasConnectionFallbackReason:(BOOL)a3;
- (void)setHasFirstByteReadInterval:(BOOL)a3;
- (void)setHasMetricsCount:(BOOL)a3;
- (void)setHasOpenInterval:(BOOL)a3;
- (void)setHasPingCount:(BOOL)a3;
- (void)setHasPingMean:(BOOL)a3;
- (void)setHasPrimarySubflowSwitchCount:(BOOL)a3;
- (void)setHasRttBest:(BOOL)a3;
- (void)setHasRttCurrent:(BOOL)a3;
- (void)setHasRttSmoothed:(BOOL)a3;
- (void)setHasRttVariance:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasRxDuplicateBytes:(BOOL)a3;
- (void)setHasRxOooBytes:(BOOL)a3;
- (void)setHasRxPackets:(BOOL)a3;
- (void)setHasSndBandwidth:(BOOL)a3;
- (void)setHasSubflowCount:(BOOL)a3;
- (void)setHasSynRetransmits:(BOOL)a3;
- (void)setHasTuscanyConnectionDelay:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxPackets:(BOOL)a3;
- (void)setHasTxRetransmitBytes:(BOOL)a3;
- (void)setHasTxUnacked:(BOOL)a3;
- (void)setHasUnacknowledgedPingCount:(BOOL)a3;
- (void)setMetricsCount:(unsigned int)a3;
- (void)setOpenInterval:(double)a3;
- (void)setPingCount:(unsigned int)a3;
- (void)setPingMean:(double)a3;
- (void)setPrimarySubflowIface:(id)a3;
- (void)setPrimarySubflowSwitchCount:(unsigned int)a3;
- (void)setRttBest:(unsigned int)a3;
- (void)setRttCurrent:(unsigned int)a3;
- (void)setRttSmoothed:(unsigned int)a3;
- (void)setRttVariance:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxDuplicateBytes:(unint64_t)a3;
- (void)setRxOooBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setSndBandwidth:(unint64_t)a3;
- (void)setSubflowCount:(unsigned int)a3;
- (void)setSynRetransmits:(unsigned int)a3;
- (void)setTcpInfoMetrics:(id)a3;
- (void)setTuscanyConnectionDelay:(double)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxRetransmitBytes:(unint64_t)a3;
- (void)setTxUnacked:(unint64_t)a3;
- (void)setUnacknowledgedPingCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyGetMetricsResponse

- (void)_ad_setMetrics:(id)a3
{
  id v4 = a3;
  v5 = [v4 timeUntilOpen];
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    -[_ADPBProxyGetMetricsResponse setOpenInterval:](self, "setOpenInterval:");
  }

  v7 = [v4 timeUntilFirstByteRead];
  v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    -[_ADPBProxyGetMetricsResponse setFirstByteReadInterval:](self, "setFirstByteReadInterval:");
  }

  v9 = [v4 attemptCount];
  v10 = v9;
  if (v9) {
    -[_ADPBProxyGetMetricsResponse setAttemptCount:](self, "setAttemptCount:", [v9 intValue]);
  }

  v11 = [v4 metricsCount];
  v12 = v11;
  if (v11) {
    -[_ADPBProxyGetMetricsResponse setMetricsCount:](self, "setMetricsCount:", [v11 intValue]);
  }

  v13 = [v4 pingCount];
  v14 = v13;
  if (v13) {
    -[_ADPBProxyGetMetricsResponse setPingCount:](self, "setPingCount:", [v13 intValue]);
  }

  v15 = [v4 meanPing];
  v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    -[_ADPBProxyGetMetricsResponse setPingMean:](self, "setPingMean:");
  }

  v17 = [v4 unacknowledgedPingCount];
  v18 = v17;
  if (v17) {
    -[_ADPBProxyGetMetricsResponse setUnacknowledgedPingCount:](self, "setUnacknowledgedPingCount:", [v17 intValue]);
  }

  v19 = [v4 subflowCount];
  v20 = v19;
  if (v19) {
    -[_ADPBProxyGetMetricsResponse setSubflowCount:](self, "setSubflowCount:", [v19 intValue]);
  }

  v21 = [v4 connectedSubflowCount];
  v22 = v21;
  if (v21) {
    -[_ADPBProxyGetMetricsResponse setConnectedSubflowCount:](self, "setConnectedSubflowCount:", [v21 intValue]);
  }

  v23 = [v4 primarySubflowInterfaceName];
  if (v23) {
    [(_ADPBProxyGetMetricsResponse *)self setPrimarySubflowIface:v23];
  }

  v24 = [v4 primarySubflowInterfaceName];
  if (v24)
  {
    v25 = [v4 subflowSwitchCounts];
    v26 = [v25 objectForKeyedSubscript:v24];

    if (v26) {
      -[_ADPBProxyGetMetricsResponse setPrimarySubflowSwitchCount:](self, "setPrimarySubflowSwitchCount:", [v26 intValue]);
    }
  }
  v27 = [v4 tcpInfoMetricsByInterfaceName];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10017584C;
  v72[3] = &unk_100504358;
  v72[4] = self;
  [v27 enumerateKeysAndObjectsUsingBlock:v72];
  if ([v27 count] == (id)1)
  {
    v28 = [v27 allValues];
    v29 = [v28 firstObject];

    id v30 = v29;
    v31 = self;
    v32 = v31;
    if (v30)
    {
      if (v31)
      {
LABEL_28:
        v33 = [v30 rttCurrent];
        v34 = v33;
        if (v33) {
          -[_ADPBProxyGetMetricsResponse setRttCurrent:](v32, "setRttCurrent:", [v33 unsignedIntValue]);
        }

        v35 = [v30 rttSmoothed];
        v36 = v35;
        if (v35) {
          -[_ADPBProxyGetMetricsResponse setRttSmoothed:](v32, "setRttSmoothed:", [v35 unsignedIntValue]);
        }

        v37 = [v30 rttVariance];
        v38 = v37;
        if (v37) {
          -[_ADPBProxyGetMetricsResponse setRttVariance:](v32, "setRttVariance:", [v37 unsignedIntValue]);
        }

        v39 = [v30 rttBest];
        v40 = v39;
        if (v39) {
          -[_ADPBProxyGetMetricsResponse setRttBest:](v32, "setRttBest:", [v39 unsignedIntValue]);
        }

        v41 = [v30 packetsSent];
        v42 = v41;
        if (v41) {
          -[_ADPBProxyGetMetricsResponse setTxPackets:](v32, "setTxPackets:", [v41 unsignedLongLongValue]);
        }

        v43 = [v30 bytesSent];
        v44 = v43;
        if (v43) {
          -[_ADPBProxyGetMetricsResponse setTxBytes:](v32, "setTxBytes:", [v43 unsignedLongLongValue]);
        }

        v45 = [v30 bytesRetransmitted];
        v46 = v45;
        if (v45) {
          -[_ADPBProxyGetMetricsResponse setTxRetransmitBytes:](v32, "setTxRetransmitBytes:", [v45 unsignedLongLongValue]);
        }

        v47 = [v30 bytesUnacked];
        v48 = v47;
        if (v47) {
          -[_ADPBProxyGetMetricsResponse setTxUnacked:](v32, "setTxUnacked:", [v47 unsignedLongLongValue]);
        }

        v49 = [v30 packetsReceived];
        v50 = v49;
        if (v49) {
          -[_ADPBProxyGetMetricsResponse setRxPackets:](v32, "setRxPackets:", [v49 unsignedLongLongValue]);
        }

        v51 = [v30 bytesReceived];
        v52 = v51;
        if (v51) {
          -[_ADPBProxyGetMetricsResponse setRxBytes:](v32, "setRxBytes:", [v51 unsignedLongLongValue]);
        }

        v53 = [v30 duplicateBytesReceived];
        v54 = v53;
        if (v53) {
          -[_ADPBProxyGetMetricsResponse setRxDuplicateBytes:](v32, "setRxDuplicateBytes:", [v53 unsignedLongLongValue]);
        }

        v55 = [v30 outOfOrderBytesReceived];
        v56 = v55;
        if (v55) {
          -[_ADPBProxyGetMetricsResponse setRxOooBytes:](v32, "setRxOooBytes:", [v55 unsignedLongLongValue]);
        }

        v57 = [v30 sendBandwidth];
        v58 = v57;
        if (v57) {
          -[_ADPBProxyGetMetricsResponse setSndBandwidth:](v32, "setSndBandwidth:", [v57 unsignedLongLongValue]);
        }

        v59 = [v30 synRetransmits];
        v60 = v59;
        if (v59) {
          -[_ADPBProxyGetMetricsResponse setSynRetransmits:](v32, "setSynRetransmits:", [v59 unsignedIntValue]);
        }

        goto LABEL_57;
      }
    }
    else
    {
      v68 = +[NSAssertionHandler currentHandler];
      v69 = +[NSString stringWithUTF8String:"void ADConnectionTCPInfoMetricsConfigureLegacyProtocolBufferProxy(SiriCoreConnectionTCPInfoMetrics *__strong, _ADPBProxyGetMetricsResponse *__strong)"];
      [v68 handleFailureInFunction:v69, @"ADConnectionTCPInfoMetricsUtilities.m", 141, @"Invalid parameter not satisfying: %@", @"tcpInfoMetrics != nil" file lineNumber description];

      if (v32) {
        goto LABEL_28;
      }
    }
    v70 = +[NSAssertionHandler currentHandler];
    v71 = +[NSString stringWithUTF8String:"void ADConnectionTCPInfoMetricsConfigureLegacyProtocolBufferProxy(SiriCoreConnectionTCPInfoMetrics *__strong, _ADPBProxyGetMetricsResponse *__strong)"];
    [v70 handleFailureInFunction:v71, @"ADConnectionTCPInfoMetricsUtilities.m", 142, @"Invalid parameter not satisfying: %@", @"legacyProtocolBufferProxy != nil" file lineNumber description];

    goto LABEL_28;
  }
LABEL_57:
  v61 = [v4 connectionMethod];
  if (v61) {
    [(_ADPBProxyGetMetricsResponse *)self setConnectionMethodName:v61];
  }

  v62 = [v4 connectionEdgeType];
  if (v62) {
    [(_ADPBProxyGetMetricsResponse *)self setConnectionEdgeType:v62];
  }

  v63 = [v4 connectionEdgeID];
  if (v63) {
    [(_ADPBProxyGetMetricsResponse *)self setConnectionEdgeIDName:v63];
  }

  v64 = [v4 connectionFallbackReason];
  v65 = v64;
  if (v64) {
    -[_ADPBProxyGetMetricsResponse setHasConnectionFallbackReason:](self, "setHasConnectionFallbackReason:", [v64 intValue] != 0);
  }

  v66 = [v4 connectionDelay];
  v67 = v66;
  if (v66)
  {
    [v66 doubleValue];
    -[_ADPBProxyGetMetricsResponse setTuscanyConnectionDelay:](self, "setTuscanyConnectionDelay:");
  }
}

- (SiriCoreConnectionMetrics)_ad_metrics
{
  id v3 = objc_alloc_init((Class)SiriCoreConnectionMetrics);
  if ([(_ADPBProxyGetMetricsResponse *)self hasOpenInterval])
  {
    [(_ADPBProxyGetMetricsResponse *)self openInterval];
    id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setTimeUntilOpen:v4];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasFirstByteReadInterval])
  {
    [(_ADPBProxyGetMetricsResponse *)self firstByteReadInterval];
    v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setTimeUntilFirstByteRead:v5];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasAttemptCount])
  {
    v6 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self attemptCount]];
    [v3 setAttemptCount:v6];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasMetricsCount])
  {
    v7 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self metricsCount]];
    [v3 setMetricsCount:v7];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasPingCount])
  {
    v8 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self pingCount]];
    [v3 setPingCount:v8];
  }
  else
  {
    [v3 setPingCount:&off_1005236C0];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasPingMean])
  {
    [(_ADPBProxyGetMetricsResponse *)self pingMean];
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setMeanPing:v9];
  }
  else
  {
    [v3 setMeanPing:&off_1005236C0];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasUnacknowledgedPingCount])
  {
    v10 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self unacknowledgedPingCount]];
    [v3 setUnacknowledgedPingCount:v10];
  }
  else
  {
    [v3 setUnacknowledgedPingCount:&off_1005236C0];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasSubflowCount])
  {
    v11 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self subflowCount]];
    [v3 setSubflowCount:v11];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasConnectedSubflowCount])
  {
    v12 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self connectedSubflowCount]];
    [v3 setConnectedSubflowCount:v12];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasPrimarySubflowIface])
  {
    v13 = [(_ADPBProxyGetMetricsResponse *)self primarySubflowIface];
    [v3 setPrimarySubflowInterfaceName:v13];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasPrimarySubflowSwitchCount])
  {
    CFStringRef v109 = @"primary";
    v14 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self primarySubflowSwitchCount]];
    v110 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    [v3 setSubflowSwitchCounts:v15];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasConnectionMethodName])
  {
    v16 = [(_ADPBProxyGetMetricsResponse *)self connectionMethodName];
    [v3 setConnectionMethod:v16];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasConnectionEdgeType])
  {
    v17 = [(_ADPBProxyGetMetricsResponse *)self connectionEdgeType];
    [v3 setConnectionEdgeType:v17];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasConnectionEdgeIDName])
  {
    v18 = [(_ADPBProxyGetMetricsResponse *)self connectionEdgeIDName];
    [v3 setConnectionEdgeID:v18];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasConnectionFallbackReason])
  {
    v19 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)self connectionFallbackReason]];
    [v3 setConnectionFallbackReason:v19];
  }
  if ([(_ADPBProxyGetMetricsResponse *)self hasTuscanyConnectionDelay])
  {
    [(_ADPBProxyGetMetricsResponse *)self tuscanyConnectionDelay];
    v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setConnectionDelay:v20];
  }
  unint64_t v21 = [(_ADPBProxyGetMetricsResponse *)self tcpInfoMetricsCount];
  v58 = v3;
  if (v21)
  {
    unint64_t v22 = v21;
    id v23 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v21];
    uint64_t v24 = 0;
    v25 = &HMAccessoryCategoryTypeAirPort_ptr;
    unint64_t v59 = v22;
    v60 = self;
    while (1)
    {
      id v26 = [(_ADPBProxyGetMetricsResponse *)self tcpInfoMetricsAtIndex:v24];
      if (!v26)
      {
        v38 = +[NSAssertionHandler currentHandler];
        v39 = +[NSString stringWithUTF8String:"SiriCoreConnectionTCPInfoMetrics *ADConnectionTCPInfoMetricsCreateWithProtocolBufferProxy(_ADPBProxyTCPInfoMetrics *__strong)"];
        [v38 handleFailureInFunction:v39, @"ADConnectionTCPInfoMetricsUtilities.m", 27, @"Invalid parameter not satisfying: %@", @"protocolBufferProxy != nil" file lineNumber description];

        unint64_t v22 = v59;
      }
      id v27 = objc_alloc((Class)SiriCoreConnectionTCPInfoMetrics);
      unsigned int v78 = [v26 hasInterfaceName];
      if (v78)
      {
        v105 = [v26 interfaceName];
      }
      else
      {
        v105 = 0;
      }
      unsigned int v76 = [v26 hasRttCurrent];
      v70 = v27;
      if (v76)
      {
        v103 = objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "rttCurrent"));
      }
      else
      {
        v103 = 0;
      }
      unsigned int v74 = [v26 hasRttSmoothed];
      if (v74)
      {
        v101 = objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "rttSmoothed"));
      }
      else
      {
        v101 = 0;
      }
      unsigned int v72 = [v26 hasRttVariance];
      if (v72)
      {
        v99 = objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "rttVariance"));
      }
      else
      {
        v99 = 0;
      }
      unsigned int v68 = [v26 hasRttBest];
      if (v68)
      {
        v97 = objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "rttBest"));
      }
      else
      {
        v97 = 0;
      }
      unsigned int v67 = [v26 hasTxPackets];
      if (v67)
      {
        v95 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "txPackets"));
      }
      else
      {
        v95 = 0;
      }
      unsigned int v66 = [v26 hasTxBytes];
      if (v66)
      {
        v93 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "txBytes"));
      }
      else
      {
        v93 = 0;
      }
      unsigned int v65 = [v26 hasTxRetransmitBytes];
      if (v65)
      {
        v91 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "txRetransmitBytes"));
      }
      else
      {
        v91 = 0;
      }
      unsigned int v64 = [v26 hasTxUnacked];
      if (v64)
      {
        v89 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "txUnacked"));
      }
      else
      {
        v89 = 0;
      }
      unsigned int v63 = [v26 hasRxPackets];
      if (v63)
      {
        v86 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "rxPackets"));
      }
      else
      {
        v86 = 0;
      }
      unsigned int v62 = [v26 hasRxBytes];
      if (v62)
      {
        v84 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "rxBytes"));
      }
      else
      {
        v84 = 0;
      }
      unsigned int v61 = [v26 hasRxDuplicateBytes];
      if (v61)
      {
        v82 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "rxDuplicateBytes"));
      }
      else
      {
        v82 = 0;
      }
      unsigned int v28 = [v26 hasRxOooBytes];
      if (v28)
      {
        v29 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "rxOooBytes"));
      }
      else
      {
        v29 = 0;
      }
      unsigned int v30 = [v26 hasSndBandwidth];
      uint64_t v80 = v24;
      if (v30)
      {
        v31 = objc_msgSend(v25[438], "numberWithUnsignedLongLong:", objc_msgSend(v26, "sndBandwidth"));
      }
      else
      {
        v31 = 0;
      }
      unsigned int v32 = [v26 hasSynRetransmits];
      if (v32)
      {
        v33 = objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "synRetransmits"));
      }
      else
      {
        v33 = 0;
      }
      if ([v26 hasTfoSynDataAcked]) {
        break;
      }
      id v36 = objc_msgSend(v70, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", v105, v103, v101, v99, v97, v95, v93, v91, v89, v86, v84, v82, v29, 0, v31,
              v33,
              0);
      if (v32) {
        goto LABEL_89;
      }
LABEL_90:
      if (v30) {

      }
      self = v60;
      if (v28) {

      }
      if (v61) {
      if (v62)
      }

      if (v63) {
      if (v64)
      }

      if (v65) {
      if (v66)
      }

      if (v67) {
      if (v68)
      }

      if (v72) {
      if (v74)
      }

      if (v76) {
      if (v78)
      }

      v37 = [v36 interfaceName];
      [v23 setObject:v36 forKey:v37];

      uint64_t v24 = v80 + 1;
      v25 = &HMAccessoryCategoryTypeAirPort_ptr;
      if (v22 == v80 + 1)
      {
        v40 = v23;
        id v3 = v58;
        [v58 setTCPInfoMetricsByInterfaceName:v40];
        goto LABEL_203;
      }
    }
    objc_msgSend(v25[438], "numberWithUnsignedInt:", objc_msgSend(v26, "tfoSynDataAcked"));
    v35 = id v34 = v23;
    id v36 = objc_msgSend(v70, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", v105, v103, v101, v99, v97, v95, v93, v91, v89, v86, v84, v82, v29, 0, v31,
            v33,
            v35);

    id v23 = v34;
    unint64_t v22 = v59;
    if (!v32) {
      goto LABEL_90;
    }
LABEL_89:

    goto LABEL_90;
  }
  v41 = self;
  if (!v41)
  {
    v56 = +[NSAssertionHandler currentHandler];
    v57 = +[NSString stringWithUTF8String:"SiriCoreConnectionTCPInfoMetrics *ADConnectionTCPInfoMetricsCreateWithLegacyProtocolBufferProxy(_ADPBProxyGetMetricsResponse *__strong)"];
    [v56 handleFailureInFunction:v57, @"ADConnectionTCPInfoMetricsUtilities.m", 50, @"Invalid parameter not satisfying: %@", @"legacyProtocolBufferProxy != nil" file lineNumber description];
  }
  if (![(_ADPBProxyGetMetricsResponse *)v41 hasRttCurrent]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRttSmoothed]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRttVariance]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRttBest]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasTxPackets]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasTxBytes]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasTxRetransmitBytes]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasTxUnacked]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRxPackets]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRxBytes]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRxDuplicateBytes]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasRxOooBytes]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasSndBandwidth]
    && ![(_ADPBProxyGetMetricsResponse *)v41 hasSynRetransmits])
  {

    v40 = 0;
    goto LABEL_203;
  }
  id v87 = objc_alloc((Class)SiriCoreConnectionTCPInfoMetrics);
  unsigned int v42 = [(_ADPBProxyGetMetricsResponse *)v41 hasRttCurrent];
  if (v42)
  {
    v106 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)v41 rttCurrent]];
  }
  else
  {
    v106 = 0;
  }
  unsigned int v43 = [(_ADPBProxyGetMetricsResponse *)v41 hasRttSmoothed];
  if (v43)
  {
    v44 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)v41 rttSmoothed]];
  }
  else
  {
    v44 = 0;
  }
  unsigned int v45 = [(_ADPBProxyGetMetricsResponse *)v41 hasRttVariance];
  if (v45)
  {
    v46 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)v41 rttVariance]];
  }
  else
  {
    v46 = 0;
  }
  unsigned int v85 = [(_ADPBProxyGetMetricsResponse *)v41 hasRttBest];
  if (v85)
  {
    v104 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)v41 rttBest]];
  }
  else
  {
    v104 = 0;
  }
  unsigned int v83 = [(_ADPBProxyGetMetricsResponse *)v41 hasTxPackets];
  if (v83)
  {
    v102 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 txPackets]];
  }
  else
  {
    v102 = 0;
  }
  unsigned int v81 = [(_ADPBProxyGetMetricsResponse *)v41 hasTxBytes];
  if (v81)
  {
    v100 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 txBytes]];
  }
  else
  {
    v100 = 0;
  }
  unsigned int v79 = [(_ADPBProxyGetMetricsResponse *)v41 hasTxRetransmitBytes];
  if (v79)
  {
    v98 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 txRetransmitBytes]];
  }
  else
  {
    v98 = 0;
  }
  unsigned int v77 = [(_ADPBProxyGetMetricsResponse *)v41 hasTxUnacked];
  if (v77)
  {
    v96 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 txUnacked]];
  }
  else
  {
    v96 = 0;
  }
  unsigned int v75 = [(_ADPBProxyGetMetricsResponse *)v41 hasRxPackets];
  if (v75)
  {
    v94 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 rxPackets]];
  }
  else
  {
    v94 = 0;
  }
  unsigned int v73 = [(_ADPBProxyGetMetricsResponse *)v41 hasRxBytes];
  if (v73)
  {
    v92 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 rxBytes]];
  }
  else
  {
    v92 = 0;
  }
  unsigned int v71 = [(_ADPBProxyGetMetricsResponse *)v41 hasRxDuplicateBytes];
  if (v71)
  {
    v90 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 rxDuplicateBytes]];
  }
  else
  {
    v90 = 0;
  }
  unsigned int v47 = [(_ADPBProxyGetMetricsResponse *)v41 hasRxOooBytes];
  if (v47)
  {
    v48 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 rxOooBytes]];
  }
  else
  {
    v48 = 0;
  }
  unsigned int v49 = [(_ADPBProxyGetMetricsResponse *)v41 hasSndBandwidth];
  if (v49)
  {
    v50 = +[NSNumber numberWithUnsignedLongLong:[(_ADPBProxyGetMetricsResponse *)v41 sndBandwidth]];
  }
  else
  {
    v50 = 0;
  }
  if (![(_ADPBProxyGetMetricsResponse *)v41 hasSynRetransmits])
  {
    id v88 = objc_msgSend(v87, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", @"default", v106, v44, v46, v104, v102, v100, v98, v96, v94, v92, v90, v48, 0, v50,
            0,
            0);
    if (!v49) {
      goto LABEL_180;
    }
    goto LABEL_179;
  }
  unsigned int v69 = v43;
  unsigned int v51 = v42;
  v52 = +[NSNumber numberWithUnsignedInt:[(_ADPBProxyGetMetricsResponse *)v41 synRetransmits]];
  id v88 = objc_msgSend(v87, "initWithInterfaceName:rttCurrent:rttSmoothed:rttVariance:rttBest:packetsSent:bytesSent:bytesRetransmitted:bytesUnacked:packetsReceived:bytesReceived:duplicateBytesReceived:outOfOrderBytesReceived:sendBufferBytes:sendBandwidth:synRetransmits:tfoSynDataAcked:", @"default", v106, v44, v46, v104, v102, v100, v98, v96, v94, v92, v90, v48, 0, v50,
          v52,
          0);

  unsigned int v42 = v51;
  unsigned int v43 = v69;
  if (v49) {
LABEL_179:
  }

LABEL_180:
  if (v47) {

  }
  if (v71) {
  if (v73)
  }

  if (v75) {
  id v3 = v58;
  }
  if (v77) {

  }
  if (v79) {
  if (v81)
  }

  if (v83) {
  if (v85)
  }
  {

    if (!v45)
    {
LABEL_198:
      if (!v43) {
        goto LABEL_199;
      }
      goto LABEL_208;
    }
  }
  else if (!v45)
  {
    goto LABEL_198;
  }

  if (!v43)
  {
LABEL_199:
    if (!v42) {
      goto LABEL_201;
    }
    goto LABEL_200;
  }
LABEL_208:

  if (v42) {
LABEL_200:
  }

LABEL_201:
  v40 = v88;
  if (v88)
  {
    v53 = [v88 interfaceName];
    v107 = v53;
    id v108 = v88;
    v54 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];

    [v58 setTCPInfoMetricsByInterfaceName:v54];
  }
LABEL_203:

  return (SiriCoreConnectionMetrics *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tcpInfoMetrics, 0);
  objc_storeStrong((id *)&self->_primarySubflowIface, 0);
  objc_storeStrong((id *)&self->_connectionMethodName, 0);
  objc_storeStrong((id *)&self->_connectionEdgeType, 0);
  objc_storeStrong((id *)&self->_connectionEdgeIDName, 0);
}

- (void)setTcpInfoMetrics:(id)a3
{
}

- (NSMutableArray)tcpInfoMetrics
{
  return self->_tcpInfoMetrics;
}

- (double)tuscanyConnectionDelay
{
  return self->_tuscanyConnectionDelay;
}

- (unsigned)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (void)setConnectionEdgeType:(id)a3
{
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionEdgeIDName:(id)a3
{
}

- (NSString)connectionEdgeIDName
{
  return self->_connectionEdgeIDName;
}

- (void)setConnectionMethodName:(id)a3
{
}

- (NSString)connectionMethodName
{
  return self->_connectionMethodName;
}

- (unsigned)primarySubflowSwitchCount
{
  return self->_primarySubflowSwitchCount;
}

- (void)setPrimarySubflowIface:(id)a3
{
}

- (NSString)primarySubflowIface
{
  return self->_primarySubflowIface;
}

- (unsigned)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (unsigned)subflowCount
{
  return self->_subflowCount;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unint64_t)sndBandwidth
{
  return self->_sndBandwidth;
}

- (unint64_t)rxOooBytes
{
  return self->_rxOooBytes;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)txUnacked
{
  return self->_txUnacked;
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (unsigned)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (unsigned)pingCount
{
  return self->_pingCount;
}

- (double)pingMean
{
  return self->_pingMean;
}

- (unsigned)metricsCount
{
  return self->_metricsCount;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (double)firstByteReadInterval
{
  return self->_firstByteReadInterval;
}

- (double)openInterval
{
  return self->_openInterval;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 2) != 0)
  {
    self->_openInterval = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v6 = *((_DWORD *)v4 + 53);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_firstByteReadInterval = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x2000) == 0)
  {
LABEL_4:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_attemptCount = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x10000) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_metricsCount = *((_DWORD *)v4 + 38);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_pingMean = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x20000) == 0)
  {
LABEL_7:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_pingCount = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_unacknowledgedPingCount = *((_DWORD *)v4 + 52);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x100000) == 0)
  {
LABEL_9:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_rttCurrent = *((_DWORD *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x200000) == 0)
  {
LABEL_10:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_rttSmoothed = *((_DWORD *)v4 + 45);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x400000) == 0)
  {
LABEL_11:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_rttVariance = *((_DWORD *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x80000) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_rttBest = *((_DWORD *)v4 + 43);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x400) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_txPackets = *((void *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x200) == 0)
  {
LABEL_14:
    if ((v6 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_txBytes = *((void *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x800) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_txRetransmitBytes = *((void *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x1000) == 0)
  {
LABEL_16:
    if ((v6 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_txUnacked = *((void *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x40) == 0)
  {
LABEL_17:
    if ((v6 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_rxPackets = *((void *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_rxBytes = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x10) == 0)
  {
LABEL_19:
    if ((v6 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_rxDuplicateBytes = *((void *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_rxOooBytes = *((void *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x80) == 0)
  {
LABEL_21:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_sndBandwidth = *((void *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_22:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_synRetransmits = *((_DWORD *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x800000) == 0)
  {
LABEL_23:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_68:
  self->_subflowCount = *((_DWORD *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v4 + 53) & 0x4000) != 0)
  {
LABEL_24:
    self->_connectedSubflowCount = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_25:
  if (*((void *)v4 + 20)) {
    -[_ADPBProxyGetMetricsResponse setPrimarySubflowIface:](self, "setPrimarySubflowIface:");
  }
  if ((*((unsigned char *)v5 + 214) & 4) != 0)
  {
    self->_primarySubflowSwitchCount = *((_DWORD *)v5 + 42);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((void *)v5 + 18)) {
    -[_ADPBProxyGetMetricsResponse setConnectionMethodName:](self, "setConnectionMethodName:");
  }
  if (*((void *)v5 + 15)) {
    -[_ADPBProxyGetMetricsResponse setConnectionEdgeIDName:](self, "setConnectionEdgeIDName:");
  }
  if (*((void *)v5 + 16)) {
    -[_ADPBProxyGetMetricsResponse setConnectionEdgeType:](self, "setConnectionEdgeType:");
  }
  int v7 = *((_DWORD *)v5 + 53);
  if ((v7 & 0x8000) != 0)
  {
    self->_connectionFallbackReason = *((_DWORD *)v5 + 34);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v7 = *((_DWORD *)v5 + 53);
  }
  if ((v7 & 0x100) != 0)
  {
    self->_tuscanyConnectionDelay = *((double *)v5 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 25);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[_ADPBProxyGetMetricsResponse addTcpInfoMetrics:](self, "addTcpInfoMetrics:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)hash
{
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double openInterval = self->_openInterval;
    double v6 = -openInterval;
    if (openInterval >= 0.0) {
      double v6 = self->_openInterval;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double firstByteReadInterval = self->_firstByteReadInterval;
    double v11 = -firstByteReadInterval;
    if (firstByteReadInterval >= 0.0) {
      double v11 = self->_firstByteReadInterval;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
    uint64_t v53 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v52 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_20;
    }
LABEL_26:
    unint64_t v18 = 0;
    goto LABEL_29;
  }
  uint64_t v53 = 2654435761 * self->_attemptCount;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v52 = 2654435761 * self->_metricsCount;
  if ((*(unsigned char *)&has & 4) == 0) {
    goto LABEL_26;
  }
LABEL_20:
  double pingMean = self->_pingMean;
  double v15 = -pingMean;
  if (pingMean >= 0.0) {
    double v15 = self->_pingMean;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    uint64_t v50 = 2654435761 * self->_pingCount;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_31:
      uint64_t v49 = 2654435761 * self->_unacknowledgedPingCount;
      if ((*(_DWORD *)&has & 0x100000) != 0) {
        goto LABEL_32;
      }
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v50 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_31;
    }
  }
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_32:
    uint64_t v48 = 2654435761 * self->_rttCurrent;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_33:
    uint64_t v47 = 2654435761 * self->_rttSmoothed;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_34:
    uint64_t v46 = 2654435761 * self->_rttVariance;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_35:
    uint64_t v45 = 2654435761 * self->_rttBest;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_36;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v45 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_36:
    unint64_t v44 = 2654435761u * self->_txPackets;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_37;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v44 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_37:
    unint64_t v43 = 2654435761u * self->_txBytes;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_38;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v43 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_38:
    unint64_t v42 = 2654435761u * self->_txRetransmitBytes;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v42 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_39:
    unint64_t v41 = 2654435761u * self->_txUnacked;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_40;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v41 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_40:
    unint64_t v40 = 2654435761u * self->_rxPackets;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_41;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v40 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_41:
    unint64_t v39 = 2654435761u * self->_rxBytes;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_42;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v39 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_42:
    unint64_t v38 = 2654435761u * self->_rxDuplicateBytes;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_43;
    }
    goto LABEL_60;
  }
LABEL_59:
  unint64_t v38 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_43:
    unint64_t v37 = 2654435761u * self->_rxOooBytes;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_44;
    }
    goto LABEL_61;
  }
LABEL_60:
  unint64_t v37 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_44:
    unint64_t v36 = 2654435761u * self->_sndBandwidth;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_45;
    }
LABEL_62:
    uint64_t v35 = 0;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_63;
  }
LABEL_61:
  unint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x1000000) == 0) {
    goto LABEL_62;
  }
LABEL_45:
  uint64_t v35 = 2654435761 * self->_synRetransmits;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_46:
    uint64_t v34 = 2654435761 * self->_subflowCount;
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v34 = 0;
LABEL_64:
  unint64_t v51 = v18;
  if ((*(_WORD *)&has & 0x4000) != 0) {
    NSUInteger v19 = [(NSString *)self->_primarySubflowIface hash];
  }
  else {
    NSUInteger v19 = [(NSString *)self->_primarySubflowIface hash];
  }
  NSUInteger v20 = v19;
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v21 = 2654435761 * self->_primarySubflowSwitchCount;
  }
  else {
    uint64_t v21 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_connectionMethodName hash];
  NSUInteger v23 = [(NSString *)self->_connectionEdgeIDName hash];
  NSUInteger v24 = [(NSString *)self->_connectionEdgeType hash];
  $CDED8D9E47E00826CC7FF028C2476AF6 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) != 0)
  {
    uint64_t v26 = 2654435761 * self->_connectionFallbackReason;
    if ((*(_WORD *)&v25 & 0x100) != 0) {
      goto LABEL_72;
    }
LABEL_77:
    unint64_t v31 = 0;
    return v9 ^ v4 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v21 ^ v20 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ (unint64_t)[(NSMutableArray *)self->_tcpInfoMetrics hash];
  }
  uint64_t v26 = 0;
  if ((*(_WORD *)&v25 & 0x100) == 0) {
    goto LABEL_77;
  }
LABEL_72:
  double tuscanyConnectionDelay = self->_tuscanyConnectionDelay;
  double v28 = -tuscanyConnectionDelay;
  if (tuscanyConnectionDelay >= 0.0) {
    double v28 = self->_tuscanyConnectionDelay;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
  return v9 ^ v4 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v21 ^ v20 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ (unint64_t)[(NSMutableArray *)self->_tcpInfoMetrics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_143;
  }
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  int v6 = *((_DWORD *)v4 + 53);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_openInterval != *((double *)v4 + 2)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_143;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_firstByteReadInterval != *((double *)v4 + 1)) {
      goto LABEL_143;
    }
  }
  else if (v6)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_attemptCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_metricsCount != *((_DWORD *)v4 + 38)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_pingMean != *((double *)v4 + 3)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pingCount != *((_DWORD *)v4 + 39)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_unacknowledgedPingCount != *((_DWORD *)v4 + 52)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_rttCurrent != *((_DWORD *)v4 + 44)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_rttSmoothed != *((_DWORD *)v4 + 45)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_rttVariance != *((_DWORD *)v4 + 46)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_rttBest != *((_DWORD *)v4 + 43)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_txPackets != *((void *)v4 + 11)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_txBytes != *((void *)v4 + 10)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_txRetransmitBytes != *((void *)v4 + 12)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_txUnacked != *((void *)v4 + 13)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rxPackets != *((void *)v4 + 7)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_rxBytes != *((void *)v4 + 4)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rxDuplicateBytes != *((void *)v4 + 5)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rxOooBytes != *((void *)v4 + 6)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_143;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sndBandwidth != *((void *)v4 + 8)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_synRetransmits != *((_DWORD *)v4 + 48)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_subflowCount != *((_DWORD *)v4 + 47)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_connectedSubflowCount != *((_DWORD *)v4 + 29)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_143;
  }
  primarySubflowIface = self->_primarySubflowIface;
  if ((unint64_t)primarySubflowIface | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](primarySubflowIface, "isEqual:"))
    {
LABEL_143:
      unsigned __int8 v14 = 0;
      goto LABEL_144;
    }
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    int v6 = *((_DWORD *)v4 + 53);
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_primarySubflowSwitchCount != *((_DWORD *)v4 + 42)) {
      goto LABEL_143;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_143;
  }
  connectionMethodName = self->_connectionMethodName;
  if ((unint64_t)connectionMethodName | *((void *)v4 + 18)
    && !-[NSString isEqual:](connectionMethodName, "isEqual:"))
  {
    goto LABEL_143;
  }
  connectionEdgeIDName = self->_connectionEdgeIDName;
  if ((unint64_t)connectionEdgeIDName | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](connectionEdgeIDName, "isEqual:")) {
      goto LABEL_143;
    }
  }
  connectionEdgeType = self->_connectionEdgeType;
  if ((unint64_t)connectionEdgeType | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](connectionEdgeType, "isEqual:")) {
      goto LABEL_143;
    }
  }
  $CDED8D9E47E00826CC7FF028C2476AF6 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 53);
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_connectionFallbackReason != *((_DWORD *)v4 + 34)) {
      goto LABEL_143;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_143;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_tuscanyConnectionDelay != *((double *)v4 + 9)) {
      goto LABEL_143;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_143;
  }
  tcpInfoMetrics = self->_tcpInfoMetrics;
  if ((unint64_t)tcpInfoMetrics | *((void *)v4 + 25)) {
    unsigned __int8 v14 = -[NSMutableArray isEqual:](tcpInfoMetrics, "isEqual:");
  }
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_144:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int v6 = v5;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    v5[2] = *(void *)&self->_openInterval;
    *((_DWORD *)v5 + 53) |= 2u;
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(void *)&self->_firstByteReadInterval;
  *((_DWORD *)v5 + 53) |= 1u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 28) = self->_attemptCount;
  *((_DWORD *)v5 + 53) |= 0x2000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v5 + 38) = self->_metricsCount;
  *((_DWORD *)v5 + 53) |= 0x10000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  v5[3] = *(void *)&self->_pingMean;
  *((_DWORD *)v5 + 53) |= 4u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v5 + 39) = self->_pingCount;
  *((_DWORD *)v5 + 53) |= 0x20000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v5 + 52) = self->_unacknowledgedPingCount;
  *((_DWORD *)v5 + 53) |= 0x2000000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v5 + 44) = self->_rttCurrent;
  *((_DWORD *)v5 + 53) |= 0x100000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v5 + 45) = self->_rttSmoothed;
  *((_DWORD *)v5 + 53) |= 0x200000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v5 + 46) = self->_rttVariance;
  *((_DWORD *)v5 + 53) |= 0x400000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v5 + 43) = self->_rttBest;
  *((_DWORD *)v5 + 53) |= 0x80000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  v5[11] = self->_txPackets;
  *((_DWORD *)v5 + 53) |= 0x400u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  v5[10] = self->_txBytes;
  *((_DWORD *)v5 + 53) |= 0x200u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  v5[12] = self->_txRetransmitBytes;
  *((_DWORD *)v5 + 53) |= 0x800u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  v5[13] = self->_txUnacked;
  *((_DWORD *)v5 + 53) |= 0x1000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  v5[7] = self->_rxPackets;
  *((_DWORD *)v5 + 53) |= 0x40u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  v5[4] = self->_rxBytes;
  *((_DWORD *)v5 + 53) |= 8u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  v5[5] = self->_rxDuplicateBytes;
  *((_DWORD *)v5 + 53) |= 0x10u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  v5[6] = self->_rxOooBytes;
  *((_DWORD *)v5 + 53) |= 0x20u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  v5[8] = self->_sndBandwidth;
  *((_DWORD *)v5 + 53) |= 0x80u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v5 + 48) = self->_synRetransmits;
  *((_DWORD *)v5 + 53) |= 0x1000000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_60:
  *((_DWORD *)v5 + 47) = self->_subflowCount;
  *((_DWORD *)v5 + 53) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_24:
    *((_DWORD *)v5 + 29) = self->_connectedSubflowCount;
    *((_DWORD *)v5 + 53) |= 0x4000u;
  }
LABEL_25:
  id v8 = [(NSString *)self->_primarySubflowIface copyWithZone:a3];
  unint64_t v9 = (void *)v6[20];
  v6[20] = v8;

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v6 + 42) = self->_primarySubflowSwitchCount;
    *((_DWORD *)v6 + 53) |= 0x40000u;
  }
  id v10 = [(NSString *)self->_connectionMethodName copyWithZone:a3];
  $CDED8D9E47E00826CC7FF028C2476AF6 v11 = (void *)v6[18];
  v6[18] = v10;

  id v12 = [(NSString *)self->_connectionEdgeIDName copyWithZone:a3];
  double v13 = (void *)v6[15];
  v6[15] = v12;

  id v14 = [(NSString *)self->_connectionEdgeType copyWithZone:a3];
  double v15 = (void *)v6[16];
  v6[16] = v14;

  $CDED8D9E47E00826CC7FF028C2476AF6 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) != 0)
  {
    *((_DWORD *)v6 + 34) = self->_connectionFallbackReason;
    *((_DWORD *)v6 + 53) |= 0x8000u;
    $CDED8D9E47E00826CC7FF028C2476AF6 v16 = self->_has;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    v6[9] = *(void *)&self->_tuscanyConnectionDelay;
    *((_DWORD *)v6 + 53) |= 0x100u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v17 = self->_tcpInfoMetrics;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v21), "copyWithZone:", a3, (void)v24);
        [v6 addTcpInfoMetrics:v22];

        uint64_t v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    v4[2] = *(void *)&self->_openInterval;
    *((_DWORD *)v4 + 53) |= 2u;
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_firstByteReadInterval;
  *((_DWORD *)v4 + 53) |= 1u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 28) = self->_attemptCount;
  *((_DWORD *)v4 + 53) |= 0x2000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 38) = self->_metricsCount;
  *((_DWORD *)v4 + 53) |= 0x10000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[3] = *(void *)&self->_pingMean;
  *((_DWORD *)v4 + 53) |= 4u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 39) = self->_pingCount;
  *((_DWORD *)v4 + 53) |= 0x20000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 52) = self->_unacknowledgedPingCount;
  *((_DWORD *)v4 + 53) |= 0x2000000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 44) = self->_rttCurrent;
  *((_DWORD *)v4 + 53) |= 0x100000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 45) = self->_rttSmoothed;
  *((_DWORD *)v4 + 53) |= 0x200000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 46) = self->_rttVariance;
  *((_DWORD *)v4 + 53) |= 0x400000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 43) = self->_rttBest;
  *((_DWORD *)v4 + 53) |= 0x80000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  v4[11] = self->_txPackets;
  *((_DWORD *)v4 + 53) |= 0x400u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  v4[10] = self->_txBytes;
  *((_DWORD *)v4 + 53) |= 0x200u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  v4[12] = self->_txRetransmitBytes;
  *((_DWORD *)v4 + 53) |= 0x800u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  v4[13] = self->_txUnacked;
  *((_DWORD *)v4 + 53) |= 0x1000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  v4[7] = self->_rxPackets;
  *((_DWORD *)v4 + 53) |= 0x40u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  v4[4] = self->_rxBytes;
  *((_DWORD *)v4 + 53) |= 8u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  v4[5] = self->_rxDuplicateBytes;
  *((_DWORD *)v4 + 53) |= 0x10u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  v4[6] = self->_rxOooBytes;
  *((_DWORD *)v4 + 53) |= 0x20u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  v4[8] = self->_sndBandwidth;
  *((_DWORD *)v4 + 53) |= 0x80u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 48) = self->_synRetransmits;
  *((_DWORD *)v4 + 53) |= 0x1000000u;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_67:
  *((_DWORD *)v4 + 47) = self->_subflowCount;
  *((_DWORD *)v4 + 53) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 29) = self->_connectedSubflowCount;
    *((_DWORD *)v4 + 53) |= 0x4000u;
  }
LABEL_25:
  $CDED8D9E47E00826CC7FF028C2476AF6 v11 = v4;
  if (self->_primarySubflowIface)
  {
    objc_msgSend(v4, "setPrimarySubflowIface:");
    id v4 = v11;
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_primarySubflowSwitchCount;
    *((_DWORD *)v4 + 53) |= 0x40000u;
  }
  if (self->_connectionMethodName)
  {
    objc_msgSend(v11, "setConnectionMethodName:");
    id v4 = v11;
  }
  if (self->_connectionEdgeIDName)
  {
    objc_msgSend(v11, "setConnectionEdgeIDName:");
    id v4 = v11;
  }
  if (self->_connectionEdgeType)
  {
    objc_msgSend(v11, "setConnectionEdgeType:");
    id v4 = v11;
  }
  $CDED8D9E47E00826CC7FF028C2476AF6 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_connectionFallbackReason;
    *((_DWORD *)v4 + 53) |= 0x8000u;
    $CDED8D9E47E00826CC7FF028C2476AF6 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    v4[9] = *(void *)&self->_tuscanyConnectionDelay;
    *((_DWORD *)v4 + 53) |= 0x100u;
  }
  if ([(_ADPBProxyGetMetricsResponse *)self tcpInfoMetricsCount])
  {
    [v11 clearTcpInfoMetrics];
    unint64_t v7 = [(_ADPBProxyGetMetricsResponse *)self tcpInfoMetricsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = [(_ADPBProxyGetMetricsResponse *)self tcpInfoMetricsAtIndex:i];
        [v11 addTcpInfoMetrics:v10];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_primarySubflowIface) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_connectionMethodName) {
    PBDataWriterWriteStringField();
  }
  if (self->_connectionEdgeIDName) {
    PBDataWriterWriteStringField();
  }
  if (self->_connectionEdgeType) {
    PBDataWriterWriteStringField();
  }
  $CDED8D9E47E00826CC7FF028C2476AF6 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $CDED8D9E47E00826CC7FF028C2476AF6 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x100) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = self->_tcpInfoMetrics;
  unint64_t v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      $CDED8D9E47E00826CC7FF028C2476AF6 v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      unint64_t v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v9 = v8 + 1;
        if (v8 == -1 || v9 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v10 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v9;
        v7 |= (unint64_t)(v10 & 0x7F) << v5;
        if ((v10 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v11 = v6++ >= 9;
        if (v11)
        {
          unint64_t v7 = 0;
          int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v12 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          *(_DWORD *)&self->_has |= 2u;
          unint64_t v14 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v14 <= 0xFFFFFFFFFFFFFFF7 && v14 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v14);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v14 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0;
          }
          uint64_t v138 = 16;
          goto LABEL_292;
        case 2u:
          *(_DWORD *)&self->_has |= 1u;
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0;
          }
          uint64_t v138 = 8;
          goto LABEL_292;
        case 3u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x2000u;
          while (2)
          {
            uint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v21 = v20 + 1;
            if (v20 == -1 || v21 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v22 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21;
              v19 |= (unint64_t)(v22 & 0x7F) << v17;
              if (v22 < 0)
              {
                v17 += 7;
                BOOL v11 = v18++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_197:
          uint64_t v136 = 112;
          goto LABEL_283;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x10000u;
          while (2)
          {
            uint64_t v25 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26;
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v11 = v24++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_201:
          uint64_t v136 = 152;
          goto LABEL_283;
        case 5u:
          *(_DWORD *)&self->_has |= 4u;
          unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0;
          }
          uint64_t v138 = 24;
          goto LABEL_292;
        case 6u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x20000u;
          while (2)
          {
            uint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v11 = v30++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_205:
          uint64_t v136 = 156;
          goto LABEL_283;
        case 7u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x2000000u;
          while (2)
          {
            uint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v11 = v35++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_209:
          uint64_t v136 = 208;
          goto LABEL_283;
        case 0xAu:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x100000u;
          while (2)
          {
            uint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v43;
              v19 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v11 = v41++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_213:
          uint64_t v136 = 176;
          goto LABEL_283;
        case 0xBu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x200000u;
          while (2)
          {
            uint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v48;
              v19 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v11 = v46++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_217;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_217:
          uint64_t v136 = 180;
          goto LABEL_283;
        case 0xCu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x400000u;
          while (2)
          {
            uint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v53;
              v19 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v11 = v51++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_221;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_221:
          uint64_t v136 = 184;
          goto LABEL_283;
        case 0xDu:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x80000u;
          while (2)
          {
            uint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v58;
              v19 |= (unint64_t)(v59 & 0x7F) << v55;
              if (v59 < 0)
              {
                v55 += 7;
                BOOL v11 = v56++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_225:
          uint64_t v136 = 172;
          goto LABEL_283;
        case 0x14u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x400u;
          while (2)
          {
            uint64_t v63 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v63);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v64;
              v62 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v11 = v61++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_229:
          uint64_t v137 = 88;
          goto LABEL_262;
        case 0x15u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x200u;
          while (2)
          {
            uint64_t v68 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v68);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v69;
              v62 |= (unint64_t)(v70 & 0x7F) << v66;
              if (v70 < 0)
              {
                v66 += 7;
                BOOL v11 = v67++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_233:
          uint64_t v137 = 80;
          goto LABEL_262;
        case 0x16u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x800u;
          while (2)
          {
            uint64_t v73 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v74 = v73 + 1;
            if (v73 == -1 || v74 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v73);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v74;
              v62 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                BOOL v11 = v72++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_237:
          uint64_t v137 = 96;
          goto LABEL_262;
        case 0x17u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x1000u;
          while (2)
          {
            uint64_t v78 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v79 = v78 + 1;
            if (v78 == -1 || v79 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v80 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v78);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v79;
              v62 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                BOOL v11 = v77++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_241:
          uint64_t v137 = 104;
          goto LABEL_262;
        case 0x1Eu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x40u;
          while (2)
          {
            uint64_t v83 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v83);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v84;
              v62 |= (unint64_t)(v85 & 0x7F) << v81;
              if (v85 < 0)
              {
                v81 += 7;
                BOOL v11 = v82++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_245;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_245:
          uint64_t v137 = 56;
          goto LABEL_262;
        case 0x1Fu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 8u;
          while (2)
          {
            uint64_t v88 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v90 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v88);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v89;
              v62 |= (unint64_t)(v90 & 0x7F) << v86;
              if (v90 < 0)
              {
                v86 += 7;
                BOOL v11 = v87++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_249;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_249:
          uint64_t v137 = 32;
          goto LABEL_262;
        case 0x20u:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x10u;
          while (2)
          {
            uint64_t v93 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v93);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v94;
              v62 |= (unint64_t)(v95 & 0x7F) << v91;
              if (v95 < 0)
              {
                v91 += 7;
                BOOL v11 = v92++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_253;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_253:
          uint64_t v137 = 40;
          goto LABEL_262;
        case 0x21u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x20u;
          while (2)
          {
            uint64_t v98 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v99 = v98 + 1;
            if (v98 == -1 || v99 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v98);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v99;
              v62 |= (unint64_t)(v100 & 0x7F) << v96;
              if (v100 < 0)
              {
                v96 += 7;
                BOOL v11 = v97++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_257;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_257:
          uint64_t v137 = 48;
          goto LABEL_262;
        case 0x28u:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v62 = 0;
          *(_DWORD *)&self->_has |= 0x80u;
          while (2)
          {
            uint64_t v103 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v104 = v103 + 1;
            if (v103 == -1 || v104 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v105 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v103);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v104;
              v62 |= (unint64_t)(v105 & 0x7F) << v101;
              if (v105 < 0)
              {
                v101 += 7;
                BOOL v11 = v102++ >= 9;
                if (v11)
                {
                  uint64_t v62 = 0;
                  goto LABEL_261;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v62 = 0;
          }
LABEL_261:
          uint64_t v137 = 64;
LABEL_262:
          *(void *)&self->PBCodable_opaque[v137] = v62;
          goto LABEL_293;
        case 0x29u:
          char v106 = 0;
          unsigned int v107 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x1000000u;
          while (2)
          {
            uint64_t v108 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v109 = v108 + 1;
            if (v108 == -1 || v109 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v108);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v109;
              v19 |= (unint64_t)(v110 & 0x7F) << v106;
              if (v110 < 0)
              {
                v106 += 7;
                BOOL v11 = v107++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_266;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_266:
          uint64_t v136 = 192;
          goto LABEL_283;
        case 0x32u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x800000u;
          while (2)
          {
            uint64_t v113 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v114 = v113 + 1;
            if (v113 == -1 || v114 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v115 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v113);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v114;
              v19 |= (unint64_t)(v115 & 0x7F) << v111;
              if (v115 < 0)
              {
                v111 += 7;
                BOOL v11 = v112++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_270;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_270:
          uint64_t v136 = 188;
          goto LABEL_283;
        case 0x33u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x4000u;
          while (2)
          {
            uint64_t v118 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v118);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v119;
              v19 |= (unint64_t)(v120 & 0x7F) << v116;
              if (v120 < 0)
              {
                v116 += 7;
                BOOL v11 = v117++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_274;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_274:
          uint64_t v136 = 116;
          goto LABEL_283;
        case 0x34u:
          uint64_t v121 = PBReaderReadString();
          uint64_t v122 = 160;
          goto LABEL_180;
        case 0x35u:
          char v123 = 0;
          unsigned int v124 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x40000u;
          while (2)
          {
            uint64_t v125 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v126 = v125 + 1;
            if (v125 == -1 || v126 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v125);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v126;
              v19 |= (unint64_t)(v127 & 0x7F) << v123;
              if (v127 < 0)
              {
                v123 += 7;
                BOOL v11 = v124++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_278;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_278:
          uint64_t v136 = 168;
          goto LABEL_283;
        case 0x36u:
          uint64_t v121 = PBReaderReadString();
          uint64_t v122 = 144;
          goto LABEL_180;
        case 0x37u:
          uint64_t v121 = PBReaderReadString();
          uint64_t v122 = 120;
          goto LABEL_180;
        case 0x38u:
          uint64_t v121 = PBReaderReadString();
          uint64_t v122 = 128;
LABEL_180:
          v128 = *(void **)&self->PBCodable_opaque[v122];
          *(void *)&self->PBCodable_opaque[v122] = v121;

          goto LABEL_293;
        case 0x39u:
          char v129 = 0;
          unsigned int v130 = 0;
          uint64_t v19 = 0;
          *(_DWORD *)&self->_has |= 0x8000u;
          while (2)
          {
            uint64_t v131 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v132 = v131 + 1;
            if (v131 == -1 || v132 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v131);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v132;
              v19 |= (unint64_t)(v133 & 0x7F) << v129;
              if (v133 < 0)
              {
                v129 += 7;
                BOOL v11 = v130++ >= 9;
                if (v11)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_282;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v19) = 0;
          }
LABEL_282:
          uint64_t v136 = 136;
LABEL_283:
          *(_DWORD *)&self->PBCodable_opaque[v136] = v19;
          goto LABEL_293;
        case 0x3Au:
          *(_DWORD *)&self->_has |= 0x100u;
          unint64_t v134 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v134 <= 0xFFFFFFFFFFFFFFF7 && v134 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v15 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v134);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v134 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v15 = 0;
          }
          uint64_t v138 = 72;
LABEL_292:
          *(void *)&self->PBCodable_opaque[v138] = v15;
          goto LABEL_293;
        case 0x3Cu:
          v135 = objc_alloc_init(_ADPBProxyTCPInfoMetrics);
          [(_ADPBProxyGetMetricsResponse *)self addTcpInfoMetrics:v135];
          if (!PBReaderPlaceMark() || (sub_10007270C((uint64_t)v135, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v39) = 0;
            return v39;
          }
          PBReaderRecallMark();

LABEL_293:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_294;
          break;
        default:
          int v39 = PBReaderSkipValueWithTag();
          if (!v39) {
            return v39;
          }
          goto LABEL_293;
      }
    }
  }
LABEL_294:
  LOBYTE(v39) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v39;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    char v23 = +[NSNumber numberWithDouble:self->_openInterval];
    [v3 setObject:v23 forKey:@"open_interval"];

    $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v24 = +[NSNumber numberWithDouble:self->_firstByteReadInterval];
  [v3 setObject:v24 forKey:@"first_byte_read_interval"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v25 = +[NSNumber numberWithUnsignedInt:self->_attemptCount];
  [v3 setObject:v25 forKey:@"attempt_count"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v26 = +[NSNumber numberWithUnsignedInt:self->_metricsCount];
  [v3 setObject:v26 forKey:@"metrics_count"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  char v27 = +[NSNumber numberWithDouble:self->_pingMean];
  [v3 setObject:v27 forKey:@"ping_mean"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v28 = +[NSNumber numberWithUnsignedInt:self->_pingCount];
  [v3 setObject:v28 forKey:@"ping_count"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  char v29 = +[NSNumber numberWithUnsignedInt:self->_unacknowledgedPingCount];
  [v3 setObject:v29 forKey:@"unacknowledged_ping_count"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  unsigned int v30 = +[NSNumber numberWithUnsignedInt:self->_rttCurrent];
  [v3 setObject:v30 forKey:@"rtt_current"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v31 = +[NSNumber numberWithUnsignedInt:self->_rttSmoothed];
  [v3 setObject:v31 forKey:@"rtt_smoothed"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v32 = +[NSNumber numberWithUnsignedInt:self->_rttVariance];
  [v3 setObject:v32 forKey:@"rtt_variance"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  char v33 = +[NSNumber numberWithUnsignedInt:self->_rttBest];
  [v3 setObject:v33 forKey:@"rtt_best"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  char v34 = +[NSNumber numberWithUnsignedLongLong:self->_txPackets];
  [v3 setObject:v34 forKey:@"tx_packets"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  unsigned int v35 = +[NSNumber numberWithUnsignedLongLong:self->_txBytes];
  [v3 setObject:v35 forKey:@"tx_bytes"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:self->_txRetransmitBytes];
  [v3 setObject:v36 forKey:@"tx_retransmit_bytes"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  unint64_t v37 = +[NSNumber numberWithUnsignedLongLong:self->_txUnacked];
  [v3 setObject:v37 forKey:@"tx_unacked"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  char v38 = +[NSNumber numberWithUnsignedLongLong:self->_rxPackets];
  [v3 setObject:v38 forKey:@"rx_packets"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  int v39 = +[NSNumber numberWithUnsignedLongLong:self->_rxBytes];
  [v3 setObject:v39 forKey:@"rx_bytes"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  char v40 = +[NSNumber numberWithUnsignedLongLong:self->_rxDuplicateBytes];
  [v3 setObject:v40 forKey:@"rx_duplicate_bytes"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  unsigned int v41 = +[NSNumber numberWithUnsignedLongLong:self->_rxOooBytes];
  [v3 setObject:v41 forKey:@"rx_ooo_bytes"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v42 = +[NSNumber numberWithUnsignedLongLong:self->_sndBandwidth];
  [v3 setObject:v42 forKey:@"snd_bandwidth"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  unint64_t v43 = +[NSNumber numberWithUnsignedInt:self->_synRetransmits];
  [v3 setObject:v43 forKey:@"syn_retransmits"];

  $CDED8D9E47E00826CC7FF028C2476AF6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_70:
  char v44 = +[NSNumber numberWithUnsignedInt:self->_subflowCount];
  [v3 setObject:v44 forKey:@"subflow_count"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_24:
    char v5 = +[NSNumber numberWithUnsignedInt:self->_connectedSubflowCount];
    [v3 setObject:v5 forKey:@"connected_subflow_count"];
  }
LABEL_25:
  primarySubflowIface = self->_primarySubflowIface;
  if (primarySubflowIface) {
    [v3 setObject:primarySubflowIface forKey:@"primary_subflow_iface"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    unint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_primarySubflowSwitchCount];
    [v3 setObject:v7 forKey:@"primary_subflow_switch_count"];
  }
  connectionMethodName = self->_connectionMethodName;
  if (connectionMethodName) {
    [v3 setObject:connectionMethodName forKey:@"connectionMethodName"];
  }
  connectionEdgeIDName = self->_connectionEdgeIDName;
  if (connectionEdgeIDName) {
    [v3 setObject:connectionEdgeIDName forKey:@"connectionEdgeIDName"];
  }
  connectionEdgeType = self->_connectionEdgeType;
  if (connectionEdgeType) {
    [v3 setObject:connectionEdgeType forKey:@"connectionEdgeType"];
  }
  $CDED8D9E47E00826CC7FF028C2476AF6 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    int v12 = +[NSNumber numberWithUnsignedInt:self->_connectionFallbackReason];
    [v3 setObject:v12 forKey:@"connectionFallbackReason"];

    $CDED8D9E47E00826CC7FF028C2476AF6 v11 = self->_has;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    long long v13 = +[NSNumber numberWithDouble:self->_tuscanyConnectionDelay];
    [v3 setObject:v13 forKey:@"tuscanyConnectionDelay"];
  }
  if ([(NSMutableArray *)self->_tcpInfoMetrics count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_tcpInfoMetrics, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v15 = self->_tcpInfoMetrics;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "dictionaryRepresentation", (void)v45);
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"tcp_info_metrics"];
  }
  id v21 = v3;

  return v21;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBProxyGetMetricsResponse;
  id v3 = [(_ADPBProxyGetMetricsResponse *)&v7 description];
  id v4 = [(_ADPBProxyGetMetricsResponse *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)tcpInfoMetricsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tcpInfoMetrics objectAtIndex:a3];
}

- (unint64_t)tcpInfoMetricsCount
{
  return (unint64_t)[(NSMutableArray *)self->_tcpInfoMetrics count];
}

- (void)addTcpInfoMetrics:(id)a3
{
  id v4 = a3;
  tcpInfoMetrics = self->_tcpInfoMetrics;
  id v8 = v4;
  if (!tcpInfoMetrics)
  {
    unsigned int v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_tcpInfoMetrics;
    self->_tcpInfoMetrics = v6;

    id v4 = v8;
    tcpInfoMetrics = self->_tcpInfoMetrics;
  }
  [(NSMutableArray *)tcpInfoMetrics addObject:v4];
}

- (void)clearTcpInfoMetrics
{
}

- (BOOL)hasTuscanyConnectionDelay
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasTuscanyConnectionDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setTuscanyConnectionDelay:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_double tuscanyConnectionDelay = a3;
}

- (BOOL)hasConnectionFallbackReason
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasConnectionFallbackReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)setConnectionFallbackReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_connectionFallbackReason = a3;
}

- (BOOL)hasConnectionEdgeType
{
  return self->_connectionEdgeType != 0;
}

- (BOOL)hasConnectionEdgeIDName
{
  return self->_connectionEdgeIDName != 0;
}

- (BOOL)hasConnectionMethodName
{
  return self->_connectionMethodName != 0;
}

- (BOOL)hasPrimarySubflowSwitchCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasPrimarySubflowSwitchCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setPrimarySubflowSwitchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_primarySubflowSwitchCount = a3;
}

- (BOOL)hasPrimarySubflowIface
{
  return self->_primarySubflowIface != 0;
}

- (BOOL)hasConnectedSubflowCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasConnectedSubflowCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)setConnectedSubflowCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_connectedSubflowCount = a3;
}

- (BOOL)hasSubflowCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasSubflowCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)setSubflowCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_subflowCount = a3;
}

- (BOOL)hasSynRetransmits
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_synRetransmits = a3;
}

- (BOOL)hasSndBandwidth
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasSndBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setSndBandwidth:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sndBandwidth = a3;
}

- (BOOL)hasRxOooBytes
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasRxOooBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)setRxOooBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_rxOooBytes = a3;
}

- (BOOL)hasRxDuplicateBytes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasRxDuplicateBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_rxDuplicateBytes = a3;
}

- (BOOL)hasRxBytes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasRxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_rxBytes = a3;
}

- (BOOL)hasRxPackets
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rxPackets = a3;
}

- (BOOL)hasTxUnacked
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasTxUnacked:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setTxUnacked:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txUnacked = a3;
}

- (BOOL)hasTxRetransmitBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTxRetransmitBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txRetransmitBytes = a3;
}

- (BOOL)hasTxBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txBytes = a3;
}

- (BOOL)hasTxPackets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txPackets = a3;
}

- (BOOL)hasRttBest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasRttBest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setRttBest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rttBest = a3;
}

- (BOOL)hasRttVariance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasRttVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_rttVariance = a3;
}

- (BOOL)hasRttSmoothed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rttSmoothed = a3;
}

- (BOOL)hasRttCurrent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rttCurrent = a3;
}

- (BOOL)hasUnacknowledgedPingCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasUnacknowledgedPingCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)setUnacknowledgedPingCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_unacknowledgedPingCount = a3;
}

- (BOOL)hasPingCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasPingCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setPingCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_pingCount = a3;
}

- (BOOL)hasPingMean
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPingMean:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)setPingMean:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_double pingMean = a3;
}

- (BOOL)hasMetricsCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasMetricsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setMetricsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_metricsCount = a3;
}

- (BOOL)hasAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasAttemptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_attemptCount = a3;
}

- (BOOL)hasFirstByteReadInterval
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasFirstByteReadInterval:(BOOL)a3
{
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setFirstByteReadInterval:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_double firstByteReadInterval = a3;
}

- (BOOL)hasOpenInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOpenInterval:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$CDED8D9E47E00826CC7FF028C2476AF6 has = ($CDED8D9E47E00826CC7FF028C2476AF6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)setOpenInterval:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_double openInterval = a3;
}

+ (Class)tcpInfoMetricsType
{
  return (Class)objc_opt_class();
}

@end