@interface _CPTCPInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)statsType;
- (_CPTCPInfo)initWithTelemetryDictionary:(id)a3;
- (unint64_t)cellRXPackets;
- (unint64_t)cellTXPackets;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxDuplicateBytes;
- (unint64_t)rxOutOfOrderBytes;
- (unint64_t)rxPackets;
- (unint64_t)txBytes;
- (unint64_t)txPackets;
- (unint64_t)txRetransmitBytes;
- (unint64_t)txRetransmitPackets;
- (unint64_t)wifiRXPackets;
- (unint64_t)wifiTXPackets;
- (unint64_t)wiredRXPackets;
- (unint64_t)wiredTXPackets;
- (unsigned)avgRTT;
- (unsigned)connectAttempts;
- (unsigned)connectSuccesses;
- (unsigned)minRTT;
- (unsigned)varRTT;
- (void)setAvgRTT:(unsigned int)a3;
- (void)setCellRXPackets:(unint64_t)a3;
- (void)setCellTXPackets:(unint64_t)a3;
- (void)setConnectAttempts:(unsigned int)a3;
- (void)setConnectSuccesses:(unsigned int)a3;
- (void)setMinRTT:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxDuplicateBytes:(unint64_t)a3;
- (void)setRxOutOfOrderBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setStatsType:(id)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxRetransmitBytes:(unint64_t)a3;
- (void)setTxRetransmitPackets:(unint64_t)a3;
- (void)setVarRTT:(unsigned int)a3;
- (void)setWifiRXPackets:(unint64_t)a3;
- (void)setWifiTXPackets:(unint64_t)a3;
- (void)setWiredRXPackets:(unint64_t)a3;
- (void)setWiredTXPackets:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPTCPInfo

- (void).cxx_destruct
{
}

- (void)setTxRetransmitBytes:(unint64_t)a3
{
  self->_txRetransmitBytes = a3;
}

- (unint64_t)txRetransmitBytes
{
  return self->_txRetransmitBytes;
}

- (void)setStatsType:(id)a3
{
}

- (NSString)statsType
{
  return self->_statsType;
}

- (void)setWiredTXPackets:(unint64_t)a3
{
  self->_wiredTXPackets = a3;
}

- (unint64_t)wiredTXPackets
{
  return self->_wiredTXPackets;
}

- (void)setWiredRXPackets:(unint64_t)a3
{
  self->_wiredRXPackets = a3;
}

- (unint64_t)wiredRXPackets
{
  return self->_wiredRXPackets;
}

- (void)setWifiTXPackets:(unint64_t)a3
{
  self->_wifiTXPackets = a3;
}

- (unint64_t)wifiTXPackets
{
  return self->_wifiTXPackets;
}

- (void)setWifiRXPackets:(unint64_t)a3
{
  self->_wifiRXPackets = a3;
}

- (unint64_t)wifiRXPackets
{
  return self->_wifiRXPackets;
}

- (void)setVarRTT:(unsigned int)a3
{
  self->_varRTT = a3;
}

- (unsigned)varRTT
{
  return self->_varRTT;
}

- (void)setTxRetransmitPackets:(unint64_t)a3
{
  self->_txRetransmitPackets = a3;
}

- (unint64_t)txRetransmitPackets
{
  return self->_txRetransmitPackets;
}

