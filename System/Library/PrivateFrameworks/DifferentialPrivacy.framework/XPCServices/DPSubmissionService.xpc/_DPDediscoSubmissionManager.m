@interface _DPDediscoSubmissionManager
- (BOOL)handleDediscoDonation:(id)a3 error:(id *)a4;
- (BOOL)handleDediscoDonation:(id)a3 overrideVerifyDate:(id)a4 error:(id *)a5;
- (_DPDediscoNetworkingService)networkingService;
- (_DPDediscoSubmissionManager)init;
- (_DPDediscoSubmissionManager)initWithNetworkingService:(id)a3;
- (id)algorithmParamsForDonation:(id)a3 dediscoOtherParams:(id)a4;
- (id)baaCertificateChainFromBAASignature:(id)a3;
- (id)base64PublicKeyRepresentationFromSecKeyRef:(id)a3;
- (id)encryptWithKey:(id)a3 data:(id)a4;
- (id)keysFromConfigurationFile:(id)a3 overrideVerifyDate:(id)a4 dediscoServerNames:(id)a5 error:(id *)a6;
- (id)payloadForDonation:(id)a3 keys:(id)a4 error:(id *)a5;
- (id)serializeOtherParamsWithMetadata:(id)a3 error:(id *)a4;
- (id)serializePayload:(id)a3 error:(id *)a4;
- (id)signPayloadData:(id)a3;
- (id)uploadDAPPayload:(id)a3 withEncoder:(id)a4 withKeys:(id)a5 useOHTTP:(BOOL)a6 telemetryAllowed:(BOOL)a7;
- (id)uploadSerializedPayload:(id)a3 baaCertificateChain:(id)a4 baaSignature:(id)a5 options:(int64_t)a6;
- (void)setNetworkingService:(id)a3;
@end

@implementation _DPDediscoSubmissionManager

- (_DPDediscoSubmissionManager)init
{
  v3 = +[NSURL URLWithString:@"https://unlinkability.apple.com/config/global-config.plist"];
  v4 = [[_DPDediscoNetworkingService alloc] initWithDomain:@"https://unlinkability.apple.com" configurationURL:v3];
  v5 = [(_DPDediscoSubmissionManager *)self initWithNetworkingService:v4];

  return v5;
}

- (_DPDediscoSubmissionManager)initWithNetworkingService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DPDediscoSubmissionManager;
  v6 = [(_DPDediscoSubmissionManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkingService, a3);
  }

  return v7;
}

- (BOOL)handleDediscoDonation:(id)a3 error:(id *)a4
{
  return [(_DPDediscoSubmissionManager *)self handleDediscoDonation:a3 overrideVerifyDate:0 error:a4];
}

