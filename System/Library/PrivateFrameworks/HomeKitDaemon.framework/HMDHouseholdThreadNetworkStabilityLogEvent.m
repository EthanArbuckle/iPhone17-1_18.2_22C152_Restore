@interface HMDHouseholdThreadNetworkStabilityLogEvent
- (HMDHouseholdThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 threadNetworkStatusReport:(id)a5 threadNetworkUptime:(unint64_t)a6 threadNetworkDowntime:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 numSessionErrors:(unint64_t)a11;
- (HMDThreadNetworkStatusReport)threadNetworkStatusReport;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numNetworkSignatures;
- (unint64_t)numReadErrors;
- (unint64_t)numReadWrites;
- (unint64_t)numSessionErrors;
- (unint64_t)numStabilityReporters;
- (unint64_t)numWriteErrors;
- (unint64_t)threadNetworkDowntime;
- (unint64_t)threadNetworkUptime;
@end

@implementation HMDHouseholdThreadNetworkStabilityLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)numNetworkSignatures
{
  return self->_numNetworkSignatures;
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

- (unint64_t)numStabilityReporters
{
  return self->_numStabilityReporters;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v46[18] = *MEMORY[0x263EF8340];
  v45[0] = @"numStabilityReporters";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numStabilityReporters](self, "numStabilityReporters"));
  v46[0] = v44;
  v45[1] = @"numAdvertisedBRs";
  v3 = NSNumber;
  v43 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v42 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v43, "numAdvertisedBRs"));
  v46[1] = v42;
  v45[2] = @"numAppleBRs";
  v4 = NSNumber;
  v41 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v40 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v41, "numAppleBRs"));
  v46[2] = v40;
  v45[3] = @"numThirdPartyBRs";
  v5 = NSNumber;
  v39 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v38 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v39, "numThirdPartyBRs"));
  v46[3] = v38;
  v45[4] = @"numThreadNetworks";
  v6 = NSNumber;
  v37 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v36 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v37, "numThreadNetworks"));
  v46[4] = v36;
  v45[5] = @"maxSimuIPPrefixesDetected";
  v7 = NSNumber;
  v35 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v34 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v35, "maxSimuIPPrefixesDetected"));
  v46[5] = v34;
  v45[6] = @"txTotal";
  v8 = NSNumber;
  v33 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v32 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v33, "txTotal"));
  v46[6] = v32;
  v45[7] = @"txSuccess";
  v9 = NSNumber;
  v31 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v30 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v31, "txSuccess"));
  v46[7] = v30;
  v45[8] = @"txDelayAvg";
  v10 = NSNumber;
  v29 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v28 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v29, "txDelayAvg"));
  v46[8] = v28;
  v45[9] = @"rxTotal";
  v11 = NSNumber;
  v27 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v26 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v27, "rxTotal"));
  v46[9] = v26;
  v45[10] = @"rxSuccess";
  v12 = NSNumber;
  v25 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v13 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v25, "rxSuccess"));
  v46[10] = v13;
  v45[11] = @"reportDuration";
  v14 = NSNumber;
  v15 = [(HMDHouseholdThreadNetworkStabilityLogEvent *)self threadNetworkStatusReport];
  v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "reportDuration"));
  v46[11] = v16;
  v45[12] = @"threadNetworkUptime";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkUptime](self, "threadNetworkUptime"));
  v46[12] = v17;
  v45[13] = @"threadNetworkDowntime";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent threadNetworkDowntime](self, "threadNetworkDowntime"));
  v46[13] = v18;
  v45[14] = @"numReadWrites";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v46[14] = v19;
  v45[15] = @"numReadErrors";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v46[15] = v20;
  v45[16] = @"numWriteErrors";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v46[16] = v21;
  v45[17] = @"numSessionErrors";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdThreadNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v46[17] = v22;
  v23 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:18];

  return (NSDictionary *)v23;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.threadnetwork.stability.household";
}

- (HMDHouseholdThreadNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 threadNetworkStatusReport:(id)a5 threadNetworkUptime:(unint64_t)a6 threadNetworkDowntime:(unint64_t)a7 numReadWrites:(unint64_t)a8 numReadErrors:(unint64_t)a9 numWriteErrors:(unint64_t)a10 numSessionErrors:(unint64_t)a11
{
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDHouseholdThreadNetworkStabilityLogEvent;
  v19 = [(HMMHomeLogEvent *)&v22 initWithHomeUUID:a3];
  v20 = v19;
  if (v19)
  {
    v19->_numStabilityReporters = a4;
    objc_storeStrong((id *)&v19->_threadNetworkStatusReport, a5);
    v20->_threadNetworkUptime = a6;
    v20->_threadNetworkDowntime = a7;
    v20->_numReadWrites = a8;
    v20->_numReadErrors = a9;
    v20->_numWriteErrors = a10;
    v20->_numSessionErrors = a11;
  }

  return v20;
}

@end