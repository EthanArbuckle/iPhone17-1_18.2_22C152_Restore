@interface _CPNetworkTimingData
+ (id)startMetricsForNormalization;
- (BOOL)QUICWhitelistedDomain;
- (BOOL)TFOSuccess;
- (BOOL)connectionRace;
- (BOOL)connectionReused;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)peerAddress;
- (NSString)connectionUUID;
- (NSString)interfaceIdentifier;
- (NSString)networkProtocolName;
- (_CPNetworkTimingData)initWithTelemetryDictionary:(id)a3;
- (_CPTCPInfo)startTimeCounts;
- (_CPTCPInfo)stopTimeCounts;
- (double)timingDataInit;
- (unint64_t)hash;
- (unsigned)connectEnd;
- (unsigned)connectStart;
- (unsigned)domainLookupEnd;
- (unsigned)domainLookupStart;
- (unsigned)fetchStart;
- (unsigned)redirectCount;
- (unsigned)redirectCountW3C;
- (unsigned)redirectEnd;
- (unsigned)redirectStart;
- (unsigned)requestEnd;
- (unsigned)requestHeaderSize;
- (unsigned)requestStart;
- (unsigned)responseBodyBytesDecoded;
- (unsigned)responseBodyBytesReceived;
- (unsigned)responseEnd;
- (unsigned)responseHeaderSize;
- (unsigned)responseStart;
- (unsigned)secureConnectStart;
- (void)setConnectEnd:(unsigned int)a3;
- (void)setConnectStart:(unsigned int)a3;
- (void)setConnectionRace:(BOOL)a3;
- (void)setConnectionReused:(BOOL)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDomainLookupEnd:(unsigned int)a3;
- (void)setDomainLookupStart:(unsigned int)a3;
- (void)setFetchStart:(unsigned int)a3;
- (void)setInterfaceIdentifier:(id)a3;
- (void)setNetworkProtocolName:(id)a3;
- (void)setPeerAddress:(id)a3;
- (void)setQUICWhitelistedDomain:(BOOL)a3;
- (void)setRedirectCount:(unsigned int)a3;
- (void)setRedirectCountW3C:(unsigned int)a3;
- (void)setRedirectEnd:(unsigned int)a3;
- (void)setRedirectStart:(unsigned int)a3;
- (void)setRequestEnd:(unsigned int)a3;
- (void)setRequestHeaderSize:(unsigned int)a3;
- (void)setRequestStart:(unsigned int)a3;
- (void)setResponseBodyBytesDecoded:(unsigned int)a3;
- (void)setResponseBodyBytesReceived:(unsigned int)a3;
- (void)setResponseEnd:(unsigned int)a3;
- (void)setResponseHeaderSize:(unsigned int)a3;
- (void)setResponseStart:(unsigned int)a3;
- (void)setSecureConnectStart:(unsigned int)a3;
- (void)setStartTimeCounts:(id)a3;
- (void)setStopTimeCounts:(id)a3;
- (void)setTFOSuccess:(BOOL)a3;
- (void)setTimingDataInit:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPNetworkTimingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_stopTimeCounts, 0);
  objc_storeStrong((id *)&self->_startTimeCounts, 0);
  objc_storeStrong((id *)&self->_peerAddress, 0);

  objc_storeStrong((id *)&self->_interfaceIdentifier, 0);
}

- (void)setSecureConnectStart:(unsigned int)a3
{
  self->_secureConnectStart = a3;
}

- (unsigned)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setResponseEnd:(unsigned int)a3
{
  self->_responseEnd = a3;
}

- (unsigned)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseStart:(unsigned int)a3
{
  self->_responseStart = a3;
}

- (unsigned)responseStart
{
  return self->_responseStart;
}

- (void)setRequestEnd:(unsigned int)a3
{
  self->_requestEnd = a3;
}

- (unsigned)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestStart:(unsigned int)a3
{
  self->_requestStart = a3;
}

- (unsigned)requestStart
{
  return self->_requestStart;
}

