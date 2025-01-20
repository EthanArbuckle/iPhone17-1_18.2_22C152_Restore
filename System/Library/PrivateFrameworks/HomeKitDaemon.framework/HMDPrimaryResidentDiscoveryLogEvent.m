@interface HMDPrimaryResidentDiscoveryLogEvent
- (BOOL)accountMessageNoPrimaryResolved;
- (BOOL)accountMessageSent;
- (BOOL)residentChannelActive;
- (BOOL)residentChannelActiveNoPrimaryResolved;
- (HMDPrimaryResidentDiscoveryLogEvent)initWithHomeUUID:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSError)accountMessageError;
- (NSError)residentChannelActiveResolvePrimaryError;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAccountMessageError:(id)a3;
- (void)setAccountMessageNoPrimaryResolved:(BOOL)a3;
- (void)setAccountMessageSent:(BOOL)a3;
- (void)setResidentChannelActive:(BOOL)a3;
- (void)setResidentChannelActiveNoPrimaryResolved:(BOOL)a3;
- (void)setResidentChannelActiveResolvePrimaryError:(id)a3;
@end

@implementation HMDPrimaryResidentDiscoveryLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountMessageError, 0);
  objc_storeStrong((id *)&self->_residentChannelActiveResolvePrimaryError, 0);
}

- (void)setAccountMessageError:(id)a3
{
}

- (NSError)accountMessageError
{
  return self->_accountMessageError;
}

- (void)setAccountMessageNoPrimaryResolved:(BOOL)a3
{
  self->_accountMessageNoPrimaryResolved = a3;
}

- (BOOL)accountMessageNoPrimaryResolved
{
  return self->_accountMessageNoPrimaryResolved;
}

- (void)setAccountMessageSent:(BOOL)a3
{
  self->_accountMessageSent = a3;
}

- (BOOL)accountMessageSent
{
  return self->_accountMessageSent;
}

- (void)setResidentChannelActiveResolvePrimaryError:(id)a3
{
}

- (NSError)residentChannelActiveResolvePrimaryError
{
  return self->_residentChannelActiveResolvePrimaryError;
}

- (void)setResidentChannelActiveNoPrimaryResolved:(BOOL)a3
{
  self->_residentChannelActiveNoPrimaryResolved = a3;
}

- (BOOL)residentChannelActiveNoPrimaryResolved
{
  return self->_residentChannelActiveNoPrimaryResolved;
}

- (void)setResidentChannelActive:(BOOL)a3
{
  self->_residentChannelActive = a3;
}

- (BOOL)residentChannelActive
{
  return self->_residentChannelActive;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v14[9] = *MEMORY[0x263EF8340];
  v14[0] = &unk_26E473618;
  v13[0] = @"primaryResidentDiscoveryCount";
  v13[1] = @"residentChannelActiveCount";
  if ([(HMDPrimaryResidentDiscoveryLogEvent *)self residentChannelActive]) {
    v3 = &unk_26E473618;
  }
  else {
    v3 = &unk_26E473630;
  }
  v14[1] = v3;
  v13[2] = @"residentChannelActiveBool";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent residentChannelActive](self, "residentChannelActive"));
  v14[2] = v4;
  v13[3] = @"residentChannelActiveNoPrimaryResolvedCount";
  if ([(HMDPrimaryResidentDiscoveryLogEvent *)self residentChannelActiveNoPrimaryResolved])
  {
    v5 = &unk_26E473618;
  }
  else
  {
    v5 = &unk_26E473630;
  }
  v14[3] = v5;
  v13[4] = @"residentChannelActiveNoPrimaryResolvedBool";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent residentChannelActiveNoPrimaryResolved](self, "residentChannelActiveNoPrimaryResolved"));
  v14[4] = v6;
  v13[5] = @"accountMessageCount";
  if ([(HMDPrimaryResidentDiscoveryLogEvent *)self accountMessageSent]) {
    v7 = &unk_26E473618;
  }
  else {
    v7 = &unk_26E473630;
  }
  v14[5] = v7;
  v13[6] = @"accountMessageBool";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent accountMessageSent](self, "accountMessageSent"));
  v14[6] = v8;
  v13[7] = @"accountMessageNoPrimaryResolvedCount";
  if ([(HMDPrimaryResidentDiscoveryLogEvent *)self accountMessageNoPrimaryResolved]) {
    v9 = &unk_26E473618;
  }
  else {
    v9 = &unk_26E473630;
  }
  v14[7] = v9;
  v13[8] = @"accountMessageNoPrimaryResolvedBool";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDPrimaryResidentDiscoveryLogEvent accountMessageNoPrimaryResolved](self, "accountMessageNoPrimaryResolved"));
  v14[8] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:9];

  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.primary.resident.discovery";
}

- (HMDPrimaryResidentDiscoveryLogEvent)initWithHomeUUID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDPrimaryResidentDiscoveryLogEvent;
  v3 = [(HMMHomeLogEvent *)&v8 initWithHomeUUID:a3];
  v4 = v3;
  if (v3)
  {
    v3->_residentChannelActive = 0;
    v3->_residentChannelActiveNoPrimaryResolved = 0;
    residentChannelActiveResolvePrimaryError = v3->_residentChannelActiveResolvePrimaryError;
    v3->_residentChannelActiveResolvePrimaryError = 0;

    v4->_accountMessageSent = 0;
    v4->_accountMessageNoPrimaryResolved = 0;
    accountMessageError = v4->_accountMessageError;
    v4->_accountMessageError = 0;
  }
  return v4;
}

@end