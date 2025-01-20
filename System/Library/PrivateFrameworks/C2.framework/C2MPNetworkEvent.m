@interface C2MPNetworkEvent
+ (Class)networkPathInfoType;
- (BOOL)hasNetworkConnectionReused;
- (BOOL)hasNetworkConnectionUuid;
- (BOOL)hasNetworkFatalError;
- (BOOL)hasNetworkHostname;
- (BOOL)hasNetworkInterfaceIdentifier;
- (BOOL)hasNetworkIsDiscretionary;
- (BOOL)hasNetworkNegotiatedTlsProtocolVersion;
- (BOOL)hasNetworkPreviousAttemptCount;
- (BOOL)hasNetworkProtocolName;
- (BOOL)hasNetworkRemoteAddresssAndPort;
- (BOOL)hasNetworkRequestBodyBytesSent;
- (BOOL)hasNetworkRequestHeaderSize;
- (BOOL)hasNetworkRequestUri;
- (BOOL)hasNetworkResponseBodyBytesReceived;
- (BOOL)hasNetworkResponseHeaderSize;
- (BOOL)hasNetworkStatusCode;
- (BOOL)hasNetworkTaskDescription;
- (BOOL)hasOptionsAllowCellularAccess;
- (BOOL)hasOptionsAllowExpensiveAccess;
- (BOOL)hasOptionsAllowPowerNapScheduling;
- (BOOL)hasOptionsAppleIdContext;
- (BOOL)hasOptionsDiscretionaryNetworkBehavior;
- (BOOL)hasOptionsDuetPreClearedMode;
- (BOOL)hasOptionsOutOfProcess;
- (BOOL)hasOptionsOutOfProcessForceDiscretionary;
- (BOOL)hasOptionsQualityOfService;
- (BOOL)hasOptionsSourceApplicationBundleIdentifier;
- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier;
- (BOOL)hasOptionsTimeoutIntervalForRequest;
- (BOOL)hasOptionsTimeoutIntervalForResource;
- (BOOL)hasOptionsTlsPinningRequired;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasTimestampC2Init;
- (BOOL)hasTimestampC2Now;
- (BOOL)hasTimestampC2Start;
- (BOOL)hasTimestampDnsEnd;
- (BOOL)hasTimestampDnsStart;
- (BOOL)hasTimestampRequestEnd;
- (BOOL)hasTimestampRequestStart;
- (BOOL)hasTimestampResponseEnd;
- (BOOL)hasTimestampResponseStart;
- (BOOL)hasTimestampSslStart;
- (BOOL)hasTimestampTcpEnd;
- (BOOL)hasTimestampTcpStart;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkConnectionReused;
- (BOOL)networkIsDiscretionary;
- (BOOL)optionsAllowCellularAccess;
- (BOOL)optionsAllowExpensiveAccess;
- (BOOL)optionsAllowPowerNapScheduling;
- (BOOL)optionsAppleIdContext;
- (BOOL)optionsOutOfProcess;
- (BOOL)optionsOutOfProcessForceDiscretionary;
- (BOOL)optionsTlsPinningRequired;
- (BOOL)readFrom:(id)a3;
- (C2MPError)networkFatalError;
- (NSMutableArray)networkPathInfos;
- (NSString)networkConnectionUuid;
- (NSString)networkHostname;
- (NSString)networkInterfaceIdentifier;
- (NSString)networkNegotiatedTlsProtocolVersion;
- (NSString)networkProtocolName;
- (NSString)networkRemoteAddresssAndPort;
- (NSString)networkRequestUri;
- (NSString)networkTaskDescription;
- (NSString)optionsDiscretionaryNetworkBehavior;
- (NSString)optionsDuetPreClearedMode;
- (NSString)optionsQualityOfService;
- (NSString)optionsSourceApplicationBundleIdentifier;
- (NSString)optionsSourceApplicationSecondaryIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkPathInfoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)networkPathInfosCount;
- (unint64_t)networkRequestBodyBytesSent;
- (unint64_t)networkResponseBodyBytesReceived;
- (unint64_t)networkStatusCode;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)timestampC2Init;
- (unint64_t)timestampC2Now;
- (unint64_t)timestampC2Start;
- (unint64_t)timestampDnsEnd;
- (unint64_t)timestampDnsStart;
- (unint64_t)timestampRequestEnd;
- (unint64_t)timestampRequestStart;
- (unint64_t)timestampResponseEnd;
- (unint64_t)timestampResponseStart;
- (unint64_t)timestampSslStart;
- (unint64_t)timestampTcpEnd;
- (unint64_t)timestampTcpStart;
- (unint64_t)triggers;
- (unsigned)networkPreviousAttemptCount;
- (unsigned)networkRequestHeaderSize;
- (unsigned)networkResponseHeaderSize;
- (unsigned)optionsTimeoutIntervalForRequest;
- (unsigned)optionsTimeoutIntervalForResource;
- (void)addNetworkPathInfo:(id)a3;
- (void)clearNetworkPathInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNetworkConnectionReused:(BOOL)a3;
- (void)setHasNetworkIsDiscretionary:(BOOL)a3;
- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3;
- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3;
- (void)setHasNetworkRequestHeaderSize:(BOOL)a3;
- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3;
- (void)setHasNetworkResponseHeaderSize:(BOOL)a3;
- (void)setHasNetworkStatusCode:(BOOL)a3;
- (void)setHasOptionsAllowCellularAccess:(BOOL)a3;
- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setHasOptionsAppleIdContext:(BOOL)a3;
- (void)setHasOptionsOutOfProcess:(BOOL)a3;
- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3;
- (void)setHasOptionsTlsPinningRequired:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasTimestampC2Init:(BOOL)a3;
- (void)setHasTimestampC2Now:(BOOL)a3;
- (void)setHasTimestampC2Start:(BOOL)a3;
- (void)setHasTimestampDnsEnd:(BOOL)a3;
- (void)setHasTimestampDnsStart:(BOOL)a3;
- (void)setHasTimestampRequestEnd:(BOOL)a3;
- (void)setHasTimestampRequestStart:(BOOL)a3;
- (void)setHasTimestampResponseEnd:(BOOL)a3;
- (void)setHasTimestampResponseStart:(BOOL)a3;
- (void)setHasTimestampSslStart:(BOOL)a3;
- (void)setHasTimestampTcpEnd:(BOOL)a3;
- (void)setHasTimestampTcpStart:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setNetworkConnectionReused:(BOOL)a3;
- (void)setNetworkConnectionUuid:(id)a3;
- (void)setNetworkFatalError:(id)a3;
- (void)setNetworkHostname:(id)a3;
- (void)setNetworkInterfaceIdentifier:(id)a3;
- (void)setNetworkIsDiscretionary:(BOOL)a3;
- (void)setNetworkNegotiatedTlsProtocolVersion:(id)a3;
- (void)setNetworkPathInfos:(id)a3;
- (void)setNetworkPreviousAttemptCount:(unsigned int)a3;
- (void)setNetworkProtocolName:(id)a3;
- (void)setNetworkRemoteAddresssAndPort:(id)a3;
- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3;
- (void)setNetworkRequestHeaderSize:(unsigned int)a3;
- (void)setNetworkRequestUri:(id)a3;
- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3;
- (void)setNetworkResponseHeaderSize:(unsigned int)a3;
- (void)setNetworkStatusCode:(unint64_t)a3;
- (void)setNetworkTaskDescription:(id)a3;
- (void)setOptionsAllowCellularAccess:(BOOL)a3;
- (void)setOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setOptionsAppleIdContext:(BOOL)a3;
- (void)setOptionsDiscretionaryNetworkBehavior:(id)a3;
- (void)setOptionsDuetPreClearedMode:(id)a3;
- (void)setOptionsOutOfProcess:(BOOL)a3;
- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setOptionsQualityOfService:(id)a3;
- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3;
- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3;
- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3;
- (void)setOptionsTlsPinningRequired:(BOOL)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setTimestampC2Init:(unint64_t)a3;
- (void)setTimestampC2Now:(unint64_t)a3;
- (void)setTimestampC2Start:(unint64_t)a3;
- (void)setTimestampDnsEnd:(unint64_t)a3;
- (void)setTimestampDnsStart:(unint64_t)a3;
- (void)setTimestampRequestEnd:(unint64_t)a3;
- (void)setTimestampRequestStart:(unint64_t)a3;
- (void)setTimestampResponseEnd:(unint64_t)a3;
- (void)setTimestampResponseStart:(unint64_t)a3;
- (void)setTimestampSslStart:(unint64_t)a3;
- (void)setTimestampTcpEnd:(unint64_t)a3;
- (void)setTimestampTcpStart:(unint64_t)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPNetworkEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsQualityOfService, 0);
  objc_storeStrong((id *)&self->_optionsDuetPreClearedMode, 0);
  objc_storeStrong((id *)&self->_optionsDiscretionaryNetworkBehavior, 0);
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_networkRequestUri, 0);
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_networkPathInfos, 0);
  objc_storeStrong((id *)&self->_networkNegotiatedTlsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkHostname, 0);
  objc_storeStrong((id *)&self->_networkFatalError, 0);
  objc_storeStrong((id *)&self->_networkConnectionUuid, 0);
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v43 = [NSNumber numberWithUnsignedLongLong:self->_triggers];
    [v3 setObject:v43 forKey:@"triggers"];

    $C893DAD969560203051D3A1C34B78D80 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v44 = [NSNumber numberWithUnsignedLongLong:self->_reportFrequency];
  [v3 setObject:v44 forKey:@"report_frequency"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_reportFrequencyBase];
    [v3 setObject:v5 forKey:@"report_frequency_base"];
  }
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription) {
    [v3 setObject:networkTaskDescription forKey:@"network_task_description"];
  }
  networkHostname = self->_networkHostname;
  if (networkHostname) {
    [v3 setObject:networkHostname forKey:@"network_hostname"];
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort) {
    [v3 setObject:networkRemoteAddresssAndPort forKey:@"network_remote_addresss_and_port"];
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid) {
    [v3 setObject:networkConnectionUuid forKey:@"network_connection_uuid"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_networkConnectionReused];
    [v3 setObject:v10 forKey:@"network_connection_reused"];
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier) {
    [v3 setObject:networkInterfaceIdentifier forKey:@"network_interface_identifier"];
  }
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName) {
    [v3 setObject:networkProtocolName forKey:@"network_protocol_name"];
  }
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    v45 = [NSNumber numberWithUnsignedInt:self->_networkRequestHeaderSize];
    [v3 setObject:v45 forKey:@"network_request_header_size"];

    $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v13 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_86;
    }
  }
  else if ((*(unsigned char *)&v13 & 1) == 0)
  {
    goto LABEL_21;
  }
  v46 = [NSNumber numberWithUnsignedLongLong:self->_networkRequestBodyBytesSent];
  [v3 setObject:v46 forKey:@"network_request_body_bytes_sent"];

  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_87;
  }