- (void)setRedirectEnd:(unsigned int)a3
{
  self->_redirectEnd = a3;
}

- (unsigned)redirectEnd
{
  return self->_redirectEnd;
}

- (void)setRedirectStart:(unsigned int)a3
{
  self->_redirectStart = a3;
}

- (unsigned)redirectStart
{
  return self->_redirectStart;
}

- (void)setFetchStart:(unsigned int)a3
{
  self->_fetchStart = a3;
}

- (unsigned)fetchStart
{
  return self->_fetchStart;
}

- (void)setDomainLookupEnd:(unsigned int)a3
{
  self->_domainLookupEnd = a3;
}

- (unsigned)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setDomainLookupStart:(unsigned int)a3
{
  self->_domainLookupStart = a3;
}

- (unsigned)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setConnectEnd:(unsigned int)a3
{
  self->_connectEnd = a3;
}

- (unsigned)connectEnd
{
  return self->_connectEnd;
}

- (void)setConnectStart:(unsigned int)a3
{
  self->_connectStart = a3;
}

- (unsigned)connectStart
{
  return self->_connectStart;
}

- (void)setTimingDataInit:(double)a3
{
  self->_timingDataInit = a3;
}

- (double)timingDataInit
{
  return self->_timingDataInit;
}

- (void)setTFOSuccess:(BOOL)a3
{
  self->_TFOSuccess = a3;
}

- (BOOL)TFOSuccess
{
  return self->_TFOSuccess;
}

- (void)setResponseHeaderSize:(unsigned int)a3
{
  self->_responseHeaderSize = a3;
}

- (unsigned)responseHeaderSize
{
  return self->_responseHeaderSize;
}

- (void)setResponseBodyBytesReceived:(unsigned int)a3
{
  self->_responseBodyBytesReceived = a3;
}

- (unsigned)responseBodyBytesReceived
{
  return self->_responseBodyBytesReceived;
}

- (void)setResponseBodyBytesDecoded:(unsigned int)a3
{
  self->_responseBodyBytesDecoded = a3;
}

- (unsigned)responseBodyBytesDecoded
{
  return self->_responseBodyBytesDecoded;
}

- (void)setRequestHeaderSize:(unsigned int)a3
{
  self->_requestHeaderSize = a3;
}

- (unsigned)requestHeaderSize
{
  return self->_requestHeaderSize;
}

- (void)setRedirectCountW3C:(unsigned int)a3
{
  self->_redirectCountW3C = a3;
}

- (unsigned)redirectCountW3C
{
  return self->_redirectCountW3C;
}

- (void)setRedirectCount:(unsigned int)a3
{
  self->_redirectCount = a3;
}

- (unsigned)redirectCount
{
  return self->_redirectCount;
}

- (void)setQUICWhitelistedDomain:(BOOL)a3
{
  self->_QUICWhitelistedDomain = a3;
}

- (BOOL)QUICWhitelistedDomain
{
  return self->_QUICWhitelistedDomain;
}