- (BOOL)handleDediscoDonation:(id)a3 overrideVerifyDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 metadata];
  v11 = [v10 objectForKeyedSubscript:@"telemetryAllowed"];
  unsigned __int8 v12 = [v11 BOOLValue];

  v13 = [(_DPDediscoSubmissionManager *)self networkingService];
  id v111 = 0;
  v14 = [v13 downloadConfigSynchronouslyWithError:&v111];
  id v15 = v111;

  if (v14)
  {
    id v103 = v15;
    v16 = [v8 metadata];
    v17 = [v16 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
    v18 = [v17 objectForKeyedSubscript:kDPMetadataDediscoServerConfiguration];
    id v110 = 0;
    id v104 = v9;
    uint64_t v19 = [(_DPDediscoSubmissionManager *)self keysFromConfigurationFile:v14 overrideVerifyDate:v9 dediscoServerNames:v18 error:&v110];
    id v20 = v110;

    if (v20)
    {
      v21 = +[_DPLog service];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10005813C();
      }

      v22 = (void *)v19;
      id v9 = v104;
      if (a5) {
        *a5 = v20;
      }
      id v23 = [v8 key];
      if (v12) {
        unsigned __int8 v24 = 1;
      }
      else {
        unsigned __int8 v24 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v89) = v24;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v23, 4, 0, 0, 402, @"Failed to extract fields from config file", 0x100000001, v89);
      BOOL v40 = 0;
      goto LABEL_103;
    }
    id v109 = 0;
    uint64_t v27 = [(_DPDediscoSubmissionManager *)self payloadForDonation:v8 keys:v19 error:&v109];
    id v23 = v109;
    v22 = (void *)v19;
    if (!v27)
    {
      v41 = +[_DPLog service];
      id v9 = v104;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100057CEC();
      }

      BOOL v40 = 0;
      if (a5) {
        *a5 = v23;
      }
      v51 = 0;
      goto LABEL_102;
    }
    id v108 = 0;
    uint64_t v28 = [(_DPDediscoSubmissionManager *)self serializePayload:v27 error:&v108];
    id v102 = v108;
    v29 = (void *)v28;
    id v9 = v104;
    v101 = v29;
    if (!v29)
    {
      v42 = (void *)v27;
      v43 = +[_DPLog service];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_100057D54((uint64_t)v102, v43);
      }

      if (a5)
      {
        *a5 = +[_DPDediscoError errorWithCode:101 underlyingError:v102 description:@"Unable to serialize payload dictionary."];
      }
      v38 = [v8 key];
      if (v12) {
        unsigned __int8 v44 = 1;
      }
      else {
        unsigned __int8 v44 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v89) = v44;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v38, 4, 0, 0, 407, @"Failed to serialize payload", 0x100000001, v89);
      BOOL v40 = 0;
      v51 = v42;
      goto LABEL_101;
    }
    v100 = (void *)v27;
    if ((unint64_t)[v29 length] > 0x100000)
    {
      v30 = +[_DPLog service];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100057DE0(v30, v31, v32, v33, v34, v35, v36, v37);
      }

      v38 = [v8 key];
      if (v12) {
        unsigned __int8 v39 = 1;
      }
      else {
        unsigned __int8 v39 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v89) = v39;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v38, 4, 0, 0, 408, @"Payload size exceeds 1 MB", 0x100000001, v89);
      BOOL v40 = 0;
      v51 = v100;
      goto LABEL_101;
    }
    id v98 = v23;
    id v107 = 0;
    unsigned int v95 = [v8 isOHTTPEnabledWithError:&v107];
    id v45 = v107;
    v46 = +[_DPLog service];
    v47 = v46;
    id v99 = v45;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1000580D4();
      }

      v48 = [v8 key];
      v49 = [v45 localizedDescription];
      id v23 = v98;
      if (v12) {
        unsigned __int8 v50 = 1;
      }
      else {
        unsigned __int8 v50 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v89) = v50;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v48, 4, 0, 0, 412, v49, 0x100000001, v89);

      BOOL v40 = 0;
      v38 = v99;
      v51 = v100;
      goto LABEL_101;
    }
    BOOL v52 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
    if (!v95)
    {
      id v23 = v98;
      if (v52) {
        sub_100058050(v8);
      }

      uint64_t v58 = [(_DPDediscoSubmissionManager *)self signPayloadData:v101];
      v94 = v22;
      if (v58)
      {
        v59 = (void *)v58;
        uint64_t v97 = [(_DPDediscoSubmissionManager *)self baaCertificateChainFromBAASignature:v58];
        v60 = [v8 key];
        if (v12) {
          unsigned __int8 v61 = 1;
        }
        else {
          unsigned __int8 v61 = +[_DPDeviceInfo isInternalBuild];
        }
        LOBYTE(v89) = v61;
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v60, 4, 0, 1, 400, 0, 0x100000001, v89);

        v73 = [v59 signature];
        v74 = [(_DPDediscoSubmissionManager *)self uploadSerializedPayload:v101 baaCertificateChain:v97 baaSignature:v73 options:0];

        v75 = +[_DPLog service];
        v76 = v75;
        v92 = v74;
        if (v74)
        {
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
            sub_100057FE8();
          }

          if (a5) {
            *a5 = v74;
          }
          v77 = [v8 key];
          v78 = [v74 localizedDescription];
          if (v12) {
            unsigned __int8 v79 = 1;
          }
          else {
            unsigned __int8 v79 = +[_DPDeviceInfo isInternalBuild];
          }
          LOBYTE(v90) = v79;
          +[_DPLHBitacoraLogger donateEventToBitacoraForKey:v77 eventPhase:5 uuid:0 succeeded:0 errorCode:502 errorMessage:v78 aggregateFunction:0x100000001 count:v90 telemetryAllowed:v92];

          int v85 = 1;
        }
        else
        {
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Payload submission was successful", buf, 2u);
          }

          v80 = +[_DPCoreAnalyticsCollector sharedInstance];
          uint64_t v81 = _DPCoreAnalyticsEvent_PhaseCount;
          v113[0] = &off_100079918;
          v112[0] = _DPCoreAnalyticsField_Phase;
          v112[1] = _DPCoreAnalyticsField_TaskName;
          v82 = [v100 getCollectionId];
          v113[1] = v82;
          v113[2] = &__kCFBooleanTrue;
          v112[2] = _DPCoreAnalyticsField_Status;
          v112[3] = _DPCoreAnalyticsField_Counts;
          v113[3] = &off_100079930;
          v83 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:4];
          [v80 reportMetricsForEvent:v81 withMetrics:v83];

          v77 = [v8 key];
          if (v12) {
            unsigned __int8 v84 = 1;
          }
          else {
            unsigned __int8 v84 = +[_DPDeviceInfo isInternalBuild];
          }
          LOBYTE(v90) = v84;
          +[_DPLHBitacoraLogger donateEventToBitacoraForKey:v77 eventPhase:5 uuid:0 succeeded:1 errorCode:500 errorMessage:0 aggregateFunction:0x100000001 count:v90 telemetryAllowed:0];
          int v85 = 0;
        }
        v70 = (void *)v97;

        v38 = 0;
        v51 = v100;
      }
      else
      {
        v59 = 0;
        v62 = +[_DPLog service];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_100057F70(v62, v63, v64, v65, v66, v67, v68, v69);
        }

        if (a5)
        {
          *a5 = +[_DPDediscoError errorWithCode:102 description:@"Unable to get valid signature for payload."];
        }
        v70 = [v8 key];
        if (v12) {
          unsigned __int8 v71 = 1;
        }
        else {
          unsigned __int8 v71 = +[_DPDeviceInfo isInternalBuild];
        }
        v38 = 0;
        LOBYTE(v89) = v71;
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v70, 4, 0, 0, 409, @"Failed to obtain signature for payload", 0x100000001, v89);
        int v85 = 1;
        v51 = v100;
      }

      BOOL v40 = v85 == 0;
      v22 = v94;
      id v9 = v104;
      goto LABEL_101;
    }
    id v23 = v98;
    if (v52) {
      sub_100057EEC(v8);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_100057EC0();
    }
    id v106 = 0;
    v96 = +[_DPDAPPayloadEncoder encoderForDonation:v8 keys:v22 error:&v106];
    id v53 = v106;
    v91 = v53;
    if (v53)
    {
      v54 = v53;
      id v55 = [v8 key];
      v56 = [v54 localizedDescription];
      if (v12) {
        unsigned __int8 v57 = 1;
      }
      else {
        unsigned __int8 v57 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v89) = v57;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:v55 eventPhase:4 uuid:0 succeeded:0 errorCode:413 errorMessage:v56 aggregateFunction:0x100000001 count:v89 telemetryAllowed:v91];
    }
    else
    {
      if (v12) {
        uint64_t v72 = 1;
      }
      else {
        uint64_t v72 = (uint64_t)+[_DPDeviceInfo isInternalBuild];
      }
      id v55 = [(_DPDediscoSubmissionManager *)self uploadDAPPayload:v100 withEncoder:v96 withKeys:v22 useOHTTP:1 telemetryAllowed:v72];
      v86 = +[_DPLog service];
      v87 = v86;
      if (!v55)
      {
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Payload submission was successful via OHTTP", buf, 2u);
        }

        BOOL v40 = 1;
        goto LABEL_79;
      }
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        sub_100057E58();
      }

      if (a5)
      {
        id v55 = v55;
        BOOL v40 = 0;
        *a5 = v55;
        goto LABEL_79;
      }
    }
    BOOL v40 = 0;