LABEL_86:
  v47 = [NSNumber numberWithUnsignedInt:self->_networkResponseHeaderSize];
  [v3 setObject:v47 forKey:@"network_response_header_size"];

  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_87:
  v48 = [NSNumber numberWithUnsignedLongLong:self->_networkResponseBodyBytesReceived];
  [v3 setObject:v48 forKey:@"network_response_body_bytes_received"];

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    v14 = [NSNumber numberWithUnsignedInt:self->_networkPreviousAttemptCount];
    [v3 setObject:v14 forKey:@"network_previous_attempt_count"];
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  if (networkFatalError)
  {
    v16 = [(C2MPError *)networkFatalError dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"network_fatal_error"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v17 = [NSNumber numberWithUnsignedLongLong:self->_networkStatusCode];
    [v3 setObject:v17 forKey:@"network_status_code"];
  }
  networkRequestUruint64_t i = self->_networkRequestUri;
  if (networkRequestUri) {
    [v3 setObject:networkRequestUri forKey:@"network_request_uri"];
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v19 = [NSNumber numberWithBool:self->_networkIsDiscretionary];
    [v3 setObject:v19 forKey:@"network_is_discretionary"];
  }
  networkNegotiatedTlsProtocolVersion = self->_networkNegotiatedTlsProtocolVersion;
  if (networkNegotiatedTlsProtocolVersion) {
    [v3 setObject:networkNegotiatedTlsProtocolVersion forKey:@"network_negotiated_tls_protocol_version"];
  }
  if ([(NSMutableArray *)self->_networkPathInfos count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_networkPathInfos, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v22 = self->_networkPathInfos;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "dictionaryRepresentation", (void)v65);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"network_path_info"];
  }
  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x20) != 0)
  {
    v49 = [NSNumber numberWithUnsignedLongLong:self->_timestampC2Init];
    [v3 setObject:v49 forKey:@"timestamp_c2_init"];

    $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
    if ((*(unsigned char *)&v28 & 0x80) == 0)
    {
LABEL_46:
      if ((*(unsigned char *)&v28 & 0x40) == 0) {
        goto LABEL_47;
      }
      goto LABEL_91;
    }
  }
  else if ((*(unsigned char *)&v28 & 0x80) == 0)
  {
    goto LABEL_46;
  }
  v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampC2Start, (void)v65);
  [v3 setObject:v50 forKey:@"timestamp_c2_start"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x40) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v28 & 0x200) == 0) {
      goto LABEL_48;
    }
    goto LABEL_92;
  }
LABEL_91:
  v51 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampC2Now, (void)v65);
  [v3 setObject:v51 forKey:@"timestamp_c2_now"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x200) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v28 & 0x100) == 0) {
      goto LABEL_49;
    }
    goto LABEL_93;
  }
LABEL_92:
  v52 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampDnsStart, (void)v65);
  [v3 setObject:v52 forKey:@"timestamp_dns_start"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x100) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v28 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_94;
  }
LABEL_93:
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampDnsEnd, (void)v65);
  [v3 setObject:v53 forKey:@"timestamp_dns_end"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v28 & 0x8000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_95;
  }
LABEL_94:
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampTcpStart, (void)v65);
  [v3 setObject:v54 forKey:@"timestamp_tcp_start"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x8000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v28 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_96;
  }
LABEL_95:
  v55 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampTcpEnd, (void)v65);
  [v3 setObject:v55 forKey:@"timestamp_tcp_end"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v28 & 0x800) == 0) {
      goto LABEL_53;
    }
    goto LABEL_97;
  }
LABEL_96:
  v56 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampSslStart, (void)v65);
  [v3 setObject:v56 forKey:@"timestamp_ssl_start"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x800) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v28 & 0x400) == 0) {
      goto LABEL_54;
    }
    goto LABEL_98;
  }
LABEL_97:
  v57 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampRequestStart, (void)v65);
  [v3 setObject:v57 forKey:@"timestamp_request_start"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x400) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v28 & 0x2000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_99;
  }
LABEL_98:
  v58 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampRequestEnd, (void)v65);
  [v3 setObject:v58 forKey:@"timestamp_request_end"];

  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v28 & 0x1000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_99:
  v59 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampResponseStart, (void)v65);
  [v3 setObject:v59 forKey:@"timestamp_response_start"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_56:
    v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestampResponseEnd, (void)v65);
    [v3 setObject:v29 forKey:@"timestamp_response_end"];
  }
LABEL_57:
  optionsQualityOfService = self->_optionsQualityOfService;
  if (optionsQualityOfService) {
    [v3 setObject:optionsQualityOfService forKey:@"options_quality_of_service"];
  }
  $C893DAD969560203051D3A1C34B78D80 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x20000000) != 0)
  {
    v60 = [NSNumber numberWithBool:self->_optionsOutOfProcess];
    [v3 setObject:v60 forKey:@"options_out_of_process"];

    $C893DAD969560203051D3A1C34B78D80 v31 = self->_has;
    if ((*(_DWORD *)&v31 & 0x40000000) == 0)
    {
LABEL_61:
      if ((*(_DWORD *)&v31 & 0x4000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_103;
    }
  }
  else if ((*(_DWORD *)&v31 & 0x40000000) == 0)
  {
    goto LABEL_61;
  }
  v61 = objc_msgSend(NSNumber, "numberWithBool:", self->_optionsOutOfProcessForceDiscretionary, (void)v65);
  [v3 setObject:v61 forKey:@"options_out_of_process_force_discretionary"];

  $C893DAD969560203051D3A1C34B78D80 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x4000000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v31 & 0x8000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_104;
  }
LABEL_103:
  v62 = objc_msgSend(NSNumber, "numberWithBool:", self->_optionsAllowExpensiveAccess, (void)v65);
  [v3 setObject:v62 forKey:@"options_allow_expensive_access"];

  $C893DAD969560203051D3A1C34B78D80 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x8000000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v31 & 0x200000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_105;
  }
LABEL_104:
  v63 = objc_msgSend(NSNumber, "numberWithBool:", self->_optionsAllowPowerNapScheduling, (void)v65);
  [v3 setObject:v63 forKey:@"options_allow_power_nap_scheduling"];

  $C893DAD969560203051D3A1C34B78D80 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x200000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v31 & 0x400000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_105:
  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForRequest, (void)v65);
  [v3 setObject:v64 forKey:@"options_timeout_interval_for_request"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_65:
    v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForResource, (void)v65);
    [v3 setObject:v32 forKey:@"options_timeout_interval_for_resource"];
  }
LABEL_66:
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if (optionsSourceApplicationBundleIdentifier) {
    [v3 setObject:optionsSourceApplicationBundleIdentifier forKey:@"options_source_application_bundle_identifier"];
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if (optionsSourceApplicationSecondaryIdentifier) {
    [v3 setObject:optionsSourceApplicationSecondaryIdentifier forKey:@"options_source_application_secondary_identifier"];
  }
  $C893DAD969560203051D3A1C34B78D80 v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x10000000) != 0)
  {
    v36 = [NSNumber numberWithBool:self->_optionsAppleIdContext];
    [v3 setObject:v36 forKey:@"options_apple_id_context"];

    $C893DAD969560203051D3A1C34B78D80 v35 = self->_has;
  }
  if ((*(_DWORD *)&v35 & 0x80000000) != 0)
  {
    v37 = [NSNumber numberWithBool:self->_optionsTlsPinningRequired];
    [v3 setObject:v37 forKey:@"options_tls_pinning_required"];
  }
  optionsDiscretionaryNetworkBehavior = self->_optionsDiscretionaryNetworkBehavior;
  if (optionsDiscretionaryNetworkBehavior) {
    [v3 setObject:optionsDiscretionaryNetworkBehavior forKey:@"options_discretionary_network_behavior"];
  }
  optionsDuetPreClearedMode = self->_optionsDuetPreClearedMode;
  if (optionsDuetPreClearedMode) {
    [v3 setObject:optionsDuetPreClearedMode forKey:@"options_duet_pre_cleared_mode"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    v40 = [NSNumber numberWithBool:self->_optionsAllowCellularAccess];
    [v3 setObject:v40 forKey:@"options_allow_cellular_access"];
  }
  id v41 = v3;

  return v41;
}

