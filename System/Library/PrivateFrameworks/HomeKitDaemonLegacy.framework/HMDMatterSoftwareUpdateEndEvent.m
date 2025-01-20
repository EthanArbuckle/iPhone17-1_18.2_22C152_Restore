@interface HMDMatterSoftwareUpdateEndEvent
- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
- (HMDMatterSoftwareUpdateEndEvent)initWithAccessory:(id)a3 linkType:(id)a4 accessorySoftwareVersionNumber:(id)a5 updateSoftwareVersionNumber:(id)a6 error:(id)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSMutableDictionary)vendorDetailsForCoreAnalytics;
- (NSNumber)accessoryFirmwareVersionNumber;
- (NSNumber)accessoryLinkType;
- (NSNumber)accessoryProductID;
- (NSNumber)accessoryVendorID;
- (NSNumber)targetFirmwareVersionNumber;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setVendorDetailsForCoreAnalytics:(id)a3;
@end

@implementation HMDMatterSoftwareUpdateEndEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_targetFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_accessoryVendorID, 0);
  objc_storeStrong((id *)&self->_accessoryProductID, 0);
  objc_storeStrong((id *)&self->_accessoryLinkType, 0);
}

- (void)setVendorDetailsForCoreAnalytics:(id)a3
{
}

- (NSMutableDictionary)vendorDetailsForCoreAnalytics
{
  return self->_vendorDetailsForCoreAnalytics;
}

- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  return self->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
}

- (NSNumber)targetFirmwareVersionNumber
{
  return self->_targetFirmwareVersionNumber;
}

- (NSNumber)accessoryFirmwareVersionNumber
{
  return self->_accessoryFirmwareVersionNumber;
}

- (NSNumber)accessoryVendorID
{
  return self->_accessoryVendorID;
}

- (NSNumber)accessoryProductID
{
  return self->_accessoryProductID;
}

- (NSNumber)accessoryLinkType
{
  return self->_accessoryLinkType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDMatterSoftwareUpdateEndEvent *)self accessoryLinkType];
  [v3 setObject:v4 forKeyedSubscript:@"accessoryLinkType"];

  v5 = [(HMDMatterSoftwareUpdateEndEvent *)self accessoryVendorID];
  [v3 setObject:v5 forKeyedSubscript:@"accessoryVendorID"];

  v6 = [(HMDMatterSoftwareUpdateEndEvent *)self accessoryProductID];
  [v3 setObject:v6 forKeyedSubscript:@"accessoryProductID"];

  v7 = [(HMDMatterSoftwareUpdateEndEvent *)self accessoryFirmwareVersionNumber];
  [v3 setObject:v7 forKeyedSubscript:@"currentAccessoryFirmwareVersionNumber"];

  v8 = [(HMDMatterSoftwareUpdateEndEvent *)self targetFirmwareVersionNumber];
  [v3 setObject:v8 forKeyedSubscript:@"targetAccessoryFirmwareVersionNumber"];

  v9 = [(HMMLogEvent *)self error];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
    [v3 setObject:v11 forKeyedSubscript:@"errorCode"];

    v12 = [v10 domain];
    [v3 setObject:v12 forKeyedSubscript:@"errorDomain"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMatterSoftwareUpdateEndEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  [v3 setObject:v13 forKeyedSubscript:@"isAutomaticFirmwareUpdateEnabled"];

  v14 = [(HMDMatterSoftwareUpdateEndEvent *)self vendorDetailsForCoreAnalytics];
  [v3 addEntriesFromDictionary:v14];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.accessoryFirmwareUpdate.matterEndEvent";
}

- (HMDMatterSoftwareUpdateEndEvent)initWithAccessory:(id)a3 linkType:(id)a4 accessorySoftwareVersionNumber:(id)a5 updateSoftwareVersionNumber:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMDMatterSoftwareUpdateEndEvent;
  v17 = [(HMMLogEvent *)&v30 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessoryLinkType, a4);
    v19 = [v12 chipStorage];
    uint64_t v20 = [v19 vendorID];
    accessoryVendorID = v18->_accessoryVendorID;
    v18->_accessoryVendorID = (NSNumber *)v20;

    v22 = [v12 chipStorage];
    uint64_t v23 = [v22 productID];
    accessoryProductID = v18->_accessoryProductID;
    v18->_accessoryProductID = (NSNumber *)v23;

    objc_storeStrong((id *)&v18->_accessoryFirmwareVersionNumber, a5);
    objc_storeStrong((id *)&v18->_targetFirmwareVersionNumber, a6);
    [(HMMLogEvent *)v18 setError:v16];
    v25 = [v12 home];
    v18->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = [v25 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    vendorDetailsForCoreAnalytics = v18->_vendorDetailsForCoreAnalytics;
    v18->_vendorDetailsForCoreAnalytics = (NSMutableDictionary *)v26;

    v28 = [(HMDMatterSoftwareUpdateEndEvent *)v18 vendorDetailsForCoreAnalytics];
    [v12 populateVendorDetailsForCoreAnalytics:v28 keyPrefix:@"accessory"];
  }
  return v18;
}

@end