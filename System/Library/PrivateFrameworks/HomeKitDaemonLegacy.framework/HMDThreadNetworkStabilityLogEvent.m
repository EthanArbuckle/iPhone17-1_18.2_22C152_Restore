@interface HMDThreadNetworkStabilityLogEvent
- (HMDThreadNetworkStabilityLogEvent)initWithDictionary:(id)a3;
- (HMDThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 threadNetworkStatusReport:(id)a4 threadNetworkUptime:(unint64_t)a5 threadNetworkDowntime:(unint64_t)a6 numReadWrites:(unint64_t)a7 numReadErrors:(unint64_t)a8 numWriteErrors:(unint64_t)a9 topReadWriteError:(id)a10 topSessionError:(id)a11 numSessionErrors:(unint64_t)a12 logTriggerReason:(id)a13;
- (HMDThreadNetworkStatusReport)threadNetworkStatusReport;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)logTriggerReason;
- (NSString)topReadWriteError;
- (NSString)topSessionError;
- (id)serializedLogEvent;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numReadErrors;
- (unint64_t)numReadWrites;
- (unint64_t)numSessionErrors;
- (unint64_t)numWriteErrors;
- (unint64_t)threadNetworkDowntime;
- (unint64_t)threadNetworkUptime;
@end

@implementation HMDThreadNetworkStabilityLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logTriggerReason, 0);
  objc_storeStrong((id *)&self->_topSessionError, 0);
  objc_storeStrong((id *)&self->_topReadWriteError, 0);
  objc_storeStrong((id *)&self->_threadNetworkStatusReport, 0);
}

- (NSString)logTriggerReason
{
  return self->_logTriggerReason;
}

- (NSString)topSessionError
{
  return self->_topSessionError;
}

- (NSString)topReadWriteError
{
  return self->_topReadWriteError;
}

- (unint64_t)numSessionErrors
{
  return self->_numSessionErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)threadNetworkDowntime
{
  return self->_threadNetworkDowntime;
}

- (unint64_t)threadNetworkUptime
{
  return self->_threadNetworkUptime;
}

- (HMDThreadNetworkStatusReport)threadNetworkStatusReport
{
  return self->_threadNetworkStatusReport;
}