- (void)setNetworkConnectionUuid:(id)a3
{
}

- (void)setTriggers:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_triggers = a3;
}

- (void)setTimestampTcpStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timestampTcpStart = a3;
}

- (void)setTimestampTcpEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timestampTcpEnd = a3;
}

- (void)setTimestampSslStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timestampSslStart = a3;
}

- (void)setTimestampResponseStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timestampResponseStart = a3;
}

- (void)setTimestampResponseEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_timestampResponseEnd = a3;
}

- (void)setTimestampRequestStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timestampRequestStart = a3;
}

- (void)setTimestampRequestEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timestampRequestEnd = a3;
}

- (void)setTimestampDnsStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_timestampDnsStart = a3;
}

- (void)setTimestampDnsEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestampDnsEnd = a3;
}

- (void)setTimestampC2Start:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_timestampC2Start = a3;
}

- (void)setTimestampC2Now:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timestampC2Now = a3;
}

- (void)setTimestampC2Init:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestampC2Init = a3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_reportFrequency = a3;
}

- (void)setOptionsTlsPinningRequired:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_optionsTlsPinningRequired = a3;
}

- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_optionsTimeoutIntervalForResource = a3;
}

- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_optionsTimeoutIntervalForRequest = a3;
}

- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3
{
}

- (void)setOptionsQualityOfService:(id)a3
{
}

- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_optionsOutOfProcessForceDiscretionary = a3;
}

- (void)setOptionsOutOfProcess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_optionsOutOfProcess = a3;
}

- (void)setOptionsDuetPreClearedMode:(id)a3
{
}

- (void)setOptionsDiscretionaryNetworkBehavior:(id)a3
{
}

- (void)setOptionsAppleIdContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_optionsAppleIdContext = a3;
}

- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_optionsAllowPowerNapScheduling = a3;
}

- (void)setOptionsAllowExpensiveAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_optionsAllowExpensiveAccess = a3;
}

- (void)setOptionsAllowCellularAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_optionsAllowCellularAccess = a3;
}

- (void)setNetworkTaskDescription:(id)a3
{
}

- (void)setNetworkStatusCode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_networkStatusCode = a3;
}

- (void)setNetworkResponseHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_networkResponseHeaderSize = a3;
}

- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkResponseBodyBytesReceived = a3;
}

- (void)setNetworkRequestUri:(id)a3
{
}

- (void)setNetworkRequestHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_networkRequestHeaderSize = a3;
}

- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_networkRequestBodyBytesSent = a3;
}

- (void)setNetworkRemoteAddresssAndPort:(id)a3
{
}

- (void)setNetworkProtocolName:(id)a3
{
}

- (void)setNetworkPreviousAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkPreviousAttemptCount = a3;
}

- (void)setNetworkNegotiatedTlsProtocolVersion:(id)a3
{
}

- (void)setNetworkInterfaceIdentifier:(id)a3
{
}

- (void)setNetworkHostname:(id)a3
{
}

- (void)setNetworkConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_networkConnectionReused = a3;
}

- (void)addNetworkPathInfo:(id)a3
{
  id v4 = a3;
  networkPathInfos = self->_networkPathInfos;
  id v8 = v4;
  if (!networkPathInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_networkPathInfos;
    self->_networkPathInfos = v6;

    id v4 = v8;
    networkPathInfos = self->_networkPathInfos;
  }
  [(NSMutableArray *)networkPathInfos addObject:v4];
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTriggers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasReportFrequency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasReportFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasNetworkTaskDescription
{
  return self->_networkTaskDescription != 0;
}

- (BOOL)hasNetworkHostname
{
  return self->_networkHostname != 0;
}

- (BOOL)hasNetworkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort != 0;
}

- (BOOL)hasNetworkConnectionUuid
{
  return self->_networkConnectionUuid != 0;
}

- (void)setHasNetworkConnectionReused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasNetworkConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNetworkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier != 0;
}

- (BOOL)hasNetworkProtocolName
{
  return self->_networkProtocolName != 0;
}

- (void)setHasNetworkRequestHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasNetworkRequestHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3
{
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNetworkRequestBodyBytesSent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasNetworkResponseHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasNetworkResponseHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkResponseBodyBytesReceived
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetworkPreviousAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNetworkFatalError
{
  return self->_networkFatalError != 0;
}

- (void)setHasNetworkStatusCode:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNetworkStatusCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasNetworkRequestUri
{
  return self->_networkRequestUri != 0;
}

- (void)setNetworkIsDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_networkIsDiscretionary = a3;
}

- (void)setHasNetworkIsDiscretionary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasNetworkIsDiscretionary
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasNetworkNegotiatedTlsProtocolVersion
{
  return self->_networkNegotiatedTlsProtocolVersion != 0;
}

- (void)clearNetworkPathInfos
{
}

- (unint64_t)networkPathInfosCount
{
  return [(NSMutableArray *)self->_networkPathInfos count];
}

- (id)networkPathInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkPathInfos objectAtIndex:a3];
}

+ (Class)networkPathInfoType
{
  return (Class)objc_opt_class();
}

- (void)setHasTimestampC2Init:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTimestampC2Init
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTimestampC2Start:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestampC2Start
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasTimestampC2Now:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTimestampC2Now
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTimestampDnsStart:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTimestampDnsStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasTimestampDnsEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTimestampDnsEnd
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasTimestampTcpStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimestampTcpStart
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasTimestampTcpEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimestampTcpEnd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasTimestampSslStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimestampSslStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasTimestampRequestStart:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimestampRequestStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTimestampRequestEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimestampRequestEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTimestampResponseStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimestampResponseStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasTimestampResponseEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTimestampResponseEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasOptionsQualityOfService
{
  return self->_optionsQualityOfService != 0;
}

- (void)setHasOptionsOutOfProcess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcessForceDiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasOptionsAllowExpensiveAccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasOptionsAllowPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForResource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasOptionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier != 0;
}

- (void)setHasOptionsAppleIdContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOptionsAppleIdContext
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasOptionsTlsPinningRequired:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasOptionsTlsPinningRequired
{
  return *(_DWORD *)&self->_has >> 31;
}

- (BOOL)hasOptionsDiscretionaryNetworkBehavior
{
  return self->_optionsDiscretionaryNetworkBehavior != 0;
}

- (BOOL)hasOptionsDuetPreClearedMode
{
  return self->_optionsDuetPreClearedMode != 0;
}

- (void)setHasOptionsAllowCellularAccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C893DAD969560203051D3A1C34B78D80 has = ($C893DAD969560203051D3A1C34B78D80)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasOptionsAllowCellularAccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPNetworkEvent;
  id v4 = [(C2MPNetworkEvent *)&v8 description];
  v5 = [(C2MPNetworkEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPNetworkEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $C893DAD969560203051D3A1C34B78D80 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_networkTaskDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkHostname) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkRemoteAddresssAndPort) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkConnectionUuid) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_networkInterfaceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkProtocolName) {
    PBDataWriterWriteStringField();
  }
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_84;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_networkFatalError) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_networkRequestUri) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 3)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_networkNegotiatedTlsProtocolVersion) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_networkPathInfos;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 0x80) == 0)
    {
LABEL_44:
      if ((*(unsigned char *)&v12 & 0x40) == 0) {
        goto LABEL_45;
      }
      goto LABEL_89;
    }
  }
  else if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x40) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x200) == 0) {
      goto LABEL_46;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v12 & 0x100) == 0) {
      goto LABEL_47;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v12 & 0x10000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v12 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v12 & 0x800) == 0) {
      goto LABEL_51;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v12 & 0x400) == 0) {
      goto LABEL_52;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v12 & 0x2000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint64Field();
  $C893DAD969560203051D3A1C34B78D80 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v12 & 0x1000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_97:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_54:
  }
    PBDataWriterWriteUint64Field();
LABEL_55:
  if (self->_optionsQualityOfService) {
    PBDataWriterWriteStringField();
  }
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x40000000) == 0)
    {
LABEL_59:
      if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
        goto LABEL_60;
      }
      goto LABEL_101;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x40000000) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteBOOLField();
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v13 & 0x400000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
LABEL_63:
  }
    PBDataWriterWriteUint32Field();
LABEL_64:
  if (self->_optionsSourceApplicationBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier) {
    PBDataWriterWriteStringField();
  }
  $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_optionsDiscretionaryNetworkBehavior) {
    PBDataWriterWriteStringField();
  }
  if (self->_optionsDuetPreClearedMode) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[18] = self->_triggers;
    *((_DWORD *)v4 + 79) |= 0x20000u;
    $C893DAD969560203051D3A1C34B78D80 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_reportFrequency;
  *((_DWORD *)v4 + 79) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_reportFrequencyBase;
    *((_DWORD *)v4 + 79) |= 0x10u;
  }