LABEL_79:
    v38 = 0;
    v51 = v100;

LABEL_101:
LABEL_102:

LABEL_103:
    id v15 = v103;
    goto LABEL_104;
  }
  v25 = +[_DPLog service];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100057C84();
  }

  if (a5) {
    *a5 = v15;
  }
  id v20 = [v8 key];
  if (v12) {
    unsigned __int8 v26 = 1;
  }
  else {
    unsigned __int8 v26 = +[_DPDeviceInfo isInternalBuild];
  }
  LOBYTE(v89) = v26;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v20, 4, 0, 0, 401, @"Failed to download config file from server", 0x100000001, v89);
  BOOL v40 = 0;
LABEL_104:

  return v40;
}

- (id)serializePayload:(id)a3 error:(id *)a4
{
  return [a3 serializeAndReturnError:a4];
}

- (id)payloadForDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 destinationPublicKey];
  v11 = [v8 share1];
  uint64_t v12 = [(_DPDediscoSubmissionManager *)self encryptWithKey:v10 data:v11];

  v13 = [v9 facilitatorPublicKey];
  v14 = [v8 share2];
  id v15 = [(_DPDediscoSubmissionManager *)self encryptWithKey:v13 data:v14];

  v16 = [v8 metadata];
  v17 = [v16 objectForKeyedSubscript:@"telemetryAllowed"];
  unsigned __int8 v18 = [v17 BOOLValue];

  BOOL v52 = (void *)v12;
  if (v12 && v15)
  {
    uint64_t v19 = [v8 key];
    if (([v19 hasPrefix:@"pfl:"] & 1) == 0
      && ([v19 hasPrefix:@"fedstats:"] & 1) == 0)
    {
      uint64_t v20 = +[NSString stringWithFormat:@"fedstats:%@", v19];

      uint64_t v19 = (void *)v20;
    }
    v21 = [v8 metadata];
    v22 = [v21 objectForKeyedSubscript:kDPMetadataAlgorithmParameters];

    id v53 = 0;
    uint64_t v23 = [(_DPDediscoSubmissionManager *)self serializeOtherParamsWithMetadata:v22 error:&v53];
    id v50 = v9;
    id v51 = v53;
    if (v51)
    {
      v48 = (void *)v23;
      unsigned __int8 v24 = +[_DPLog service];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000581A4();
      }

      if (a5) {
        *a5 = v51;
      }
      v25 = [v8 key];
      if (v18) {
        unsigned __int8 v26 = 1;
      }
      else {
        unsigned __int8 v26 = +[_DPDeviceInfo isInternalBuild];
      }
      LOBYTE(v43) = v26;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v25, 4, 0, 0, 404, @"Failed to serialize otherParams for Dedisco V1", 0x100000001, v43);
      uint64_t v36 = 0;
      BOOL v40 = v48;
    }
    else
    {
      v46 = [_DPDediscoPayload alloc];
      v25 = [v8 serverAlgorithm];
      uint64_t v37 = [(_DPDediscoSubmissionManager *)self algorithmParamsForDonation:v8 dediscoOtherParams:v23];
      v47 = [v9 facilitatorPublicKey];
      v38 = [(_DPDediscoSubmissionManager *)self base64PublicKeyRepresentationFromSecKeyRef:v47];
      id v45 = [v9 destinationPublicKey];
      [(_DPDediscoSubmissionManager *)self base64PublicKeyRepresentationFromSecKeyRef:v45];
      unsigned __int8 v44 = v49 = v15;
      unsigned __int8 v39 = [v8 metadata];
      [v39 objectForKeyedSubscript:kDPMetadataVersionHash];
      v41 = BOOL v40 = (void *)v23;
      uint64_t v36 = [(_DPDediscoPayload *)v46 initWithCollectionId:v19 algorithm:v25 algorithmParameters:v37 fsEncryptedShare:v49 dsEncryptedShare:v52 fsPublicKey:v38 dsPublicKey:v44 versionHash:v41 report:0];

      id v15 = v49;
    }

    id v9 = v50;
  }
  else
  {
    uint64_t v27 = +[_DPLog service];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10005820C(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    if (a5)
    {
      *a5 = +[_DPDediscoError errorWithCode:100 description:@"Unable to encrypt shares."];
    }
    uint64_t v19 = [v8 key];
    if (v18) {
      unsigned __int8 v35 = 1;
    }
    else {
      unsigned __int8 v35 = +[_DPDeviceInfo isInternalBuild];
    }
    LOBYTE(v43) = v35;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v19, 4, 0, 0, 403, @"Failed to encrypt shares for Dedisco V1", 0x100000001, v43);
    uint64_t v36 = 0;
  }

  return v36;
}