- (id)serializedLogEvent
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMMHomeLogEvent *)self homeUUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"homeUUID"];

  v5 = NSNumber;
  v6 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "numAdvertisedBRs"));
  [v3 setObject:v7 forKeyedSubscript:@"numAdvertisedBRs"];

  v8 = NSNumber;
  v9 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "numAppleBRs"));
  [v3 setObject:v10 forKeyedSubscript:@"numAppleBRs"];

  v11 = NSNumber;
  v12 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "numThirdPartyBRs"));
  [v3 setObject:v13 forKeyedSubscript:@"numThirdPartyBRs"];

  v14 = NSNumber;
  v15 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "numThreadNetworks"));
  [v3 setObject:v16 forKeyedSubscript:@"numThreadNetworks"];

  v17 = NSNumber;
  v18 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "maxSimuIPPrefixesDetected"));
  [v3 setObject:v19 forKeyedSubscript:@"maxSimuIPPrefixesDetected"];

  v20 = NSNumber;
  v21 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "txTotal"));
  [v3 setObject:v22 forKeyedSubscript:@"txTotal"];

  v23 = NSNumber;
  v24 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "txSuccess"));
  [v3 setObject:v25 forKeyedSubscript:@"txSuccess"];

  v26 = NSNumber;
  v27 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v28 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "txDelayAvg"));
  [v3 setObject:v28 forKeyedSubscript:@"txDelayAvg"];

  v29 = NSNumber;
  v30 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "rxTotal"));
  [v3 setObject:v31 forKeyedSubscript:@"rxTotal"];

  v32 = NSNumber;
  v33 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "rxSuccess"));
  [v3 setObject:v34 forKeyedSubscript:@"rxSuccess"];

  v35 = NSNumber;
  v36 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "reportDuration"));
  [v3 setObject:v37 forKeyedSubscript:@"reportDuration"];

  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  [v3 setObject:v38 forKeyedSubscript:@"threadNetworkUptime"];

  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  [v3 setObject:v39 forKeyedSubscript:@"threadNetworkDowntime"];

  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  [v3 setObject:v40 forKeyedSubscript:@"numReadWrites"];

  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  [v3 setObject:v41 forKeyedSubscript:@"numReadErrors"];

  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  [v3 setObject:v42 forKeyedSubscript:@"numWriteErrors"];

  v43 = [(HMDThreadNetworkStabilityLogEvent *)self topReadWriteError];
  [v3 setObject:v43 forKeyedSubscript:@"topReadWriteError"];

  v44 = [(HMDThreadNetworkStabilityLogEvent *)self topSessionError];
  [v3 setObject:v44 forKeyedSubscript:@"topSessionError"];

  v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  [v3 setObject:v45 forKeyedSubscript:@"numSessionErrors"];

  v46 = [(HMDThreadNetworkStabilityLogEvent *)self logTriggerReason];
  [v3 setObject:v46 forKeyedSubscript:@"logTriggerReason"];

  v47 = (void *)[v3 copy];
  return v47;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v48[20] = *MEMORY[0x1E4F143B8];
  v47[0] = @"numAdvertisedBRs";
  v3 = NSNumber;
  v46 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v45 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v46, "numAdvertisedBRs"));
  v48[0] = v45;
  v47[1] = @"numAppleBRs";
  v4 = NSNumber;
  v44 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v43 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v44, "numAppleBRs"));
  v48[1] = v43;
  v47[2] = @"numThirdPartyBRs";
  v5 = NSNumber;
  v42 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v41 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v42, "numThirdPartyBRs"));
  v48[2] = v41;
  v47[3] = @"numThreadNetworks";
  v6 = NSNumber;
  v40 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v39 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v40, "numThreadNetworks"));
  v48[3] = v39;
  v47[4] = @"maxSimuIPPrefixesDetected";
  v7 = NSNumber;
  v38 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v37 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v38, "maxSimuIPPrefixesDetected"));
  v48[4] = v37;
  v47[5] = @"txTotal";
  v8 = NSNumber;
  v36 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v35 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v36, "txTotal"));
  v48[5] = v35;
  v47[6] = @"txSuccess";
  v9 = NSNumber;
  v34 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v33 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v34, "txSuccess"));
  v48[6] = v33;
  v47[7] = @"txDelayAvg";
  v10 = NSNumber;
  v32 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v31 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v32, "txDelayAvg"));
  v48[7] = v31;
  v47[8] = @"rxTotal";
  v11 = NSNumber;
  v30 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v29 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v30, "rxTotal"));
  v48[8] = v29;
  v47[9] = @"rxSuccess";
  v12 = NSNumber;
  v28 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v27 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v28, "rxSuccess"));
  v48[9] = v27;
  v47[10] = @"reportDuration";
  v13 = NSNumber;
  v26 = [(HMDThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v14 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v26, "reportDuration"));
  v48[10] = v14;
  v47[11] = @"threadNetworkUptime";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  v48[11] = v15;
  v47[12] = @"threadNetworkDowntime";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  v48[12] = v16;
  v47[13] = @"numReadWrites";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v48[13] = v17;
  v47[14] = @"numReadErrors";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v48[14] = v18;
  v47[15] = @"numWriteErrors";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v48[15] = v19;
  v47[16] = @"topReadWriteError";
  v20 = [(HMDThreadNetworkStabilityLogEvent *)self topReadWriteError];
  v48[16] = v20;
  v47[17] = @"topSessionError";
  v21 = [(HMDThreadNetworkStabilityLogEvent *)self topSessionError];
  v48[17] = v21;
  v47[18] = @"numSessionErrors";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v48[18] = v22;
  v47[19] = @"logTriggerReason";
  v23 = [(HMDThreadNetworkStabilityLogEvent *)self logTriggerReason];
  v48[19] = v23;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:20];

  return (NSDictionary *)v25;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.threadnetwork.stability";
}

