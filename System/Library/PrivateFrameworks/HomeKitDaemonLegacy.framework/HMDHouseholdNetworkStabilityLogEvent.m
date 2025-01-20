@interface HMDHouseholdNetworkStabilityLogEvent
- (HMDHouseholdNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 WifiAssociations:(unint64_t)a5 wifiDisassociations:(unint64_t)a6 apChanges:(unint64_t)a7 gatewayChanges:(unint64_t)a8 numReadWrites:(unint64_t)a9 numReadErrors:(unint64_t)a10 numWriteErrors:(unint64_t)a11 numSessionErrors:(unint64_t)a12 numNetworkSignatures:(unint64_t)a13;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numAPChanges;
- (unint64_t)numGatewayChanges;
- (unint64_t)numNetworkSignatures;
- (unint64_t)numReadErrors;
- (unint64_t)numReadWrites;
- (unint64_t)numSessionErrors;
- (unint64_t)numStabilityReporters;
- (unint64_t)numWifiAssociations;
- (unint64_t)numWifiDisassociations;
- (unint64_t)numWriteErrors;
@end

@implementation HMDHouseholdNetworkStabilityLogEvent

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

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
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
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"numStabilityReporters";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numStabilityReporters](self, "numStabilityReporters"));
  v16[0] = v14;
  v15[1] = @"numWifiAssociations";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWifiAssociations](self, "numWifiAssociations"));
  v16[1] = v3;
  v15[2] = @"numWifiDisassociations";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWifiDisassociations](self, "numWifiDisassociations"));
  v16[2] = v4;
  v15[3] = @"numWifiAPChanges";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numAPChanges](self, "numAPChanges"));
  v16[3] = v5;
  v15[4] = @"numGatewayChanges";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numGatewayChanges](self, "numGatewayChanges"));
  v16[4] = v6;
  v15[5] = @"numReadWrites";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numReadWrites](self, "numReadWrites"));
  v16[5] = v7;
  v15[6] = @"numReadErrors";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numReadErrors](self, "numReadErrors"));
  v16[6] = v8;
  v15[7] = @"numWriteErrors";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numWriteErrors](self, "numWriteErrors"));
  v16[7] = v9;
  v15[8] = @"numSessionErrors";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numSessionErrors](self, "numSessionErrors"));
  v16[8] = v10;
  v15[9] = @"numNetworkSignatures";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdNetworkStabilityLogEvent numNetworkSignatures](self, "numNetworkSignatures"));
  v16[9] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.network.stability.household";
}

- (HMDHouseholdNetworkStabilityLogEvent)initWithHomeUUID:(id)a3 numStabilityReporters:(unint64_t)a4 WifiAssociations:(unint64_t)a5 wifiDisassociations:(unint64_t)a6 apChanges:(unint64_t)a7 gatewayChanges:(unint64_t)a8 numReadWrites:(unint64_t)a9 numReadErrors:(unint64_t)a10 numWriteErrors:(unint64_t)a11 numSessionErrors:(unint64_t)a12 numNetworkSignatures:(unint64_t)a13
{
  v19.receiver = self;
  v19.super_class = (Class)HMDHouseholdNetworkStabilityLogEvent;
  result = [(HMMHomeLogEvent *)&v19 initWithHomeUUID:a3];
  if (result)
  {
    result->_numStabilityReporters = a4;
    result->_numWifiAssociations = a5;
    result->_numWifiDisassociations = a6;
    result->_numAPChanges = a7;
    result->_numGatewayChanges = a8;
    result->_numReadWrites = a9;
    result->_numReadErrors = a10;
    result->_numWriteErrors = a11;
    result->_numSessionErrors = a12;
    result->_numNetworkSignatures = a13;
  }
  return result;
}

@end