- (void)setNetworkProtocolName:(id)a3
{
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setStopTimeCounts:(id)a3
{
}

- (_CPTCPInfo)stopTimeCounts
{
  return self->_stopTimeCounts;
}

- (void)setStartTimeCounts:(id)a3
{
}

- (_CPTCPInfo)startTimeCounts
{
  return self->_startTimeCounts;
}

- (void)setConnectionReused:(BOOL)a3
{
  self->_connectionReused = a3;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (void)setConnectionRace:(BOOL)a3
{
  self->_connectionRace = a3;
}

- (BOOL)connectionRace
{
  return self->_connectionRace;
}

- (void)setPeerAddress:(id)a3
{
}

- (NSData)peerAddress
{
  return self->_peerAddress;
}

- (void)setInterfaceIdentifier:(id)a3
{
}

- (NSString)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_interfaceIdentifier hash];
  uint64_t v4 = [(NSData *)self->_peerAddress hash] ^ v3 ^ (2654435761 * self->_connectionRace);
  uint64_t v5 = 2654435761 * self->_connectionReused;
  unint64_t v6 = v4 ^ v5 ^ [(_CPTCPInfo *)self->_startTimeCounts hash];
  unint64_t v7 = [(_CPTCPInfo *)self->_stopTimeCounts hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_connectionUUID hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_networkProtocolName hash] ^ (2654435761 * self->_QUICWhitelistedDomain) ^ (2654435761 * self->_redirectCount) ^ (2654435761 * self->_redirectCountW3C) ^ (2654435761 * self->_requestHeaderSize) ^ (2654435761 * self->_responseBodyBytesDecoded) ^ (2654435761 * self->_responseBodyBytesReceived);
  double timingDataInit = self->_timingDataInit;
  double v12 = -timingDataInit;
  if (timingDataInit >= 0.0) {
    double v12 = self->_timingDataInit;
  }
  long double v13 = round(v12);
  uint64_t v11 = (2654435761 * self->_responseHeaderSize) ^ (2654435761 * self->_TFOSuccess);
  return v9 ^ v11 ^ (2654435761 * self->_connectStart) ^ (2654435761 * self->_connectEnd) ^ (2654435761
                                                                                               * self->_domainLookupStart) ^ (2654435761 * self->_domainLookupEnd) ^ (2654435761 * self->_fetchStart) ^ (2654435761 * self->_redirectStart) ^ (2654435761 * self->_redirectEnd) ^ (2654435761 * self->_requestStart) ^ (2654435761 * self->_requestEnd) ^ (2654435761 * self->_responseStart) ^ (2654435761 * self->_responseEnd) ^ (2654435761 * self->_secureConnectStart) ^ ((unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self interfaceIdentifier];
  unint64_t v6 = [v4 interfaceIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v7 = [(_CPNetworkTimingData *)self interfaceIdentifier];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_CPNetworkTimingData *)self interfaceIdentifier];
    v10 = [v4 interfaceIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self peerAddress];
  unint64_t v6 = [v4 peerAddress];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v12 = [(_CPNetworkTimingData *)self peerAddress];
  if (v12)
  {
    long double v13 = (void *)v12;
    v14 = [(_CPNetworkTimingData *)self peerAddress];
    v15 = [v4 peerAddress];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int connectionRace = self->_connectionRace;
  if (connectionRace != [v4 connectionRace]) {
    goto LABEL_34;
  }
  int connectionReused = self->_connectionReused;
  if (connectionReused != [v4 connectionReused]) {
    goto LABEL_34;
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self startTimeCounts];
  unint64_t v6 = [v4 startTimeCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v19 = [(_CPNetworkTimingData *)self startTimeCounts];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPNetworkTimingData *)self startTimeCounts];
    v22 = [v4 startTimeCounts];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self stopTimeCounts];
  unint64_t v6 = [v4 stopTimeCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v24 = [(_CPNetworkTimingData *)self stopTimeCounts];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_CPNetworkTimingData *)self stopTimeCounts];
    v27 = [v4 stopTimeCounts];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self connectionUUID];
  unint64_t v6 = [v4 connectionUUID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_33;
  }
  uint64_t v29 = [(_CPNetworkTimingData *)self connectionUUID];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_CPNetworkTimingData *)self connectionUUID];
    v32 = [v4 connectionUUID];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self networkProtocolName];
  unint64_t v6 = [v4 networkProtocolName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v34 = [(_CPNetworkTimingData *)self networkProtocolName];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_CPNetworkTimingData *)self networkProtocolName];
    v37 = [v4 networkProtocolName];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int QUICWhitelistedDomain = self->_QUICWhitelistedDomain;
  if (QUICWhitelistedDomain == [v4 QUICWhitelistedDomain])
  {
    unsigned int redirectCount = self->_redirectCount;
    if (redirectCount == [v4 redirectCount])
    {
      unsigned int redirectCountW3C = self->_redirectCountW3C;
      if (redirectCountW3C == [v4 redirectCountW3C])
      {
        unsigned int requestHeaderSize = self->_requestHeaderSize;
        if (requestHeaderSize == [v4 requestHeaderSize])
        {
          unsigned int responseBodyBytesDecoded = self->_responseBodyBytesDecoded;
          if (responseBodyBytesDecoded == [v4 responseBodyBytesDecoded])
          {
            unsigned int responseBodyBytesReceived = self->_responseBodyBytesReceived;
            if (responseBodyBytesReceived == [v4 responseBodyBytesReceived])
            {
              unsigned int responseHeaderSize = self->_responseHeaderSize;
              if (responseHeaderSize == [v4 responseHeaderSize])
              {
                int TFOSuccess = self->_TFOSuccess;
                if (TFOSuccess == [v4 TFOSuccess])
                {
                  double timingDataInit = self->_timingDataInit;
                  [v4 timingDataInit];
                  if (timingDataInit == v50)
                  {
                    unsigned int connectStart = self->_connectStart;
                    if (connectStart == [v4 connectStart])
                    {
                      unsigned int connectEnd = self->_connectEnd;
                      if (connectEnd == [v4 connectEnd])
                      {
                        unsigned int domainLookupStart = self->_domainLookupStart;
                        if (domainLookupStart == [v4 domainLookupStart])
                        {
                          unsigned int domainLookupEnd = self->_domainLookupEnd;
                          if (domainLookupEnd == [v4 domainLookupEnd])
                          {
                            unsigned int fetchStart = self->_fetchStart;
                            if (fetchStart == [v4 fetchStart])
                            {
                              unsigned int redirectStart = self->_redirectStart;
                              if (redirectStart == [v4 redirectStart])
                              {
                                unsigned int redirectEnd = self->_redirectEnd;
                                if (redirectEnd == [v4 redirectEnd])
                                {
                                  unsigned int requestStart = self->_requestStart;
                                  if (requestStart == [v4 requestStart])
                                  {
                                    unsigned int requestEnd = self->_requestEnd;
                                    if (requestEnd == [v4 requestEnd])
                                    {
                                      unsigned int responseStart = self->_responseStart;
                                      if (responseStart == [v4 responseStart])
                                      {
                                        unsigned int responseEnd = self->_responseEnd;
                                        if (responseEnd == [v4 responseEnd])
                                        {
                                          unsigned int secureConnectStart = self->_secureConnectStart;
                                          BOOL v39 = secureConnectStart == [v4 secureConnectStart];
                                          goto LABEL_35;
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
LABEL_34:
  BOOL v39 = 0;
LABEL_35:

  return v39;
}

- (void)writeTo:(id)a3
{
  a3;
  id v4 = [(_CPNetworkTimingData *)self interfaceIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(_CPNetworkTimingData *)self peerAddress];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  if ([(_CPNetworkTimingData *)self connectionRace]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPNetworkTimingData *)self connectionReused]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v6 = [(_CPNetworkTimingData *)self startTimeCounts];

  if (v6)
  {
    uint64_t v7 = [(_CPNetworkTimingData *)self startTimeCounts];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v8 = [(_CPNetworkTimingData *)self stopTimeCounts];

  if (v8)
  {
    NSUInteger v9 = [(_CPNetworkTimingData *)self stopTimeCounts];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_CPNetworkTimingData *)self connectionUUID];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_CPNetworkTimingData *)self networkProtocolName];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPNetworkTimingData *)self QUICWhitelistedDomain]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPNetworkTimingData *)self redirectCount]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self redirectCountW3C]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self requestHeaderSize]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self responseBodyBytesDecoded]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self responseBodyBytesReceived]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self responseHeaderSize]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self TFOSuccess]) {
    PBDataWriterWriteBOOLField();
  }
  [(_CPNetworkTimingData *)self timingDataInit];
  if (v12 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_CPNetworkTimingData *)self connectStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self connectEnd]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self domainLookupStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self domainLookupEnd]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self fetchStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self redirectStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self redirectEnd]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self requestStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self requestEnd]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self responseStart]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self responseEnd]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPNetworkTimingData *)self secureConnectStart]) {
    PBDataWriterWriteUint32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPNetworkTimingDataReadFrom(self, (uint64_t)a3);
}