LABEL_5:
  long long v15 = v4;
  if (self->_networkTaskDescription)
  {
    objc_msgSend(v4, "setNetworkTaskDescription:");
    id v4 = v15;
  }
  if (self->_networkHostname)
  {
    objc_msgSend(v15, "setNetworkHostname:");
    id v4 = v15;
  }
  if (self->_networkRemoteAddresssAndPort)
  {
    objc_msgSend(v15, "setNetworkRemoteAddresssAndPort:");
    id v4 = v15;
  }
  if (self->_networkConnectionUuid)
  {
    objc_msgSend(v15, "setNetworkConnectionUuid:");
    id v4 = v15;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 304) = self->_networkConnectionReused;
    *((_DWORD *)v4 + 79) |= 0x800000u;
  }
  if (self->_networkInterfaceIdentifier)
  {
    objc_msgSend(v15, "setNetworkInterfaceIdentifier:");
    id v4 = v15;
  }
  if (self->_networkProtocolName)
  {
    objc_msgSend(v15, "setNetworkProtocolName:");
    id v4 = v15;
  }
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 56) = self->_networkRequestHeaderSize;
    *((_DWORD *)v4 + 79) |= 0x80000u;
    $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_83;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  v4[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v4 + 79) |= 1u;
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 60) = self->_networkResponseHeaderSize;
  *((_DWORD *)v4 + 79) |= 0x100000u;
  $C893DAD969560203051D3A1C34B78D80 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_84:
  v4[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v4 + 79) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 50) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v4 + 79) |= 0x40000u;
  }
LABEL_25:
  if (self->_networkFatalError)
  {
    objc_msgSend(v15, "setNetworkFatalError:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = self->_networkStatusCode;
    *((_DWORD *)v4 + 79) |= 4u;
  }
  if (self->_networkRequestUri)
  {
    objc_msgSend(v15, "setNetworkRequestUri:");
    id v4 = v15;
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    *((unsigned char *)v4 + 305) = self->_networkIsDiscretionary;
    *((_DWORD *)v4 + 79) |= 0x1000000u;
  }
  if (self->_networkNegotiatedTlsProtocolVersion) {
    objc_msgSend(v15, "setNetworkNegotiatedTlsProtocolVersion:");
  }
  if ([(C2MPNetworkEvent *)self networkPathInfosCount])
  {
    [v15 clearNetworkPathInfos];
    unint64_t v7 = [(C2MPNetworkEvent *)self networkPathInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(C2MPNetworkEvent *)self networkPathInfoAtIndex:i];
        [v15 addNetworkPathInfo:v10];
      }
    }
  }
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    v15[6] = self->_timestampC2Init;
    *((_DWORD *)v15 + 79) |= 0x20u;
    $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&v11 & 0x40) == 0) {
        goto LABEL_42;
      }
      goto LABEL_88;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_41;
  }
  v15[8] = self->_timestampC2Start;
  *((_DWORD *)v15 + 79) |= 0x80u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v11 & 0x200) == 0) {
      goto LABEL_43;
    }
    goto LABEL_89;
  }
LABEL_88:
  v15[7] = self->_timestampC2Now;
  *((_DWORD *)v15 + 79) |= 0x40u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v11 & 0x100) == 0) {
      goto LABEL_44;
    }
    goto LABEL_90;
  }
LABEL_89:
  v15[10] = self->_timestampDnsStart;
  *((_DWORD *)v15 + 79) |= 0x200u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v11 & 0x10000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_91;
  }
LABEL_90:
  v15[9] = self->_timestampDnsEnd;
  *((_DWORD *)v15 + 79) |= 0x100u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v11 & 0x8000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_92;
  }
LABEL_91:
  v15[17] = self->_timestampTcpStart;
  *((_DWORD *)v15 + 79) |= 0x10000u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v11 & 0x4000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_93;
  }
LABEL_92:
  v15[16] = self->_timestampTcpEnd;
  *((_DWORD *)v15 + 79) |= 0x8000u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v11 & 0x800) == 0) {
      goto LABEL_48;
    }
    goto LABEL_94;
  }
LABEL_93:
  v15[15] = self->_timestampSslStart;
  *((_DWORD *)v15 + 79) |= 0x4000u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v11 & 0x400) == 0) {
      goto LABEL_49;
    }
    goto LABEL_95;
  }
LABEL_94:
  v15[12] = self->_timestampRequestStart;
  *((_DWORD *)v15 + 79) |= 0x800u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v11 & 0x2000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_96;
  }
LABEL_95:
  v15[11] = self->_timestampRequestEnd;
  *((_DWORD *)v15 + 79) |= 0x400u;
  $C893DAD969560203051D3A1C34B78D80 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_96:
  v15[14] = self->_timestampResponseStart;
  *((_DWORD *)v15 + 79) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_51:
    v15[13] = self->_timestampResponseEnd;
    *((_DWORD *)v15 + 79) |= 0x1000u;
  }
LABEL_52:
  if (self->_optionsQualityOfService)
  {
    objc_msgSend(v15, "setOptionsQualityOfService:");
    $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  }
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    v12[310] = self->_optionsOutOfProcess;
    *((_DWORD *)v12 + 79) |= 0x20000000u;
    $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x40000000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x40000000) == 0)
  {
    goto LABEL_56;
  }
  v12[311] = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v12 + 79) |= 0x40000000u;
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_101;
  }
LABEL_100:
  v12[307] = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v12 + 79) |= 0x4000000u;
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_102;
  }
LABEL_101:
  v12[308] = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v12 + 79) |= 0x8000000u;
  $C893DAD969560203051D3A1C34B78D80 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v13 & 0x400000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_102:
  *((_DWORD *)v12 + 74) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v12 + 79) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_60:
    *((_DWORD *)v12 + 75) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v12 + 79) |= 0x400000u;
  }
LABEL_61:
  if (self->_optionsSourceApplicationBundleIdentifier)
  {
    objc_msgSend(v15, "setOptionsSourceApplicationBundleIdentifier:");
    $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier)
  {
    objc_msgSend(v15, "setOptionsSourceApplicationSecondaryIdentifier:");
    $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  }
  $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    v12[309] = self->_optionsAppleIdContext;
    *((_DWORD *)v12 + 79) |= 0x10000000u;
    $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x80000000) != 0)
  {
    v12[312] = self->_optionsTlsPinningRequired;
    *((_DWORD *)v12 + 79) |= 0x80000000;
  }
  if (self->_optionsDiscretionaryNetworkBehavior)
  {
    objc_msgSend(v15, "setOptionsDiscretionaryNetworkBehavior:");
    $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  }
  if (self->_optionsDuetPreClearedMode)
  {
    objc_msgSend(v15, "setOptionsDuetPreClearedMode:");
    $C893DAD969560203051D3A1C34B78D80 v12 = v15;
  }
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    v12[306] = self->_optionsAllowCellularAccess;
    *((_DWORD *)v12 + 79) |= 0x2000000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    *(void *)(v5 + 144) = self->_triggers;
    *(_DWORD *)(v5 + 316) |= 0x20000u;
    $C893DAD969560203051D3A1C34B78D80 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 32) = self->_reportFrequency;
  *(_DWORD *)(v5 + 316) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(void *)(v5 + 40) = self->_reportFrequencyBase;
    *(_DWORD *)(v5 + 316) |= 0x10u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_networkTaskDescription copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v8;

  uint64_t v10 = [(NSString *)self->_networkHostname copyWithZone:a3];
  $C893DAD969560203051D3A1C34B78D80 v11 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v10;

  uint64_t v12 = [(NSString *)self->_networkRemoteAddresssAndPort copyWithZone:a3];
  $C893DAD969560203051D3A1C34B78D80 v13 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v12;

  uint64_t v14 = [(NSString *)self->_networkConnectionUuid copyWithZone:a3];
  long long v15 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v14;

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 304) = self->_networkConnectionReused;
    *(_DWORD *)(v6 + 316) |= 0x800000u;
  }
  uint64_t v16 = [(NSString *)self->_networkInterfaceIdentifier copyWithZone:a3];
  long long v17 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v16;

  uint64_t v18 = [(NSString *)self->_networkProtocolName copyWithZone:a3];
  v19 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v18;

  $C893DAD969560203051D3A1C34B78D80 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    *(_DWORD *)(v6 + 224) = self->_networkRequestHeaderSize;
    *(_DWORD *)(v6 + 316) |= 0x80000u;
    $C893DAD969560203051D3A1C34B78D80 v20 = self->_has;
    if ((*(unsigned char *)&v20 & 1) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v20 & 0x100000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v20 & 1) == 0)
  {
    goto LABEL_9;
  }
  *(void *)(v6 + 8) = self->_networkRequestBodyBytesSent;
  *(_DWORD *)(v6 + 316) |= 1u;
  $C893DAD969560203051D3A1C34B78D80 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v20 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 240) = self->_networkResponseHeaderSize;
  *(_DWORD *)(v6 + 316) |= 0x100000u;
  $C893DAD969560203051D3A1C34B78D80 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 2) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v20 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_57:
  *(void *)(v6 + 16) = self->_networkResponseBodyBytesReceived;
  *(_DWORD *)(v6 + 316) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 200) = self->_networkPreviousAttemptCount;
    *(_DWORD *)(v6 + 316) |= 0x40000u;
  }