- (id)algorithmParamsForDonation:(id)a3 dediscoOtherParams:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 algorithmParameters];
  id v8 = [v7 objectForKeyedSubscript:@"epsilon"];

  id v9 = [_DPDediscoAlgorithmParameters alloc];
  id v10 = [v6 dimension];

  [v8 doubleValue];
  if (v5) {
    v11 = -[_DPDediscoAlgorithmParameters initWithDimension:epsilon:otherParams:](v9, "initWithDimension:epsilon:otherParams:", v10, v5);
  }
  else {
    v11 = -[_DPDediscoAlgorithmParameters initWithDimension:epsilon:](v9, "initWithDimension:epsilon:", v10);
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)serializeOtherParamsWithMetadata:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_20;
  }
  uint64_t v7 = kDPMetadataAlgoParamCurrentCohortSize;
  id v8 = [v5 objectForKeyedSubscript:kDPMetadataAlgoParamCurrentCohortSize];

  uint64_t v9 = kDPMetadataAlgoParamPiRapporPrime;
  id v10 = [v6 objectForKeyedSubscript:kDPMetadataAlgoParamPiRapporPrime];

  if (v8)
  {
    v11 = [v6 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = kDPMetadataAlgoParamSigma;
      v13 = [v6 objectForKeyedSubscript:kDPMetadataAlgoParamSigma];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = [v6 objectForKeyedSubscript:v7];
        id v16 = [v15 longLongValue];

        v17 = [v6 objectForKeyedSubscript:v12];
        [v17 doubleValue];
        double v19 = v18;

        uint64_t v20 = [[_DPDediscoAlgorithmParametersOtherParams alloc] initWithCohortSize:v16 sigma:v19];
LABEL_6:
        v21 = v20;
        v22 = [(_DPDediscoAlgorithmParametersOtherParams *)v20 serializeAndReturnError:a4];

        goto LABEL_21;
      }
    }
    else
    {
    }
    if (a4)
    {
      CFStringRef v37 = @"Malformed key for parameters in moments accountant.";
LABEL_19:
      +[_DPDediscoError errorWithCode:101 description:v37];
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v23 = [v6 objectForKeyedSubscript:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v24 = kDPMetadataAlgoParamPiRapporAlpha0;
  v25 = [v6 objectForKeyedSubscript:kDPMetadataAlgoParamPiRapporAlpha0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v26 = kDPMetadataAlgoParamPiRapporAlpha1;
  uint64_t v27 = [v6 objectForKeyedSubscript:kDPMetadataAlgoParamPiRapporAlpha1];
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();

  if (v28)
  {
    uint64_t v29 = [v6 objectForKeyedSubscript:v9];
    id v30 = [v29 unsignedIntValue];

    uint64_t v31 = [v6 objectForKeyedSubscript:v24];
    [v31 doubleValue];
    double v33 = v32;

    uint64_t v34 = [v6 objectForKeyedSubscript:v26];
    [v34 doubleValue];
    double v36 = v35;

    uint64_t v20 = [[_DPDediscoAlgorithmParametersOtherParams alloc] initWithPiRapporPrime:v30 piRapporAlpha0:v33 piRapporAlpha1:v36];
    goto LABEL_6;
  }
LABEL_17:
  if (a4)
  {
    CFStringRef v37 = @"Malformed key for parameters in Pi-Rappor.";
    goto LABEL_19;
  }
LABEL_20:
  v22 = 0;
LABEL_21:

  return v22;
}

- (id)baaCertificateChainFromBAASignature:(id)a3
{
  id v3 = a3;
  v4 = [_DPBAACertificateChain alloc];
  id v5 = [v3 intermediateCertificate];
  id v6 = [v3 leafCertificate];

  uint64_t v7 = [(_DPBAACertificateChain *)v4 initWithIntermediateCertificate:v5 leafCertificate:v6];
  return v7;
}

- (id)signPayloadData:(id)a3
{
  return +[_DPBAACertificateManager signWithDeviceIdentity:a3];
}

- (id)uploadSerializedPayload:(id)a3 baaCertificateChain:(id)a4 baaSignature:(id)a5 options:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  v13 = [v12 submitSyncronouslyWithSerializedPayload:v11 baaCertificateChain:v10 baaSignature:v9 options:a6];

  return v13;
}

- (id)encryptWithKey:(id)a3 data:(id)a4
{
  CFErrorRef error = 0;
  CFDataRef v4 = SecKeyCreateEncryptedData((SecKeyRef)a3, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)a4, &error);
  CFErrorRef v5 = error;
  if (!v4)
  {
    id v6 = +[_DPLog service];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100058284();
    }
  }
  return v4;
}