- (_CPNetworkTimingData)initWithTelemetryDictionary:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_CPNetworkTimingData *)self init];
  if (v5)
  {
    unint64_t v6 = [(id)objc_opt_class() startMetricsForNormalization];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v82 objects:v89 count:16];
    v76 = v5;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v83;
      double v10 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v83 != v9) {
            objc_enumerationMutation(v6);
          }
          double v12 = objc_msgSend(v4, "parsec_numberForKey:", *(void *)(*((void *)&v82 + 1) + 8 * i));
          [v12 doubleValue];
          double v14 = v13;

          if (v14 < v10 && v14 != 0.0) {
            double v10 = v14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v82 objects:v89 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 1.79769313e308;
    }
    id v74 = v4;
    v75 = v6;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v78 objects:v88 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = @"timing_data_key_unknown";
      v20 = @"_kCFNTimingDataConnectionReused";
      uint64_t v21 = *(void *)v79;
      uint64_t v77 = *(void *)v79;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v79 != v21) {
            objc_enumerationMutation(v16);
          }
          id v23 = *(id *)(*((void *)&v78 + 1) + 8 * v22);
          if (![v23 compare:v19 options:3])
          {
LABEL_70:

            goto LABEL_152;
          }
          if ([v23 compare:v20 options:3])
          {
            if ([v23 compare:@"_kCFNTimingDataConnectionPeerAddress" options:3])
            {
              int v24 = 3;
              if ([v23 compare:@"_kCFNTimingDataConnectionInterfaceIdentifier" options:3])
              {
                if ([v23 compare:@"omit" options:3])
                {
                  if ([v23 compare:@"_kCFNTimingDataConnectionStartTimeCounts" options:3])
                  {
                    if ([v23 compare:@"_kCFNTimingDataConnectionStopTimeCounts" options:3])
                    {
                      if (![v23 compare:@"_kCFNTimingDataNStatRXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatRXBytes" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatTXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatTXBytes" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatRXDuplicateBytes" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatRXOutOfOrderBytes" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatTXRetransmit" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatConnectAttempts" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatConnectSuccesses" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatMinRTT" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatAvgRTT" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatVarRTT" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatCellRXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatCellTXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatWifiRXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatWifiTXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatWiredRXPackets" options:3]
                        || ![v23 compare:@"_kCFNTimingDataNStatWiredTXPackets" options:3])
                      {
                        goto LABEL_70;
                      }
                      if ([v23 compare:@"_kCFNTimingDataTCPFastOpenStats" options:3])
                      {
                        if (![v23 compare:@"_kCFNTimingDataTCPInfoAtStart" options:3]
                          || ![v23 compare:@"_kCFNTimingDataTCPInfoAtStop" options:3]
                          || ![v23 compare:@"omit" options:3]
                          || ![v23 compare:@"_kCFNTimingDataRemoteAddressAndPort" options:3])
                        {
                          goto LABEL_70;
                        }
                        if ([v23 compare:@"_kCFNTimingDataNetworkProtocolName" options:3])
                        {
                          if ([v23 compare:@"_kCFNTimingDataConnectionRace" options:3])
                          {
                            if ([v23 compare:@"_kCFNTimingDataQUICWhitelistedDomain" options:3])
                            {
                              if ([v23 compare:@"_kCFNTimingDataRequestHeaderSize" options:3])
                              {
                                if ([v23 compare:@"_kCFNTimingDataResponseHeaderSize" options:3])
                                {
                                  if ([v23 compare:@"_kCFNTimingDataResponseBodyBytesReceived" options:3])
                                  {
                                    if ([v23 compare:@"_kCFNTimingDataResponseBodyBytesDecoded" options:3])
                                    {
                                      if ([v23 compare:@"_kCFNTimingDataFetchStart" options:3])
                                      {
                                        if ([v23 compare:@"_kCFNTimingDataDomainLookupStart" options:3])
                                        {
                                          if ([v23 compare:@"_kCFNTimingDataDomainLookupEnd" options:3])
                                          {
                                            if ([v23 compare:@"_kCFNTimingDataConnectStart" options:3])
                                            {
                                              if ([v23 compare:@"_kCFNTimingDataSecureConnectionStart" options:3])
                                              {
                                                if ([v23 compare:@"_kCFNTimingDataConnectEnd" options:3])
                                                {
                                                  if ([v23 compare:@"_kCFNTimingDataRequestStart" options:3])
                                                  {
                                                    if ([v23 compare:@"_kCFNTimingDataRequestEnd" options:3])
                                                    {
                                                      if ([v23 compare:@"_kCFNTimingDataResponseStart" options:3])
                                                      {
                                                        if ([v23 compare:@"_kCFNTimingDataResponseEnd" options:3])
                                                        {
                                                          if ([v23 compare:@"_kCFNTimingDataRedirectStart" options:3])
                                                          {
                                                            if ([v23 compare:@"_kCFNTimingDataRedirectEnd" options:3])
                                                            {
                                                              goto LABEL_70;
                                                            }
                                                            int v24 = 48;
                                                          }
                                                          else
                                                          {
                                                            int v24 = 47;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          int v24 = 46;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v24 = 45;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      int v24 = 44;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v24 = 43;
                                                  }
                                                }
                                                else
                                                {
                                                  int v24 = 42;
                                                }
                                              }
                                              else
                                              {
                                                int v24 = 41;
                                              }
                                            }
                                            else
                                            {
                                              int v24 = 40;
                                            }
                                          }
                                          else
                                          {
                                            int v24 = 39;
                                          }
                                        }
                                        else
                                        {
                                          int v24 = 38;
                                        }
                                      }
                                      else
                                      {
                                        int v24 = 37;
                                      }
                                    }
                                    else
                                    {
                                      int v24 = 36;
                                    }
                                  }
                                  else
                                  {
                                    int v24 = 35;
                                  }
                                }
                                else
                                {
                                  int v24 = 34;
                                }
                              }
                              else
                              {
                                int v24 = 33;
                              }
                            }
                            else
                            {
                              int v24 = 32;
                            }
                          }
                          else
                          {
                            int v24 = 31;
                          }
                        }
                        else
                        {
                          int v24 = 30;
                        }
                      }
                      else
                      {
                        int v24 = 25;
                      }
                    }
                    else
                    {
                      int v24 = 6;
                    }
                  }
                  else
                  {
                    int v24 = 5;
                  }
                }
                else
                {
                  int v24 = 4;
                }
              }
            }
            else
            {
              int v24 = 2;
            }
          }
          else
          {
            int v24 = 1;
          }

          self;
          if ((id)objc_claimAutoreleasedReturnValue())
          {
            v25 = [v16 objectForKey:v23];
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v27 = v20;
              int v28 = v19;
              uint64_t v29 = objc_msgSend(v16, "parsec_numberForKey:", v23);
              v30 = objc_msgSend(v16, "parsec_dictionaryForKey:", v23);
              v31 = objc_msgSend(v16, "parsec_stringForKey:", v23);
              v32 = objc_msgSend(v16, "parsec_dataForKey:", v23);
              switch(v24)
              {
                case 1:
                  -[_CPNetworkTimingData setConnectionReused:](v76, "setConnectionReused:", [v29 BOOLValue]);
                  break;
                case 2:
                  [(_CPNetworkTimingData *)v76 setPeerAddress:v32];
                  break;
                case 3:
                  [(_CPNetworkTimingData *)v76 setInterfaceIdentifier:v31];
                  break;
                case 4:
                  [(_CPNetworkTimingData *)v76 setConnectionUUID:v31];
                  break;
                case 5:
                  if (v30)
                  {
                    v46 = [[_CPTCPInfo alloc] initWithTelemetryDictionary:v30];
                    [(_CPNetworkTimingData *)v76 setStartTimeCounts:v46];
                    goto LABEL_122;
                  }
                  break;
                case 6:
                  if (v30)
                  {
                    v46 = [[_CPTCPInfo alloc] initWithTelemetryDictionary:v30];
                    [(_CPNetworkTimingData *)v76 setStopTimeCounts:v46];
                    goto LABEL_122;
                  }
                  break;
                case 25:
                  if (v30)
                  {
                    objc_msgSend(v30, "parsec_numberForKey:", @"TFOSuccess");
                    v46 = (_CPTCPInfo *)objc_claimAutoreleasedReturnValue();
                    [(_CPNetworkTimingData *)v76 setTFOSuccess:[(_CPTCPInfo *)v46 BOOLValue]];
LABEL_122:
                  }
                  break;
                case 30:
                  if ([v31 length]) {
                    [(_CPNetworkTimingData *)v76 setNetworkProtocolName:v31];
                  }
                  break;
                case 31:
                  -[_CPNetworkTimingData setConnectionRace:](v76, "setConnectionRace:", [v29 BOOLValue]);
                  break;
                case 32:
                  -[_CPNetworkTimingData setQUICWhitelistedDomain:](v76, "setQUICWhitelistedDomain:", [v29 BOOLValue]);
                  break;
                case 33:
                  -[_CPNetworkTimingData setRequestHeaderSize:](v76, "setRequestHeaderSize:", [v29 unsignedIntegerValue]);
                  break;
                case 34:
                  -[_CPNetworkTimingData setResponseHeaderSize:](v76, "setResponseHeaderSize:", [v29 unsignedIntegerValue]);
                  break;
                case 35:
                  -[_CPNetworkTimingData setResponseBodyBytesReceived:](v76, "setResponseBodyBytesReceived:", [v29 unsignedIntegerValue]);
                  break;
                case 36:
                  -[_CPNetworkTimingData setResponseBodyBytesDecoded:](v76, "setResponseBodyBytesDecoded:", [v29 unsignedIntegerValue]);
                  break;
                case 37:
                  [v29 doubleValue];
                  unsigned int v57 = vcvtad_u64_f64((v56 - v10) * 1000.0);
                  if (v56 <= v10) {
                    uint64_t v58 = 0;
                  }
                  else {
                    uint64_t v58 = v57;
                  }
                  -[_CPNetworkTimingData setFetchStart:](v76, "setFetchStart:", v58, v74);
                  break;
                case 38:
                  [v29 doubleValue];
                  unsigned int v60 = vcvtad_u64_f64((v59 - v10) * 1000.0);
                  if (v59 <= v10) {
                    uint64_t v61 = 0;
                  }
                  else {
                    uint64_t v61 = v60;
                  }
                  -[_CPNetworkTimingData setDomainLookupStart:](v76, "setDomainLookupStart:", v61, v74);
                  break;
                case 39:
                  [v29 doubleValue];
                  unsigned int v63 = vcvtad_u64_f64((v62 - v10) * 1000.0);
                  if (v62 <= v10) {
                    uint64_t v64 = 0;
                  }
                  else {
                    uint64_t v64 = v63;
                  }
                  -[_CPNetworkTimingData setDomainLookupEnd:](v76, "setDomainLookupEnd:", v64, v74);
                  break;
                case 40:
                  [v29 doubleValue];
                  unsigned int v66 = vcvtad_u64_f64((v65 - v10) * 1000.0);
                  if (v65 <= v10) {
                    uint64_t v67 = 0;
                  }
                  else {
                    uint64_t v67 = v66;
                  }
                  -[_CPNetworkTimingData setConnectStart:](v76, "setConnectStart:", v67, v74);
                  break;
                case 41:
                  [v29 doubleValue];
                  unsigned int v35 = vcvtad_u64_f64((v34 - v10) * 1000.0);
                  if (v34 <= v10) {
                    uint64_t v36 = 0;
                  }
                  else {
                    uint64_t v36 = v35;
                  }
                  -[_CPNetworkTimingData setSecureConnectStart:](v76, "setSecureConnectStart:", v36, v74);
                  break;
                case 42:
                  [v29 doubleValue];
                  unsigned int v48 = vcvtad_u64_f64((v47 - v10) * 1000.0);
                  if (v47 <= v10) {
                    uint64_t v49 = 0;
                  }
                  else {
                    uint64_t v49 = v48;
                  }
                  -[_CPNetworkTimingData setConnectEnd:](v76, "setConnectEnd:", v49, v74);
                  break;
                case 43:
                  [v29 doubleValue];
                  unsigned int v69 = vcvtad_u64_f64((v68 - v10) * 1000.0);
                  if (v68 <= v10) {
                    uint64_t v70 = 0;
                  }
                  else {
                    uint64_t v70 = v69;
                  }
                  -[_CPNetworkTimingData setRequestStart:](v76, "setRequestStart:", v70, v74, v75);
                  break;
                case 44:
                  [v29 doubleValue];
                  unsigned int v38 = vcvtad_u64_f64((v37 - v10) * 1000.0);
                  if (v37 <= v10) {
                    uint64_t v39 = 0;
                  }
                  else {
                    uint64_t v39 = v38;
                  }
                  -[_CPNetworkTimingData setRequestEnd:](v76, "setRequestEnd:", v39, v74);
                  break;
                case 45:
                  [v29 doubleValue];
                  unsigned int v51 = vcvtad_u64_f64((v50 - v10) * 1000.0);
                  if (v50 <= v10) {
                    uint64_t v52 = 0;
                  }
                  else {
                    uint64_t v52 = v51;
                  }
                  -[_CPNetworkTimingData setResponseStart:](v76, "setResponseStart:", v52, v74);
                  break;
                case 46:
                  [v29 doubleValue];
                  unsigned int v44 = vcvtad_u64_f64((v43 - v10) * 1000.0);
                  if (v43 <= v10) {
                    uint64_t v45 = 0;
                  }
                  else {
                    uint64_t v45 = v44;
                  }
                  -[_CPNetworkTimingData setResponseEnd:](v76, "setResponseEnd:", v45, v74);
                  break;
                case 47:
                  [v29 doubleValue];
                  unsigned int v54 = vcvtad_u64_f64((v53 - v10) * 1000.0);
                  if (v53 <= v10) {
                    uint64_t v55 = 0;
                  }
                  else {
                    uint64_t v55 = v54;
                  }
                  -[_CPNetworkTimingData setRedirectStart:](v76, "setRedirectStart:", v55, v74);
                  break;
                case 48:
                  [v29 doubleValue];
                  unsigned int v41 = vcvtad_u64_f64((v40 - v10) * 1000.0);
                  if (v40 <= v10) {
                    uint64_t v42 = 0;
                  }
                  else {
                    uint64_t v42 = v41;
                  }
                  -[_CPNetworkTimingData setRedirectEnd:](v76, "setRedirectEnd:", v42, v74);
                  break;
                default:
                  break;
              }

              uint64_t v19 = v28;
              v20 = v27;
              uint64_t v21 = v77;
            }
            else
            {
              if (PARLogHandleForCategory_onceToken_1481 != -1) {
                dispatch_once(&PARLogHandleForCategory_onceToken_1481, &__block_literal_global_155);
              }
              int v33 = PARLogHandleForCategory_logHandles_2_1482;
              if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2_1482, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v87 = v23;
                _os_log_error_impl(&dword_19C7E7000, v33, OS_LOG_TYPE_ERROR, "Got data of unexpected type for metric %@.", buf, 0xCu);
              }
            }
          }
LABEL_152:
          ++v22;
        }
        while (v18 != v22);
        uint64_t v71 = [v16 countByEnumeratingWithState:&v78 objects:v88 count:16];
        uint64_t v18 = v71;
      }
      while (v71);
    }

    uint64_t v5 = v76;
    v72 = v76;

    id v4 = v74;
  }

  return v5;
}

+ (id)startMetricsForNormalization
{
  if (startMetricsForNormalization_onceToken != -1) {
    dispatch_once(&startMetricsForNormalization_onceToken, &__block_literal_global_1496);
  }
  v2 = (void *)startMetricsForNormalization_startMetricNames;

  return v2;
}

@end