LABEL_13:
  id v21 = [(C2MPError *)self->_networkFatalError copyWithZone:a3];
  v22 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v21;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_networkStatusCode;
    *(_DWORD *)(v6 + 316) |= 4u;
  }
  uint64_t v23 = [(NSString *)self->_networkRequestUri copyWithZone:a3];
  uint64_t v24 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v23;

  if (*((unsigned char *)&self->_has + 3))
  {
    *(unsigned char *)(v6 + 305) = self->_networkIsDiscretionary;
    *(_DWORD *)(v6 + 316) |= 0x1000000u;
  }
  uint64_t v25 = [(NSString *)self->_networkNegotiatedTlsProtocolVersion copyWithZone:a3];
  v26 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v25;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v27 = self->_networkPathInfos;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v31), "copyWithZone:", a3, (void)v48);
        [(id)v6 addNetworkPathInfo:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v29);
  }

  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(unsigned char *)&v33 & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_timestampC2Init;
    *(_DWORD *)(v6 + 316) |= 0x20u;
    $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
    if ((*(unsigned char *)&v33 & 0x80) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v33 & 0x40) == 0) {
        goto LABEL_27;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&v33 & 0x80) == 0)
  {
    goto LABEL_26;
  }
  *(void *)(v6 + 64) = self->_timestampC2Start;
  *(_DWORD *)(v6 + 316) |= 0x80u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(unsigned char *)&v33 & 0x40) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v33 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(void *)(v6 + 56) = self->_timestampC2Now;
  *(_DWORD *)(v6 + 316) |= 0x40u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v33 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(void *)(v6 + 80) = self->_timestampDnsStart;
  *(_DWORD *)(v6 + 316) |= 0x200u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v33 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(void *)(v6 + 72) = self->_timestampDnsEnd;
  *(_DWORD *)(v6 + 316) |= 0x100u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v33 & 0x8000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(void *)(v6 + 136) = self->_timestampTcpStart;
  *(_DWORD *)(v6 + 316) |= 0x10000u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v33 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(void *)(v6 + 128) = self->_timestampTcpEnd;
  *(_DWORD *)(v6 + 316) |= 0x8000u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v33 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(void *)(v6 + 120) = self->_timestampSslStart;
  *(_DWORD *)(v6 + 316) |= 0x4000u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x800) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v33 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(void *)(v6 + 96) = self->_timestampRequestStart;
  *(_DWORD *)(v6 + 316) |= 0x800u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v33 & 0x2000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(void *)(v6 + 88) = self->_timestampRequestEnd;
  *(_DWORD *)(v6 + 316) |= 0x400u;
  $C893DAD969560203051D3A1C34B78D80 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v33 & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_69:
  *(void *)(v6 + 112) = self->_timestampResponseStart;
  *(_DWORD *)(v6 + 316) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_36:
    *(void *)(v6 + 104) = self->_timestampResponseEnd;
    *(_DWORD *)(v6 + 316) |= 0x1000u;
  }