- (id)base64PublicKeyRepresentationFromSecKeyRef:(id)a3
{
  CFErrorRef error = 0;
  CFDataRef v3 = SecKeyCopyExternalRepresentation((SecKeyRef)a3, &error);
  CFErrorRef v4 = error;
  if (!v3)
  {
    CFErrorRef v5 = +[_DPLog service];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000582EC();
    }
  }
  id v6 = [(__CFData *)v3 base64EncodedStringWithOptions:0];

  return v6;
}

- (id)keysFromConfigurationFile:(id)a3 overrideVerifyDate:(id)a4 dediscoServerNames:(id)a5 error:(id *)a6
{
  return +[_DPDediscoKeyConfiguration keysFromConfiguration:a3 error:a6 overrideVerifyDate:a4];
}

- (id)uploadDAPPayload:(id)a3 withEncoder:(id)a4 withKeys:(id)a5 useOHTTP:(BOOL)a6 telemetryAllowed:(BOOL)a7
{
  id v8 = a3;
  id v9 = +[_DPLog service];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100058354(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  v17 = [v8 getCollectionId];
  LOBYTE(v21) = a7;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v17, 4, 0, 1, 400, 0, 0x100000001, v21);

  double v18 = [v8 getCollectionId];

  LOBYTE(v22) = a7;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v18, 5, 0, 0, 504, @"Failed to directly upload payload: v1 payload is unsupported", 0x100000001, v22);

  double v19 = +[_DPDediscoError errorWithCode:203 description:@"Failed to directly upload payload: v1 payload is unsupported"];
  return v19;
}

- (_DPDediscoNetworkingService)networkingService
{
  return self->_networkingService;
}

- (void)setNetworkingService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end