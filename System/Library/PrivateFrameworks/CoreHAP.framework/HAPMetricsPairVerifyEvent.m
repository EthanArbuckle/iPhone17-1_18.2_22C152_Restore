@interface HAPMetricsPairVerifyEvent
- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 connectionEstablishedUsing:(id)a7 pvError:(id)a8;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)linkType;
- (NSString)accessoryIdentifier;
- (NSString)connectionEstablishedUsing;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (NSString)reason;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)durationInMS;
@end

@implementation HAPMetricsPairVerifyEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEstablishedUsing, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_linkType, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

- (NSString)connectionEstablishedUsing
{
  return self->_connectionEstablishedUsing;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)durationInMS
{
  return self->_durationInMS;
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS") / 0x3E8);
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HAPMetricsPairVerifyEvent durationInMS](self, "durationInMS"));
  [v3 setObject:v5 forKeyedSubscript:@"durationInMS"];

  v6 = [(HAPMetricsPairVerifyEvent *)self linkType];
  [v3 setObject:v6 forKeyedSubscript:@"linkType"];

  v7 = [(HAPMetricsPairVerifyEvent *)self reason];
  [v3 setObject:v7 forKeyedSubscript:@"reason"];

  v8 = [(HAPMetricsPairVerifyEvent *)self connectionEstablishedUsing];
  [v3 setObject:v8 forKeyedSubscript:@"connection"];

  v9 = (void *)[v3 copy];

  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.pairverify";
}

- (NSString)description
{
  id v3 = NSString;
  v4 = [(HAPMetricsPairVerifyEvent *)self accessoryIdentifier];
  v5 = [(HAPMetricsPairVerifyEvent *)self linkType];
  unint64_t v6 = [(HAPMetricsPairVerifyEvent *)self durationInMS];
  v7 = [(HAPMetricsPairVerifyEvent *)self reason];
  v8 = [(HAPMetricsPairVerifyEvent *)self connectionEstablishedUsing];
  v9 = [(HMMLogEvent *)self error];
  v10 = [v3 stringWithFormat:@"HAPMetricsPairVerifyEvent - Accessory Identifier: %@, linkType: %@, duration: %lu ms, reason: %@, connection Established: %@ error: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 connectionEstablishedUsing:(id)a7 pvError:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HAPMetricsPairVerifyEvent;
  v19 = [(HMMLogEvent *)&v25 init];
  if (v19)
  {
    uint64_t v20 = [v14 identifier];
    accessoryIdentifier = v19->_accessoryIdentifier;
    v19->_accessoryIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_linkType, a4);
    v19->_durationInMS = a5;
    uint64_t v22 = [v16 copy];
    reason = v19->_reason;
    v19->_reason = (NSString *)v22;

    objc_storeStrong((id *)&v19->_connectionEstablishedUsing, a7);
    [(HMMLogEvent *)v19 setError:v18];
  }

  return v19;
}

@end