LABEL_37:
  uint64_t v34 = -[NSString copyWithZone:](self->_optionsQualityOfService, "copyWithZone:", a3, (void)v48);
  $C893DAD969560203051D3A1C34B78D80 v35 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v34;

  $C893DAD969560203051D3A1C34B78D80 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x20000000) != 0)
  {
    *(unsigned char *)(v6 + 310) = self->_optionsOutOfProcess;
    *(_DWORD *)(v6 + 316) |= 0x20000000u;
    $C893DAD969560203051D3A1C34B78D80 v36 = self->_has;
    if ((*(_DWORD *)&v36 & 0x40000000) == 0)
    {
LABEL_39:
      if ((*(_DWORD *)&v36 & 0x4000000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v36 & 0x40000000) == 0)
  {
    goto LABEL_39;
  }
  *(unsigned char *)(v6 + 311) = self->_optionsOutOfProcessForceDiscretionary;
  *(_DWORD *)(v6 + 316) |= 0x40000000u;
  $C893DAD969560203051D3A1C34B78D80 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x4000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v36 & 0x8000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(unsigned char *)(v6 + 307) = self->_optionsAllowExpensiveAccess;
  *(_DWORD *)(v6 + 316) |= 0x4000000u;
  $C893DAD969560203051D3A1C34B78D80 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x8000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v36 & 0x200000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(unsigned char *)(v6 + 308) = self->_optionsAllowPowerNapScheduling;
  *(_DWORD *)(v6 + 316) |= 0x8000000u;
  $C893DAD969560203051D3A1C34B78D80 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v36 & 0x400000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_75:
  *(_DWORD *)(v6 + 296) = self->_optionsTimeoutIntervalForRequest;
  *(_DWORD *)(v6 + 316) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_43:
    *(_DWORD *)(v6 + 300) = self->_optionsTimeoutIntervalForResource;
    *(_DWORD *)(v6 + 316) |= 0x400000u;
  }
LABEL_44:
  uint64_t v37 = [(NSString *)self->_optionsSourceApplicationBundleIdentifier copyWithZone:a3];
  v38 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v37;

  uint64_t v39 = [(NSString *)self->_optionsSourceApplicationSecondaryIdentifier copyWithZone:a3];
  v40 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v39;

  $C893DAD969560203051D3A1C34B78D80 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x10000000) != 0)
  {
    *(unsigned char *)(v6 + 309) = self->_optionsAppleIdContext;
    *(_DWORD *)(v6 + 316) |= 0x10000000u;
    $C893DAD969560203051D3A1C34B78D80 v41 = self->_has;
  }
  if ((*(_DWORD *)&v41 & 0x80000000) != 0)
  {
    *(unsigned char *)(v6 + 312) = self->_optionsTlsPinningRequired;
    *(_DWORD *)(v6 + 316) |= 0x80000000;
  }
  uint64_t v42 = [(NSString *)self->_optionsDiscretionaryNetworkBehavior copyWithZone:a3];
  v43 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v42;

  uint64_t v44 = [(NSString *)self->_optionsDuetPreClearedMode copyWithZone:a3];
  v45 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v44;

  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    *(unsigned char *)(v6 + 306) = self->_optionsAllowCellularAccess;
    *(_DWORD *)(v6 + 316) |= 0x2000000u;
  }
  id v46 = (id)v6;

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_221;
  }
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  int v6 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_triggers != *((void *)v4 + 18)) {
      goto LABEL_221;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportFrequency != *((void *)v4 + 4)) {
      goto LABEL_221;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_221;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportFrequencyBase != *((void *)v4 + 5)) {
      goto LABEL_221;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_221;
  }
  networkTaskDescription = self->_networkTaskDescription;
  if ((unint64_t)networkTaskDescription | *((void *)v4 + 31)
    && !-[NSString isEqual:](networkTaskDescription, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkHostname = self->_networkHostname;
  if ((unint64_t)networkHostname | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](networkHostname, "isEqual:")) {
      goto LABEL_221;
    }
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if ((unint64_t)networkRemoteAddresssAndPort | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](networkRemoteAddresssAndPort, "isEqual:")) {
      goto LABEL_221;
    }
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if ((unint64_t)networkConnectionUuid | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](networkConnectionUuid, "isEqual:")) {
      goto LABEL_221;
    }
  }
  int v11 = *((_DWORD *)v4 + 79);
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v11 & 0x800000) == 0) {
      goto LABEL_221;
    }
    if (self->_networkConnectionReused)
    {
      if (!*((unsigned char *)v4 + 304)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 304))
    {
      goto LABEL_221;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_221;
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if ((unint64_t)networkInterfaceIdentifier | *((void *)v4 + 22)
    && !-[NSString isEqual:](networkInterfaceIdentifier, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkProtocolName = self->_networkProtocolName;
  if ((unint64_t)networkProtocolName | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](networkProtocolName, "isEqual:")) {
      goto LABEL_221;
    }
  }
  $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_networkRequestHeaderSize != *((_DWORD *)v4 + 56)) {
      goto LABEL_221;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_221;
  }
  if (*(unsigned char *)&v14)
  {
    if ((v15 & 1) == 0 || self->_networkRequestBodyBytesSent != *((void *)v4 + 1)) {
      goto LABEL_221;
    }
  }
  else if (v15)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0 || self->_networkResponseHeaderSize != *((_DWORD *)v4 + 60)) {
      goto LABEL_221;
    }
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(unsigned char *)&v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_networkResponseBodyBytesReceived != *((void *)v4 + 2)) {
      goto LABEL_221;
    }
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_networkPreviousAttemptCount != *((_DWORD *)v4 + 50)) {
      goto LABEL_221;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_221;
  }
  networkFatalError = self->_networkFatalError;
  if ((unint64_t)networkFatalError | *((void *)v4 + 20))
  {
    if (!-[C2MPError isEqual:](networkFatalError, "isEqual:")) {
      goto LABEL_221;
    }
    $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 79);
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_networkStatusCode != *((void *)v4 + 3)) {
      goto LABEL_221;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_221;
  }
  networkRequestUruint64_t i = self->_networkRequestUri;
  if ((unint64_t)networkRequestUri | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](networkRequestUri, "isEqual:")) {
      goto LABEL_221;
    }
    $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v19 & 0x1000000) == 0) {
      goto LABEL_221;
    }
    if (self->_networkIsDiscretionary)
    {
      if (!*((unsigned char *)v4 + 305)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 305))
    {
      goto LABEL_221;
    }
  }
  else if ((v19 & 0x1000000) != 0)
  {
    goto LABEL_221;
  }
  networkNegotiatedTlsProtocolVersion = self->_networkNegotiatedTlsProtocolVersion;
  if ((unint64_t)networkNegotiatedTlsProtocolVersion | *((void *)v4 + 23)
    && !-[NSString isEqual:](networkNegotiatedTlsProtocolVersion, "isEqual:"))
  {
    goto LABEL_221;
  }
  networkPathInfos = self->_networkPathInfos;
  if ((unint64_t)networkPathInfos | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](networkPathInfos, "isEqual:")) {
      goto LABEL_221;
    }
  }
  $C893DAD969560203051D3A1C34B78D80 v22 = self->_has;
  int v23 = *((_DWORD *)v4 + 79);
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0 || self->_timestampC2Init != *((void *)v4 + 6)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_221;
  }
  if ((*(unsigned char *)&v22 & 0x80) != 0)
  {
    if ((v23 & 0x80) == 0 || self->_timestampC2Start != *((void *)v4 + 8)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x80) != 0)
  {
    goto LABEL_221;
  }
  if ((*(unsigned char *)&v22 & 0x40) != 0)
  {
    if ((v23 & 0x40) == 0 || self->_timestampC2Now != *((void *)v4 + 7)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x40) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    if ((v23 & 0x200) == 0 || self->_timestampDnsStart != *((void *)v4 + 10)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x200) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x100) != 0)
  {
    if ((v23 & 0x100) == 0 || self->_timestampDnsEnd != *((void *)v4 + 9)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x100) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    if ((v23 & 0x10000) == 0 || self->_timestampTcpStart != *((void *)v4 + 17)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x10000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x8000) != 0)
  {
    if ((v23 & 0x8000) == 0 || self->_timestampTcpEnd != *((void *)v4 + 16)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x8000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0 || self->_timestampSslStart != *((void *)v4 + 15)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x800) != 0)
  {
    if ((v23 & 0x800) == 0 || self->_timestampRequestStart != *((void *)v4 + 12)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x800) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    if ((v23 & 0x400) == 0 || self->_timestampRequestEnd != *((void *)v4 + 11)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x400) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x2000) != 0)
  {
    if ((v23 & 0x2000) == 0 || self->_timestampResponseStart != *((void *)v4 + 14)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x2000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
    if ((v23 & 0x1000) == 0 || self->_timestampResponseEnd != *((void *)v4 + 13)) {
      goto LABEL_221;
    }
  }
  else if ((v23 & 0x1000) != 0)
  {
    goto LABEL_221;
  }
  optionsQualityOfService = self->_optionsQualityOfService;
  if ((unint64_t)optionsQualityOfService | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](optionsQualityOfService, "isEqual:")) {
      goto LABEL_221;
    }
    $C893DAD969560203051D3A1C34B78D80 v22 = self->_has;
  }
  int v25 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v22 & 0x20000000) != 0)
  {
    if ((v25 & 0x20000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsOutOfProcess)
    {
      if (!*((unsigned char *)v4 + 310)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 310))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x20000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsOutOfProcessForceDiscretionary)
    {
      if (!*((unsigned char *)v4 + 311)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 311))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x4000000) != 0)
  {
    if ((v25 & 0x4000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsAllowExpensiveAccess)
    {
      if (!*((unsigned char *)v4 + 307)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 307))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x4000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x8000000) != 0)
  {
    if ((v25 & 0x8000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsAllowPowerNapScheduling)
    {
      if (!*((unsigned char *)v4 + 308)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 308))
    {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x8000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0 || self->_optionsTimeoutIntervalForRequest != *((_DWORD *)v4 + 74)) {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v22 & 0x400000) != 0)
  {
    if ((v25 & 0x400000) == 0 || self->_optionsTimeoutIntervalForResource != *((_DWORD *)v4 + 75)) {
      goto LABEL_221;
    }
  }
  else if ((v25 & 0x400000) != 0)
  {
    goto LABEL_221;
  }
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if ((unint64_t)optionsSourceApplicationBundleIdentifier | *((void *)v4 + 35)
    && !-[NSString isEqual:](optionsSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_221;
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if ((unint64_t)optionsSourceApplicationSecondaryIdentifier | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](optionsSourceApplicationSecondaryIdentifier, "isEqual:")) {
      goto LABEL_221;
    }
  }
  $C893DAD969560203051D3A1C34B78D80 v28 = self->_has;
  int v29 = *((_DWORD *)v4 + 79);
  if ((*(_DWORD *)&v28 & 0x10000000) != 0)
  {
    if ((v29 & 0x10000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsAppleIdContext)
    {
      if (!*((unsigned char *)v4 + 309)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 309))
    {
      goto LABEL_221;
    }
  }
  else if ((v29 & 0x10000000) != 0)
  {
    goto LABEL_221;
  }
  if ((*(_DWORD *)&v28 & 0x80000000) != 0)
  {
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_221;
    }
    if (self->_optionsTlsPinningRequired)
    {
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_221;
      }
    }
    else if (*((unsigned char *)v4 + 312))
    {
      goto LABEL_221;
    }
  }
  else if (v29 < 0)
  {
    goto LABEL_221;
  }
  optionsDiscretionaryNetworkBehavior = self->_optionsDiscretionaryNetworkBehavior;
  if ((unint64_t)optionsDiscretionaryNetworkBehavior | *((void *)v4 + 32)
    && !-[NSString isEqual:](optionsDiscretionaryNetworkBehavior, "isEqual:"))
  {
    goto LABEL_221;
  }
  optionsDuetPreClearedMode = self->_optionsDuetPreClearedMode;
  if ((unint64_t)optionsDuetPreClearedMode | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](optionsDuetPreClearedMode, "isEqual:")) {
      goto LABEL_221;
    }
  }
  int v32 = *((_DWORD *)v4 + 79);
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0)
  {
    if ((v32 & 0x2000000) != 0)
    {
      if (self->_optionsAllowCellularAccess)
      {
        if (!*((unsigned char *)v4 + 306)) {
          goto LABEL_221;
        }
LABEL_223:
        BOOL v33 = 1;
        goto LABEL_222;
      }
      if (!*((unsigned char *)v4 + 306)) {
        goto LABEL_223;
      }
    }
LABEL_221:
    BOOL v33 = 0;
    goto LABEL_222;
  }
  BOOL v33 = (v32 & 0x2000000) == 0;
LABEL_222:

  return v33;
}

