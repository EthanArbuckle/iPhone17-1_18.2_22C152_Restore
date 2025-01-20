@interface _DPDediscoSubmissionManagerV2
- (_DPDediscoSubmissionManagerV2)init;
- (id)keysFromConfigurationFile:(id)a3 overrideVerifyDate:(id)a4 dediscoServerNames:(id)a5 error:(id *)a6;
- (id)payloadEncoderForDonation:(id)a3 keys:(id)a4 error:(id *)a5;
- (id)payloadForDonation:(id)a3 keys:(id)a4 error:(id *)a5;
- (id)uploadDAPPayload:(id)a3 withEncoder:(id)a4 withKeys:(id)a5 useOHTTP:(BOOL)a6 telemetryAllowed:(BOOL)a7;
@end

@implementation _DPDediscoSubmissionManagerV2

- (_DPDediscoSubmissionManagerV2)init
{
  v3 = +[NSURL URLWithString:@"https://unlinkability.apple.com/config/global-dap-ppm-config.plist"];
  v4 = [[_DPDediscoNetworkingService alloc] initWithDomain:@"https://unlinkability.apple.com" configurationURL:v3];
  v5 = [(_DPDediscoSubmissionManager *)self initWithNetworkingService:v4];

  return v5;
}

- (id)payloadEncoderForDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Expected v2 key configurations." userInfo:0];
    objc_exception_throw(v14);
  }
  v9 = +[_DPDAPPayloadEncoder encoderForDonation:v7 keys:v8 error:a5];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [v7 key];
    LOBYTE(v15) = [v7 isTelemetryAllowed];
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v12, 4, 0, 0, 405, @"Failed to create payload encoder for Dedisco V2", 0x100000001, v15);
  }
  return v10;
}

- (id)payloadForDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(_DPDediscoSubmissionManagerV2 *)self payloadEncoderForDonation:v8 keys:a4 error:a5];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 dediscoPayloadWithError:a5];
    if (v11) {
      goto LABEL_6;
    }
    v12 = [v8 key];
    LOBYTE(v14) = [v8 isTelemetryAllowed];
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v12, 4, 0, 0, 406, @"Failed to create payload for Dedisco V2", 0x100000001, v14);
  }
  else
  {
    v12 = [v8 key];
    LOBYTE(v14) = [v8 isTelemetryAllowed];
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v12, 4, 0, 0, 406, @"Failed to create DAP payload encoder", 0x100000001, v14);
    id v11 = 0;
  }

LABEL_6:
  return v11;
}

- (id)keysFromConfigurationFile:(id)a3 overrideVerifyDate:(id)a4 dediscoServerNames:(id)a5 error:(id *)a6
{
  return +[_DPDediscoKeyConfigurationV2 keysFromConfiguration:a3 dediscoServerNames:a5 error:a6 overrideVerifyDate:a4];
}

- (id)uploadDAPPayload:(id)a3 withEncoder:(id)a4 withKeys:(id)a5 useOHTTP:(BOOL)a6 telemetryAllowed:(BOOL)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  v13 = [a5 leaderURL];
  id v14 = [v13 length];
  uint64_t v15 = +[_DPLog service];
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = "OFF";
      if (v8) {
        v17 = "ON";
      }
      *(_DWORD *)buf = 138412546;
      v38 = v13;
      __int16 v39 = 2080;
      v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Uploading DAP payload to %@, OHTTP:%s", buf, 0x16u);
    }

    v18 = [v11 getCollectionId];
    LOBYTE(v32) = a7;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v18, 4, 0, 1, 400, 0, 0x100000001, v32);

    v19 = [[_DPDediscoPayloadUploader alloc] initWithBaseURL:v13 useOHTTP:v8];
    v20 = [(_DPDediscoPayloadUploader *)v19 uploadPayload:v11 withEncoder:v12];
    v21 = v20;
    if (v20)
    {
      id v22 = [v20 code];
      v23 = [v11 getCollectionId];
      v24 = [v21 localizedDescription];
      LOBYTE(v33) = a7;
      if (v22 == (id)801) {
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v23, 5, 0, 0, 410, v24, 0x100000001, v33);
      }
      else {
        +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v23, 5, 0, 0, 503, v24, 0x100000001, v33);
      }
    }
    else
    {
      v26 = +[_DPCoreAnalyticsCollector sharedInstance];
      uint64_t v34 = _DPCoreAnalyticsEvent_PhaseCount;
      v36[0] = &off_1000798B8;
      v35[0] = _DPCoreAnalyticsField_Phase;
      v35[1] = _DPCoreAnalyticsField_TaskName;
      [v11 getCollectionId];
      v28 = id v27 = v12;
      v36[1] = v28;
      v36[2] = &__kCFBooleanTrue;
      v35[2] = _DPCoreAnalyticsField_Status;
      v35[3] = _DPCoreAnalyticsField_Counts;
      v36[3] = &off_1000798D0;
      v29 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
      [v26 reportMetricsForEvent:v34 withMetrics:v29];

      id v12 = v27;
      v23 = [v11 getCollectionId];
      if (v8) {
        uint64_t v30 = 501;
      }
      else {
        uint64_t v30 = 500;
      }
      LOBYTE(v33) = a7;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v23, 5, 0, 1, v30, 0, 0x100000001, v33);
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100056E50(v16);
    }

    v25 = [v11 getCollectionId];
    LOBYTE(v32) = a7;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v25, 4, 0, 0, 414, @"Failed to upload DAP payload: leader URL is empty", 0x100000001, v32);

    v21 = +[_DPDediscoError errorWithCode:202 description:@"Failed to upload DAP payload: leader URL is empty"];
  }

  return v21;
}

@end