- (void)setTxPackets:(unint64_t)a3
{
  self->_txPackets = a3;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (void)setRxPackets:(unint64_t)a3
{
  self->_rxPackets = a3;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  self->_rxOutOfOrderBytes = a3;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (void)setRxDuplicateBytes:(unint64_t)a3
{
  self->_rxDuplicateBytes = a3;
}

- (unint64_t)rxDuplicateBytes
{
  return self->_rxDuplicateBytes;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (void)setMinRTT:(unsigned int)a3
{
  self->_minRTT = a3;
}

- (unsigned)minRTT
{
  return self->_minRTT;
}

- (void)setConnectSuccesses:(unsigned int)a3
{
  self->_connectSuccesses = a3;
}

- (unsigned)connectSuccesses
{
  return self->_connectSuccesses;
}

- (void)setConnectAttempts:(unsigned int)a3
{
  self->_connectAttempts = a3;
}

- (unsigned)connectAttempts
{
  return self->_connectAttempts;
}

- (void)setCellTXPackets:(unint64_t)a3
{
  self->_cellTXPackets = a3;
}

- (unint64_t)cellTXPackets
{
  return self->_cellTXPackets;
}

- (void)setCellRXPackets:(unint64_t)a3
{
  self->_cellRXPackets = a3;
}

- (unint64_t)cellRXPackets
{
  return self->_cellRXPackets;
}

- (void)setAvgRTT:(unsigned int)a3
{
  self->_avgRTT = a3;
}

- (unsigned)avgRTT
{
  return self->_avgRTT;
}

- (unint64_t)hash
{
  unint64_t v2 = (2654435761u * self->_cellRXPackets) ^ (2654435761 * self->_avgRTT) ^ (2654435761u * self->_cellTXPackets) ^ (2654435761 * self->_connectAttempts) ^ (2654435761 * self->_connectSuccesses) ^ (2654435761 * self->_minRTT) ^ (2654435761u * self->_rxBytes) ^ (2654435761u * self->_rxDuplicateBytes) ^ (2654435761u * self->_rxOutOfOrderBytes) ^ (2654435761u * self->_rxPackets) ^ (2654435761u * self->_txBytes) ^ (2654435761u * self->_txPackets) ^ (2654435761u * self->_txRetransmitPackets) ^ (2654435761 * self->_varRTT) ^ (2654435761u * self->_wifiRXPackets) ^ (2654435761u * self->_wifiTXPackets) ^ (2654435761u * self->_wiredRXPackets);
  unint64_t v3 = 2654435761u * self->_wiredTXPackets;
  return v2 ^ v3 ^ [(NSString *)self->_statsType hash] ^ (2654435761u * self->_txRetransmitBytes);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unsigned int avgRTT = self->_avgRTT;
    if (avgRTT == [v4 avgRTT])
    {
      unint64_t cellRXPackets = self->_cellRXPackets;
      if (cellRXPackets == [v4 cellRXPackets])
      {
        unint64_t cellTXPackets = self->_cellTXPackets;
        if (cellTXPackets == [v4 cellTXPackets])
        {
          unsigned int connectAttempts = self->_connectAttempts;
          if (connectAttempts == [v4 connectAttempts])
          {
            unsigned int connectSuccesses = self->_connectSuccesses;
            if (connectSuccesses == [v4 connectSuccesses])
            {
              unsigned int minRTT = self->_minRTT;
              if (minRTT == [v4 minRTT])
              {
                unint64_t rxBytes = self->_rxBytes;
                if (rxBytes == [v4 rxBytes])
                {
                  unint64_t rxDuplicateBytes = self->_rxDuplicateBytes;
                  if (rxDuplicateBytes == [v4 rxDuplicateBytes])
                  {
                    unint64_t rxOutOfOrderBytes = self->_rxOutOfOrderBytes;
                    if (rxOutOfOrderBytes == [v4 rxOutOfOrderBytes])
                    {
                      unint64_t rxPackets = self->_rxPackets;
                      if (rxPackets == [v4 rxPackets])
                      {
                        unint64_t txBytes = self->_txBytes;
                        if (txBytes == [v4 txBytes])
                        {
                          unint64_t txPackets = self->_txPackets;
                          if (txPackets == [v4 txPackets])
                          {
                            unint64_t txRetransmitPackets = self->_txRetransmitPackets;
                            if (txRetransmitPackets == [v4 txRetransmitPackets])
                            {
                              unsigned int varRTT = self->_varRTT;
                              if (varRTT == [v4 varRTT])
                              {
                                unint64_t wifiRXPackets = self->_wifiRXPackets;
                                if (wifiRXPackets == [v4 wifiRXPackets])
                                {
                                  unint64_t wifiTXPackets = self->_wifiTXPackets;
                                  if (wifiTXPackets == [v4 wifiTXPackets])
                                  {
                                    unint64_t wiredRXPackets = self->_wiredRXPackets;
                                    if (wiredRXPackets == [v4 wiredRXPackets])
                                    {
                                      unint64_t wiredTXPackets = self->_wiredTXPackets;
                                      if (wiredTXPackets == [v4 wiredTXPackets])
                                      {
                                        v23 = [(_CPTCPInfo *)self statsType];
                                        v24 = [v4 statsType];
                                        v25 = v24;
                                        if ((v23 == 0) != (v24 != 0))
                                        {
                                          uint64_t v26 = [(_CPTCPInfo *)self statsType];
                                          if (!v26)
                                          {

LABEL_28:
                                            unint64_t txRetransmitBytes = self->_txRetransmitBytes;
                                            BOOL v31 = txRetransmitBytes == [v4 txRetransmitBytes];
                                            goto LABEL_26;
                                          }
                                          v27 = (void *)v26;
                                          v28 = [(_CPTCPInfo *)self statsType];
                                          v29 = [v4 statsType];
                                          int v30 = [v28 isEqual:v29];

                                          if (v30) {
                                            goto LABEL_28;
                                          }
                                        }
                                        else
                                        {
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
  BOOL v31 = 0;
LABEL_26:

  return v31;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPTCPInfo *)self avgRTT]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPTCPInfo *)self cellRXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self cellTXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self connectAttempts]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPTCPInfo *)self connectSuccesses]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPTCPInfo *)self minRTT]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPTCPInfo *)self rxBytes]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self rxDuplicateBytes]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self rxOutOfOrderBytes]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self rxPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self txBytes]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self txPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self txRetransmitPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self varRTT]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPTCPInfo *)self wifiRXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self wifiTXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self wiredRXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPTCPInfo *)self wiredTXPackets]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPTCPInfo *)self statsType];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPTCPInfo *)self txRetransmitBytes]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPTCPInfoReadFrom(self, (uint64_t)a3);
}

- (_CPTCPInfo)initWithTelemetryDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CPTCPInfo *)self init];
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v18 + 1) + 8 * i);
          if ([v11 compare:@"timing_data_key_unknown" options:3])
          {
            if ([v11 compare:@"_kCFNTimingDataConnectionReused" options:3])
            {
              if ([v11 compare:@"_kCFNTimingDataConnectionPeerAddress" options:3])
              {
                int v12 = 3;
                if ([v11 compare:@"_kCFNTimingDataConnectionInterfaceIdentifier" options:3])
                {
                  if ([v11 compare:@"omit" options:3])
                  {
                    if ([v11 compare:@"_kCFNTimingDataConnectionStartTimeCounts" options:3])
                    {
                      if ([v11 compare:@"_kCFNTimingDataConnectionStopTimeCounts" options:3])
                      {
                        if ([v11 compare:@"_kCFNTimingDataNStatRXPackets" options:3])
                        {
                          if ([v11 compare:@"_kCFNTimingDataNStatRXBytes" options:3])
                          {
                            if ([v11 compare:@"_kCFNTimingDataNStatTXPackets" options:3])
                            {
                              if ([v11 compare:@"_kCFNTimingDataNStatTXBytes" options:3])
                              {
                                if ([v11 compare:@"_kCFNTimingDataNStatRXDuplicateBytes" options:3])
                                {
                                  if ([v11 compare:@"_kCFNTimingDataNStatRXOutOfOrderBytes" options:3])
                                  {
                                    if ([v11 compare:@"_kCFNTimingDataNStatTXRetransmit" options:3])
                                    {
                                      if ([v11 compare:@"_kCFNTimingDataNStatConnectAttempts" options:3])
                                      {
                                        if ([v11 compare:@"_kCFNTimingDataNStatConnectSuccesses" options:3])
                                        {
                                          if ([v11 compare:@"_kCFNTimingDataNStatMinRTT" options:3])
                                          {
                                            if ([v11 compare:@"_kCFNTimingDataNStatAvgRTT" options:3])
                                            {
                                              if ([v11 compare:@"_kCFNTimingDataNStatVarRTT" options:3])
                                              {
                                                if ([v11 compare:@"_kCFNTimingDataNStatCellRXPackets" options:3])
                                                {
                                                  if ([v11 compare:@"_kCFNTimingDataNStatCellTXPackets" options:3])
                                                  {
                                                    if ([v11 compare:@"_kCFNTimingDataNStatWifiRXPackets" options:3])
                                                    {
                                                      if ([v11 compare:@"_kCFNTimingDataNStatWifiTXPackets" options:3])
                                                      {
                                                        if ([v11 compare:@"_kCFNTimingDataNStatWiredRXPackets" options:3])
                                                        {
                                                          if ([v11 compare:@"_kCFNTimingDataNStatWiredTXPackets" options:3])
                                                          {
                                                            if ([v11 compare:@"_kCFNTimingDataTCPFastOpenStats" options:3])
                                                            {
                                                              if ([v11 compare:@"_kCFNTimingDataTCPInfoAtStart" options:3])
                                                              {
                                                                if ([v11 compare:@"_kCFNTimingDataTCPInfoAtStop" options:3])
                                                                {
                                                                  if ([v11 compare:@"omit" options:3])
                                                                  {
                                                                    if ([v11 compare:@"_kCFNTimingDataRemoteAddressAndPort" options:3])
                                                                    {
                                                                      if ([v11 compare:@"_kCFNTimingDataNetworkProtocolName" options:3])
                                                                      {
                                                                        if ([v11 compare:@"_kCFNTimingDataConnectionRace" options:3])
                                                                        {
                                                                          if ([v11 compare:@"_kCFNTimingDataQUICWhitelistedDomain" options:3])
                                                                          {
                                                                            if ([v11 compare:@"_kCFNTimingDataRequestHeaderSize" options:3])
                                                                            {
                                                                              if ([v11 compare:@"_kCFNTimingDataResponseHeaderSize" options:3])
                                                                              {
                                                                                if ([v11 compare:@"_kCFNTimingDataResponseBodyBytesReceived" options:3])
                                                                                {
                                                                                  if ([v11 compare:@"_kCFNTimingDataResponseBodyBytesDecoded" options:3])
                                                                                  {
                                                                                    if ([v11 compare:@"_kCFNTimingDataFetchStart" options:3])
                                                                                    {
                                                                                      if ([v11 compare:@"_kCFNTimingDataDomainLookupStart" options:3])
                                                                                      {
                                                                                        if ([v11 compare:@"_kCFNTimingDataDomainLookupEnd" options:3])
                                                                                        {
                                                                                          if ([v11 compare:@"_kCFNTimingDataConnectStart" options:3])
                                                                                          {
                                                                                            if ([v11 compare:@"_kCFNTimingDataSecureConnectionStart" options:3])
                                                                                            {
                                                                                              if ([v11 compare:@"_kCFNTimingDataConnectEnd" options:3])
                                                                                              {
                                                                                                if ([v11 compare:@"_kCFNTimingDataRequestStart" options:3])
                                                                                                {
                                                                                                  if ([v11 compare:@"_kCFNTimingDataRequestEnd" options:3])
                                                                                                  {
                                                                                                    if ([v11 compare:@"_kCFNTimingDataResponseStart" options:3])
                                                                                                    {
                                                                                                      if ([v11 compare:@"_kCFNTimingDataResponseEnd" options:3])
                                                                                                      {
                                                                                                        if ([v11 compare:@"_kCFNTimingDataRedirectStart" options:3])
                                                                                                        {
                                                                                                          if ([v11 compare:@"_kCFNTimingDataRedirectEnd" options:3]) {
                                                                                                            int v12 = 0;
                                                                                                          }
                                                                                                          else {
                                                                                                            int v12 = 48;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          int v12 = 47;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        int v12 = 46;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      int v12 = 45;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    int v12 = 44;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  int v12 = 43;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                int v12 = 42;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              int v12 = 41;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            int v12 = 40;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          int v12 = 39;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        int v12 = 38;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      int v12 = 37;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    int v12 = 36;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  int v12 = 35;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                int v12 = 34;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              int v12 = 33;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            int v12 = 32;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          int v12 = 31;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v12 = 30;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      int v12 = 29;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v12 = 28;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  int v12 = 27;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v12 = 26;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              int v12 = 25;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v12 = 24;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          int v12 = 23;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v12 = 22;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      int v12 = 21;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v12 = 20;
                                                  }
                                                }
                                                else
                                                {
                                                  int v12 = 19;
                                                }
                                              }
                                              else
                                              {
                                                int v12 = 18;
                                              }
                                            }
                                            else
                                            {
                                              int v12 = 17;
                                            }
                                          }
                                          else
                                          {
                                            int v12 = 16;
                                          }
                                        }
                                        else
                                        {
                                          int v12 = 15;
                                        }
                                      }
                                      else
                                      {
                                        int v12 = 14;
                                      }
                                    }
                                    else
                                    {
                                      int v12 = 13;
                                    }
                                  }
                                  else
                                  {
                                    int v12 = 12;
                                  }
                                }
                                else
                                {
                                  int v12 = 11;
                                }
                              }
                              else
                              {
                                int v12 = 10;
                              }
                            }
                            else
                            {
                              int v12 = 9;
                            }
                          }
                          else
                          {
                            int v12 = 8;
                          }
                        }
                        else
                        {
                          int v12 = 7;
                        }
                      }
                      else
                      {
                        int v12 = 6;
                      }
                    }
                    else
                    {
                      int v12 = 5;
                    }
                  }
                  else
                  {
                    int v12 = 4;
                  }
                }
              }
              else
              {
                int v12 = 2;
              }
            }
            else
            {
              int v12 = 1;
            }
          }
          else
          {
            int v12 = 0;
          }

          v13 = [v6 objectForKeyedSubscript:v11];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [v13 unsignedIntegerValue];
            switch(v12)
            {
              case 7:
                [(_CPTCPInfo *)v5 setRxPackets:v14];
                break;
              case 8:
                [(_CPTCPInfo *)v5 setRxBytes:v14];
                break;
              case 9:
                [(_CPTCPInfo *)v5 setTxPackets:v14];
                break;
              case 10:
                [(_CPTCPInfo *)v5 setTxBytes:v14];
                break;
              case 11:
                [(_CPTCPInfo *)v5 setRxDuplicateBytes:v14];
                break;
              case 12:
                [(_CPTCPInfo *)v5 setRxOutOfOrderBytes:v14];
                break;
              case 13:
                [(_CPTCPInfo *)v5 setTxRetransmitPackets:v14];
                break;
              case 14:
                [(_CPTCPInfo *)v5 setConnectAttempts:v14];
                break;
              case 15:
                [(_CPTCPInfo *)v5 setConnectSuccesses:v14];
                break;
              case 16:
                [(_CPTCPInfo *)v5 setMinRTT:v14];
                break;
              case 17:
                [(_CPTCPInfo *)v5 setAvgRTT:v14];
                break;
              case 18:
                [(_CPTCPInfo *)v5 setVarRTT:v14];
                break;
              case 19:
                [(_CPTCPInfo *)v5 setCellRXPackets:v14];
                break;
              case 20:
                [(_CPTCPInfo *)v5 setCellTXPackets:v14];
                break;
              case 21:
                [(_CPTCPInfo *)v5 setWifiRXPackets:v14];
                break;
              case 22:
                [(_CPTCPInfo *)v5 setWifiTXPackets:v14];
                break;
              case 23:
                [(_CPTCPInfo *)v5 setWiredRXPackets:v14];
                break;
              case 24:
                [(_CPTCPInfo *)v5 setWiredTXPackets:v14];
                break;
              default:
                break;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    v15 = v5;
    id v4 = v17;
  }

  return v5;
}

@end