- (unint64_t)hash
{
  $C893DAD969560203051D3A1C34B78D80 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0) {
    unint64_t v4 = 2654435761u * self->_triggers;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v64 = v4;
  if ((*(unsigned char *)&has & 8) != 0) {
    unint64_t v5 = 2654435761u * self->_reportFrequency;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v63 = v5;
  if ((*(unsigned char *)&has & 0x10) != 0) {
    unint64_t v32 = 2654435761u * self->_reportFrequencyBase;
  }
  else {
    unint64_t v32 = 0;
  }
  NSUInteger v62 = [(NSString *)self->_networkTaskDescription hash];
  NSUInteger v61 = [(NSString *)self->_networkHostname hash];
  NSUInteger v60 = [(NSString *)self->_networkRemoteAddresssAndPort hash];
  NSUInteger v59 = [(NSString *)self->_networkConnectionUuid hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v31 = 2654435761 * self->_networkConnectionReused;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v58 = [(NSString *)self->_networkInterfaceIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_networkProtocolName hash];
  $C893DAD969560203051D3A1C34B78D80 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    uint64_t v8 = 2654435761 * self->_networkRequestHeaderSize;
    if (*(unsigned char *)&v7)
    {
LABEL_15:
      unint64_t v9 = 2654435761u * self->_networkRequestBodyBytesSent;
      if ((*(_DWORD *)&v7 & 0x100000) != 0) {
        goto LABEL_16;
      }
LABEL_20:
      uint64_t v10 = 0;
      if ((*(unsigned char *)&v7 & 2) != 0) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (*(unsigned char *)&v7) {
      goto LABEL_15;
    }
  }
  unint64_t v9 = 0;
  if ((*(_DWORD *)&v7 & 0x100000) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v10 = 2654435761 * self->_networkResponseHeaderSize;
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
LABEL_17:
    unint64_t v11 = 2654435761u * self->_networkResponseBodyBytesReceived;
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v11 = 0;
LABEL_22:
  uint64_t v56 = v8;
  NSUInteger v57 = v6;
  uint64_t v54 = v10;
  unint64_t v55 = v9;
  unint64_t v53 = v11;
  if ((*(_DWORD *)&v7 & 0x40000) != 0) {
    uint64_t v30 = 2654435761 * self->_networkPreviousAttemptCount;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v52 = [(C2MPError *)self->_networkFatalError hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v29 = 2654435761u * self->_networkStatusCode;
  }
  else {
    unint64_t v29 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_networkRequestUri hash];
  if (*((unsigned char *)&self->_has + 3)) {
    uint64_t v28 = 2654435761 * self->_networkIsDiscretionary;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_networkNegotiatedTlsProtocolVersion hash];
  uint64_t v13 = [(NSMutableArray *)self->_networkPathInfos hash];
  $C893DAD969560203051D3A1C34B78D80 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    unint64_t v49 = 2654435761u * self->_timestampC2Init;
    if ((*(unsigned char *)&v14 & 0x80) != 0)
    {
LABEL_33:
      unint64_t v48 = 2654435761u * self->_timestampC2Start;
      if ((*(unsigned char *)&v14 & 0x40) != 0) {
        goto LABEL_34;
      }
      goto LABEL_45;
    }
  }
  else
  {
    unint64_t v49 = 0;
    if ((*(unsigned char *)&v14 & 0x80) != 0) {
      goto LABEL_33;
    }
  }
  unint64_t v48 = 0;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
LABEL_34:
    unint64_t v47 = 2654435761u * self->_timestampC2Now;
    if ((*(_WORD *)&v14 & 0x200) != 0) {
      goto LABEL_35;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v47 = 0;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
LABEL_35:
    unint64_t v46 = 2654435761u * self->_timestampDnsStart;
    if ((*(_WORD *)&v14 & 0x100) != 0) {
      goto LABEL_36;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v46 = 0;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
LABEL_36:
    unint64_t v45 = 2654435761u * self->_timestampDnsEnd;
    if ((*(_DWORD *)&v14 & 0x10000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_48;
  }
LABEL_47:
  unint64_t v45 = 0;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
LABEL_37:
    unint64_t v44 = 2654435761u * self->_timestampTcpStart;
    if ((*(_WORD *)&v14 & 0x8000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v44 = 0;
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_38:
    unint64_t v43 = 2654435761u * self->_timestampTcpEnd;
    if ((*(_WORD *)&v14 & 0x4000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v43 = 0;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
LABEL_39:
    unint64_t v42 = 2654435761u * self->_timestampSslStart;
    if ((*(_WORD *)&v14 & 0x800) != 0) {
      goto LABEL_40;
    }
    goto LABEL_51;
  }
LABEL_50:
  unint64_t v42 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_40:
    unint64_t v41 = 2654435761u * self->_timestampRequestStart;
    if ((*(_WORD *)&v14 & 0x400) != 0) {
      goto LABEL_41;
    }
LABEL_52:
    unint64_t v40 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_53;
  }
LABEL_51:
  unint64_t v41 = 0;
  if ((*(_WORD *)&v14 & 0x400) == 0) {
    goto LABEL_52;
  }
LABEL_41:
  unint64_t v40 = 2654435761u * self->_timestampRequestEnd;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
LABEL_42:
    unint64_t v39 = 2654435761u * self->_timestampResponseStart;
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v39 = 0;
LABEL_54:
  uint64_t v50 = v13;
  if ((*(_WORD *)&v14 & 0x1000) != 0) {
    unint64_t v38 = 2654435761u * self->_timestampResponseEnd;
  }
  else {
    unint64_t v38 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_optionsQualityOfService hash];
  $C893DAD969560203051D3A1C34B78D80 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000000) != 0)
  {
    uint64_t v37 = 2654435761 * self->_optionsOutOfProcess;
    if ((*(_DWORD *)&v16 & 0x40000000) != 0)
    {
LABEL_59:
      uint64_t v36 = 2654435761 * self->_optionsOutOfProcessForceDiscretionary;
      if ((*(_DWORD *)&v16 & 0x4000000) != 0) {
        goto LABEL_60;
      }
LABEL_64:
      uint64_t v35 = 0;
      if ((*(_DWORD *)&v16 & 0x8000000) != 0) {
        goto LABEL_61;
      }
      goto LABEL_65;
    }
  }
  else
  {
    uint64_t v37 = 0;
    if ((*(_DWORD *)&v16 & 0x40000000) != 0) {
      goto LABEL_59;
    }
  }
  uint64_t v36 = 0;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0) {
    goto LABEL_64;
  }
LABEL_60:
  uint64_t v35 = 2654435761 * self->_optionsAllowExpensiveAccess;
  if ((*(_DWORD *)&v16 & 0x8000000) != 0)
  {
LABEL_61:
    uint64_t v34 = 2654435761 * self->_optionsAllowPowerNapScheduling;
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v34 = 0;
LABEL_66:
  NSUInteger v65 = v12;
  if ((*(_DWORD *)&v16 & 0x200000) != 0) {
    uint64_t v33 = 2654435761 * self->_optionsTimeoutIntervalForRequest;
  }
  else {
    uint64_t v33 = 0;
  }
  NSUInteger v17 = v15;
  if ((*(_DWORD *)&v16 & 0x400000) != 0) {
    uint64_t v18 = 2654435761 * self->_optionsTimeoutIntervalForResource;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_optionsSourceApplicationBundleIdentifier hash];
  NSUInteger v20 = [(NSString *)self->_optionsSourceApplicationSecondaryIdentifier hash];
  $C893DAD969560203051D3A1C34B78D80 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x10000000) != 0)
  {
    uint64_t v22 = 2654435761 * self->_optionsAppleIdContext;
    if ((*(_DWORD *)&v21 & 0x80000000) != 0) {
      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((*(_DWORD *)&v21 & 0x80000000) != 0)
    {
LABEL_74:
      uint64_t v23 = 2654435761 * self->_optionsTlsPinningRequired;
      goto LABEL_77;
    }
  }
  uint64_t v23 = 0;
LABEL_77:
  NSUInteger v24 = [(NSString *)self->_optionsDiscretionaryNetworkBehavior hash];
  NSUInteger v25 = [(NSString *)self->_optionsDuetPreClearedMode hash];
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    uint64_t v26 = 2654435761 * self->_optionsAllowCellularAccess;
  }
  else {
    uint64_t v26 = 0;
  }
  return v63 ^ v64 ^ v32 ^ v62 ^ v61 ^ v60 ^ v59 ^ v31 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v30 ^ v52 ^ v29 ^ v51 ^ v28 ^ v65 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v17 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unint64_t *)a3;
  unint64_t v5 = v4;
  int v6 = *((_DWORD *)v4 + 79);
  if ((v6 & 0x20000) != 0)
  {
    self->_triggers = v4[18];
    *(_DWORD *)&self->_has |= 0x20000u;
    int v6 = *((_DWORD *)v4 + 79);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_reportFrequency = v4[4];
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v4 + 79) & 0x10) != 0)
  {
LABEL_4:
    self->_reportFrequencyBase = v4[5];
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (v4[31]) {
    -[C2MPNetworkEvent setNetworkTaskDescription:](self, "setNetworkTaskDescription:");
  }
  if (v5[21]) {
    -[C2MPNetworkEvent setNetworkHostname:](self, "setNetworkHostname:");
  }
  if (v5[27]) {
    -[C2MPNetworkEvent setNetworkRemoteAddresssAndPort:](self, "setNetworkRemoteAddresssAndPort:");
  }
  if (v5[19]) {
    -[C2MPNetworkEvent setNetworkConnectionUuid:](self, "setNetworkConnectionUuid:");
  }
  if ((*((unsigned char *)v5 + 318) & 0x80) != 0)
  {
    self->_networkConnectionReused = *((unsigned char *)v5 + 304);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (v5[22]) {
    -[C2MPNetworkEvent setNetworkInterfaceIdentifier:](self, "setNetworkInterfaceIdentifier:");
  }
  if (v5[26]) {
    -[C2MPNetworkEvent setNetworkProtocolName:](self, "setNetworkProtocolName:");
  }
  int v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 0x80000) != 0)
  {
    self->_networkRequestHeaderSize = *((_DWORD *)v5 + 56);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v7 = *((_DWORD *)v5 + 79);
    if ((v7 & 1) == 0)
    {
LABEL_21:
      if ((v7 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_networkRequestBodyBytesSent = v5[1];
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_networkResponseHeaderSize = *((_DWORD *)v5 + 60);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v7 = *((_DWORD *)v5 + 79);
  if ((v7 & 2) == 0)
  {
LABEL_23:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_34:
  self->_networkResponseBodyBytesReceived = v5[2];
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 79) & 0x40000) != 0)
  {
LABEL_24:
    self->_networkPreviousAttemptCount = *((_DWORD *)v5 + 50);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  unint64_t v9 = v5[20];
  if (networkFatalError)
  {
    if (v9) {
      -[C2MPError mergeFrom:](networkFatalError, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[C2MPNetworkEvent setNetworkFatalError:](self, "setNetworkFatalError:");
  }
  if ((*((unsigned char *)v5 + 316) & 4) != 0)
  {
    self->_networkStatusCode = v5[3];
    *(_DWORD *)&self->_has |= 4u;
  }
  if (v5[29]) {
    -[C2MPNetworkEvent setNetworkRequestUri:](self, "setNetworkRequestUri:");
  }
  if (*((unsigned char *)v5 + 319))
  {
    self->_networkIsDiscretionary = *((unsigned char *)v5 + 305);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (v5[23]) {
    -[C2MPNetworkEvent setNetworkNegotiatedTlsProtocolVersion:](self, "setNetworkNegotiatedTlsProtocolVersion:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = (id)v5[24];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        -[C2MPNetworkEvent addNetworkPathInfo:](self, "addNetworkPathInfo:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x20) != 0)
  {
    self->_timestampC2Init = v5[6];
    *(_DWORD *)&self->_has |= 0x20u;
    int v15 = *((_DWORD *)v5 + 79);
    if ((v15 & 0x80) == 0)
    {
LABEL_55:
      if ((v15 & 0x40) == 0) {
        goto LABEL_56;
      }
      goto LABEL_92;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_55;
  }
  self->_timestampC2Start = v5[8];
  *(_DWORD *)&self->_has |= 0x80u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x40) == 0)
  {
LABEL_56:
    if ((v15 & 0x200) == 0) {
      goto LABEL_57;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_timestampC2Now = v5[7];
  *(_DWORD *)&self->_has |= 0x40u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x200) == 0)
  {
LABEL_57:
    if ((v15 & 0x100) == 0) {
      goto LABEL_58;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_timestampDnsStart = v5[10];
  *(_DWORD *)&self->_has |= 0x200u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x100) == 0)
  {
LABEL_58:
    if ((v15 & 0x10000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_timestampDnsEnd = v5[9];
  *(_DWORD *)&self->_has |= 0x100u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x10000) == 0)
  {
LABEL_59:
    if ((v15 & 0x8000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_timestampTcpStart = v5[17];
  *(_DWORD *)&self->_has |= 0x10000u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x8000) == 0)
  {
LABEL_60:
    if ((v15 & 0x4000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_timestampTcpEnd = v5[16];
  *(_DWORD *)&self->_has |= 0x8000u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x4000) == 0)
  {
LABEL_61:
    if ((v15 & 0x800) == 0) {
      goto LABEL_62;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_timestampSslStart = v5[15];
  *(_DWORD *)&self->_has |= 0x4000u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x800) == 0)
  {
LABEL_62:
    if ((v15 & 0x400) == 0) {
      goto LABEL_63;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_timestampRequestStart = v5[12];
  *(_DWORD *)&self->_has |= 0x800u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x400) == 0)
  {
LABEL_63:
    if ((v15 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_timestampRequestEnd = v5[11];
  *(_DWORD *)&self->_has |= 0x400u;
  int v15 = *((_DWORD *)v5 + 79);
  if ((v15 & 0x2000) == 0)
  {
LABEL_64:
    if ((v15 & 0x1000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_100:
  self->_timestampResponseStart = v5[14];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 79) & 0x1000) != 0)
  {
LABEL_65:
    self->_timestampResponseEnd = v5[13];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_66:
  if (v5[34]) {
    -[C2MPNetworkEvent setOptionsQualityOfService:](self, "setOptionsQualityOfService:");
  }
  int v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x20000000) != 0)
  {
    self->_optionsOutOfProcess = *((unsigned char *)v5 + 310);
    *(_DWORD *)&self->_has |= 0x20000000u;
    int v16 = *((_DWORD *)v5 + 79);
    if ((v16 & 0x40000000) == 0)
    {
LABEL_70:
      if ((v16 & 0x4000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_104;
    }
  }
  else if ((v16 & 0x40000000) == 0)
  {
    goto LABEL_70;
  }
  self->_optionsOutOfProcessForceDiscretionary = *((unsigned char *)v5 + 311);
  *(_DWORD *)&self->_has |= 0x40000000u;
  int v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x4000000) == 0)
  {
LABEL_71:
    if ((v16 & 0x8000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_optionsAllowExpensiveAccess = *((unsigned char *)v5 + 307);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x8000000) == 0)
  {
LABEL_72:
    if ((v16 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_optionsAllowPowerNapScheduling = *((unsigned char *)v5 + 308);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v16 = *((_DWORD *)v5 + 79);
  if ((v16 & 0x200000) == 0)
  {
LABEL_73:
    if ((v16 & 0x400000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_106:
  self->_optionsTimeoutIntervalForRequest = *((_DWORD *)v5 + 74);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)v5 + 79) & 0x400000) != 0)
  {
LABEL_74:
    self->_optionsTimeoutIntervalForResource = *((_DWORD *)v5 + 75);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_75:
  if (v5[35]) {
    -[C2MPNetworkEvent setOptionsSourceApplicationBundleIdentifier:](self, "setOptionsSourceApplicationBundleIdentifier:");
  }
  if (v5[36]) {
    -[C2MPNetworkEvent setOptionsSourceApplicationSecondaryIdentifier:](self, "setOptionsSourceApplicationSecondaryIdentifier:");
  }
  int v17 = *((_DWORD *)v5 + 79);
  if ((v17 & 0x10000000) != 0)
  {
    self->_optionsAppleIdContext = *((unsigned char *)v5 + 309);
    *(_DWORD *)&self->_has |= 0x10000000u;
    int v17 = *((_DWORD *)v5 + 79);
  }
  if (v17 < 0)
  {
    self->_optionsTlsPinningRequired = *((unsigned char *)v5 + 312);
    *(_DWORD *)&self->_has |= 0x80000000;
  }
  if (v5[32]) {
    -[C2MPNetworkEvent setOptionsDiscretionaryNetworkBehavior:](self, "setOptionsDiscretionaryNetworkBehavior:");
  }
  if (v5[33]) {
    -[C2MPNetworkEvent setOptionsDuetPreClearedMode:](self, "setOptionsDuetPreClearedMode:");
  }
  if ((*((unsigned char *)v5 + 319) & 2) != 0)
  {
    self->_optionsAllowCellularAccess = *((unsigned char *)v5 + 306);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (NSString)networkTaskDescription
{
  return self->_networkTaskDescription;
}

- (NSString)networkHostname
{
  return self->_networkHostname;
}

- (NSString)networkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort;
}

- (NSString)networkConnectionUuid
{
  return self->_networkConnectionUuid;
}

- (BOOL)networkConnectionReused
{
  return self->_networkConnectionReused;
}

- (NSString)networkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier;
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (unsigned)networkRequestHeaderSize
{
  return self->_networkRequestHeaderSize;
}

- (unint64_t)networkRequestBodyBytesSent
{
  return self->_networkRequestBodyBytesSent;
}

- (unsigned)networkResponseHeaderSize
{
  return self->_networkResponseHeaderSize;
}

- (unint64_t)networkResponseBodyBytesReceived
{
  return self->_networkResponseBodyBytesReceived;
}

- (unsigned)networkPreviousAttemptCount
{
  return self->_networkPreviousAttemptCount;
}

- (C2MPError)networkFatalError
{
  return self->_networkFatalError;
}

- (void)setNetworkFatalError:(id)a3
{
}

- (unint64_t)networkStatusCode
{
  return self->_networkStatusCode;
}

- (NSString)networkRequestUri
{
  return self->_networkRequestUri;
}

- (BOOL)networkIsDiscretionary
{
  return self->_networkIsDiscretionary;
}

- (NSString)networkNegotiatedTlsProtocolVersion
{
  return self->_networkNegotiatedTlsProtocolVersion;
}

- (NSMutableArray)networkPathInfos
{
  return self->_networkPathInfos;
}

- (void)setNetworkPathInfos:(id)a3
{
}

- (unint64_t)timestampC2Init
{
  return self->_timestampC2Init;
}

- (unint64_t)timestampC2Start
{
  return self->_timestampC2Start;
}

- (unint64_t)timestampC2Now
{
  return self->_timestampC2Now;
}

- (unint64_t)timestampDnsStart
{
  return self->_timestampDnsStart;
}

- (unint64_t)timestampDnsEnd
{
  return self->_timestampDnsEnd;
}

- (unint64_t)timestampTcpStart
{
  return self->_timestampTcpStart;
}

- (unint64_t)timestampTcpEnd
{
  return self->_timestampTcpEnd;
}

- (unint64_t)timestampSslStart
{
  return self->_timestampSslStart;
}

- (unint64_t)timestampRequestStart
{
  return self->_timestampRequestStart;
}

- (unint64_t)timestampRequestEnd
{
  return self->_timestampRequestEnd;
}

- (unint64_t)timestampResponseStart
{
  return self->_timestampResponseStart;
}

- (unint64_t)timestampResponseEnd
{
  return self->_timestampResponseEnd;
}

- (NSString)optionsQualityOfService
{
  return self->_optionsQualityOfService;
}

- (BOOL)optionsOutOfProcess
{
  return self->_optionsOutOfProcess;
}

- (BOOL)optionsOutOfProcessForceDiscretionary
{
  return self->_optionsOutOfProcessForceDiscretionary;
}

- (BOOL)optionsAllowExpensiveAccess
{
  return self->_optionsAllowExpensiveAccess;
}

- (BOOL)optionsAllowPowerNapScheduling
{
  return self->_optionsAllowPowerNapScheduling;
}

- (unsigned)optionsTimeoutIntervalForRequest
{
  return self->_optionsTimeoutIntervalForRequest;
}

- (unsigned)optionsTimeoutIntervalForResource
{
  return self->_optionsTimeoutIntervalForResource;
}

- (NSString)optionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier;
}

- (NSString)optionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier;
}

- (BOOL)optionsAppleIdContext
{
  return self->_optionsAppleIdContext;
}

- (BOOL)optionsTlsPinningRequired
{
  return self->_optionsTlsPinningRequired;
}

- (NSString)optionsDiscretionaryNetworkBehavior
{
  return self->_optionsDiscretionaryNetworkBehavior;
}

- (NSString)optionsDuetPreClearedMode
{
  return self->_optionsDuetPreClearedMode;
}

- (BOOL)optionsAllowCellularAccess
{
  return self->_optionsAllowCellularAccess;
}

@end