- (HMDThreadNetworkStabilityLogEvent)initWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"homeUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v72 = v6;
  if (v6) {
    v88 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    v88 = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"numAdvertisedBRs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v87 = v8;

  v9 = [v3 objectForKeyedSubscript:@"numAppleBRs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v78 = v10;

  v11 = [v3 objectForKeyedSubscript:@"numThirdPartyBRs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v77 = v12;

  v13 = [v3 objectForKeyedSubscript:@"numThreadNetworks"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v76 = v14;

  v15 = [v3 objectForKeyedSubscript:@"maxSimuIPPrefixesDetected"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v71 = v16;

  v17 = [v3 objectForKeyedSubscript:@"txTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v80 = v18;

  v19 = [v3 objectForKeyedSubscript:@"txSuccess"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v84 = v20;

  v21 = [v3 objectForKeyedSubscript:@"txDelayAvg"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v86 = v22;

  v23 = [v3 objectForKeyedSubscript:@"rxTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  v26 = [v3 objectForKeyedSubscript:@"rxSuccess"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v85 = v27;

  v28 = [v3 objectForKeyedSubscript:@"reportDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v29 = v28;
  }
  else {
    v29 = 0;
  }
  id v30 = v29;

  v31 = [v3 objectForKeyedSubscript:@"threadNetworkUptime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v32 = v31;
  }
  else {
    v32 = 0;
  }
  id v83 = v32;

  v33 = [v3 objectForKeyedSubscript:@"threadNetworkDowntime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v34 = v33;
  }
  else {
    v34 = 0;
  }
  id v82 = v34;

  v35 = [v3 objectForKeyedSubscript:@"numReadWrites"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }
  id v81 = v36;

  v37 = [v3 objectForKeyedSubscript:@"numReadErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v38 = v37;
  }
  else {
    v38 = 0;
  }
  id v75 = v38;

  v39 = [v3 objectForKeyedSubscript:@"numWriteErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v40 = v39;
  }
  else {
    v40 = 0;
  }
  id v74 = v40;

  v41 = [v3 objectForKeyedSubscript:@"topReadWriteError"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v42 = v41;
  }
  else {
    v42 = 0;
  }
  id v43 = v42;

  v44 = [v3 objectForKeyedSubscript:@"topSessionError"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v45 = v44;
  }
  else {
    v45 = 0;
  }
  id v73 = v45;

  v46 = [v3 objectForKeyedSubscript:@"numSessionErrors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v47 = v46;
  }
  else {
    v47 = 0;
  }
  id v48 = v47;

  v49 = [v3 objectForKeyedSubscript:@"logTriggerReason"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v50 = v49;
  }
  else {
    v50 = 0;
  }
  id v68 = v50;

  v51 = 0;
  v69 = v30;
  v70 = v25;
  if (!v88 || !v87)
  {
    v62 = v71;
    v60 = v80;
    v55 = v74;
    v52 = v75;
    v59 = v73;
    v58 = v68;
    goto LABEL_94;
  }
  v52 = v75;
  if (!v78
    || !v77
    || !v76
    || !v71
    || !v80
    || !v84
    || !v86
    || !v25
    || !v85
    || !v30
    || !v83
    || !v82
    || !v81
    || !v75
    || !v74
    || !v43)
  {
    v55 = v74;
    v59 = v73;
    goto LABEL_92;
  }
  if (!v73 || !v48)
  {
    v55 = v74;
    v59 = v73;
LABEL_92:
    v58 = v68;
    goto LABEL_93;
  }
  if (!v68)
  {
    v55 = v74;
    v52 = v75;
    v58 = 0;
    v59 = v73;
LABEL_93:
    v51 = 0;
    v62 = v71;
    v60 = v80;
    goto LABEL_94;
  }
  v53 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", [v87 unsignedIntValue], objc_msgSend(v78, "unsignedIntValue"), objc_msgSend(v77, "unsignedIntValue"), objc_msgSend(v76, "unsignedIntValue"), objc_msgSend(v71, "unsignedIntValue"), objc_msgSend(v80, "unsignedIntValue"), objc_msgSend(v84, "unsignedIntValue"), objc_msgSend(v86, "unsignedIntValue"), objc_msgSend(v25, "unsignedIntValue"), objc_msgSend(v85, "unsignedIntValue"), objc_msgSend(v30, "unsignedIntValue"));
  uint64_t v54 = [v83 unsignedIntValue];
  uint64_t v67 = [v82 unsignedIntValue];
  uint64_t v66 = [v81 unsignedIntValue];
  v52 = v75;
  uint64_t v65 = [v75 unsignedIntValue];
  v55 = v74;
  uint64_t v56 = [v74 unsignedIntValue];
  unsigned int v57 = [v48 unsignedIntValue];
  v58 = v68;
  v59 = v73;
  uint64_t v64 = v56;
  v60 = v80;
  uint64_t v61 = v54;
  v62 = v71;
  v51 = [(HMDThreadNetworkStabilityLogEvent *)self initWithHomeUUID:v88 threadNetworkStatusReport:v53 threadNetworkUptime:v61 threadNetworkDowntime:v67 numReadWrites:v66 numReadErrors:v65 numWriteErrors:v64 topReadWriteError:v43 topSessionError:v73 numSessionErrors:v57 logTriggerReason:v68];

  self = v51;
LABEL_94:

  return v51;
}

- (HMDThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 threadNetworkStatusReport:(id)a4 threadNetworkUptime:(unint64_t)a5 threadNetworkDowntime:(unint64_t)a6 numReadWrites:(unint64_t)a7 numReadErrors:(unint64_t)a8 numWriteErrors:(unint64_t)a9 topReadWriteError:(id)a10 topSessionError:(id)a11 numSessionErrors:(unint64_t)a12 logTriggerReason:(id)a13
{
  id v29 = a4;
  id v20 = a10;
  id v21 = a11;
  id v22 = a13;
  v30.receiver = self;
  v30.super_class = (Class)HMDThreadNetworkStabilityLogEvent;
  v23 = [(HMMHomeLogEvent *)&v30 initWithHomeUUID:a3];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_threadNetworkStatusReport, a4);
    v24->_threadNetworkUptime = a5;
    v24->_threadNetworkDowntime = a6;
    v24->_numReadWrites = a7;
    v24->_numReadErrors = a8;
    v24->_numWriteErrors = a9;
    if (v20) {
      id v25 = (__CFString *)[v20 copy];
    }
    else {
      id v25 = @"<NO ERROR>";
    }
    objc_storeStrong((id *)&v24->_topReadWriteError, v25);
    if (v20) {

    }
    if (v21) {
      v26 = (__CFString *)[v21 copy];
    }
    else {
      v26 = @"<NO ERROR>";
    }
    objc_storeStrong((id *)&v24->_topSessionError, v26);
    if (v21) {

    }
    v24->_numSessionErrors = a12;
    if (v22) {
      v27 = (__CFString *)[v22 copy];
    }
    else {
      v27 = @"Periodic Snapshot";
    }
    objc_storeStrong((id *)&v24->_logTriggerReason, v27);
    if (v22) {
  }
    }
  return v24;
}

@end