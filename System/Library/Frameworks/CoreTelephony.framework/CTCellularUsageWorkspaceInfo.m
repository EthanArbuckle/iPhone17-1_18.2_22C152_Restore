@interface CTCellularUsageWorkspaceInfo
+ (BOOL)supportsSecureCoding;
- (CTCellularUsageWorkspaceInfo)initWithCoder:(id)a3;
- (CTCellularUsageWorkspaceInfo)initWithSubscriberTag:(id)a3 metaDataForHomeCountry:(id)a4 metaDataForRoaming:(id)a5 billingCycleEndDate:(id)a6 previousBillingCycleDate:(id)a7 billingCycleSupported:(id)a8 carrierSpaceSupported:(id)a9 workspaceName:(id)a10 workspacePath:(id)a11;
- (NSDate)billingCycleEndDate;
- (NSDate)previousBillingCycleDate;
- (NSNumber)billingCycleSupported;
- (NSNumber)carrierSpaceSupported;
- (NSNumber)metaDataForHomeCountry;
- (NSNumber)metaDataForRoaming;
- (NSNumber)subscriberTag;
- (NSString)workspaceName;
- (NSString)workspacePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellularUsageWorkspaceInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularUsageWorkspaceInfo *)self subscriberTag];
  [v3 appendFormat:@", subscriberTag = %@", v4];

  v5 = [(CTCellularUsageWorkspaceInfo *)self metaDataForHomeCountry];
  [v3 appendFormat:@", metaDataForHomeCountry = %@", v5];

  v6 = [(CTCellularUsageWorkspaceInfo *)self metaDataForRoaming];
  [v3 appendFormat:@", metaDataForRoaming = %@", v6];

  v7 = [(CTCellularUsageWorkspaceInfo *)self billingCycleEndDate];
  [v3 appendFormat:@", billingCycleEndDate = %@", v7];

  v8 = [(CTCellularUsageWorkspaceInfo *)self previousBillingCycleDate];
  [v3 appendFormat:@", previousBillingCycleDate = %@", v8];

  v9 = [(CTCellularUsageWorkspaceInfo *)self billingCycleSupported];
  [v3 appendFormat:@", billingCycleSupported = %@", v9];

  v10 = [(CTCellularUsageWorkspaceInfo *)self carrierSpaceSupported];
  [v3 appendFormat:@", carrierSpaceSupported = %@", v10];

  v11 = [(CTCellularUsageWorkspaceInfo *)self workspaceName];
  [v3 appendFormat:@", workspaceName = %@", v11];

  v12 = [(CTCellularUsageWorkspaceInfo *)self workspacePath];
  [v3 appendFormat:@", workspacePath = %@", v12];

  [v3 appendString:@">"];

  return v3;
}

- (CTCellularUsageWorkspaceInfo)initWithSubscriberTag:(id)a3 metaDataForHomeCountry:(id)a4 metaDataForRoaming:(id)a5 billingCycleEndDate:(id)a6 previousBillingCycleDate:(id)a7 billingCycleSupported:(id)a8 carrierSpaceSupported:(id)a9 workspaceName:(id)a10 workspacePath:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CTCellularUsageWorkspaceInfo;
  v19 = [(CTCellularUsageWorkspaceInfo *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_subscriberTag, a3);
    objc_storeStrong((id *)&v20->_metaDataForHomeCountry, a4);
    objc_storeStrong((id *)&v20->_metaDataForRoaming, a5);
    objc_storeStrong((id *)&v20->_billingCycleEndDate, a6);
    objc_storeStrong((id *)&v20->_previousBillingCycleDate, a7);
    objc_storeStrong((id *)&v20->_billingCycleSupported, a8);
    objc_storeStrong((id *)&v20->_carrierSpaceSupported, a9);
    objc_storeStrong((id *)&v20->_workspaceName, a10);
    objc_storeStrong((id *)&v20->_workspacePath, a11);
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CTCellularUsageWorkspaceInfo *)self subscriberTag];
  v6 = [(CTCellularUsageWorkspaceInfo *)self metaDataForHomeCountry];
  v7 = [(CTCellularUsageWorkspaceInfo *)self metaDataForRoaming];
  v8 = [(CTCellularUsageWorkspaceInfo *)self billingCycleEndDate];
  v9 = [(CTCellularUsageWorkspaceInfo *)self previousBillingCycleDate];
  v10 = [(CTCellularUsageWorkspaceInfo *)self billingCycleSupported];
  v11 = [(CTCellularUsageWorkspaceInfo *)self carrierSpaceSupported];
  v12 = [(CTCellularUsageWorkspaceInfo *)self workspaceName];
  v13 = [(CTCellularUsageWorkspaceInfo *)self workspacePath];
  v14 = (void *)[v4 initWithSubscriberTag:v5 metaDataForHomeCountry:v6 metaDataForRoaming:v7 billingCycleEndDate:v8 previousBillingCycleDate:v9 billingCycleSupported:v10 carrierSpaceSupported:v11 workspaceName:v12 workspacePath:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTCellularUsageWorkspaceInfo *)self subscriberTag];
  [v4 encodeObject:v5 forKey:@"subscriberTag"];

  v6 = [(CTCellularUsageWorkspaceInfo *)self metaDataForHomeCountry];
  [v4 encodeObject:v6 forKey:@"metaDataForHomeCountry"];

  v7 = [(CTCellularUsageWorkspaceInfo *)self metaDataForRoaming];
  [v4 encodeObject:v7 forKey:@"metaDataForRoaming"];

  v8 = [(CTCellularUsageWorkspaceInfo *)self billingCycleEndDate];
  [v4 encodeObject:v8 forKey:@"billingCycleEndDate"];

  v9 = [(CTCellularUsageWorkspaceInfo *)self previousBillingCycleDate];
  [v4 encodeObject:v9 forKey:@"previousBillingCycleDate"];

  v10 = [(CTCellularUsageWorkspaceInfo *)self billingCycleSupported];
  [v4 encodeObject:v10 forKey:@"billingCycleSupported"];

  v11 = [(CTCellularUsageWorkspaceInfo *)self carrierSpaceSupported];
  [v4 encodeObject:v11 forKey:@"carrierSpaceSupported"];

  v12 = [(CTCellularUsageWorkspaceInfo *)self workspaceName];
  [v4 encodeObject:v12 forKey:@"workspaceName"];

  id v13 = [(CTCellularUsageWorkspaceInfo *)self workspacePath];
  [v4 encodeObject:v13 forKey:@"workspacePath"];
}

- (CTCellularUsageWorkspaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTCellularUsageWorkspaceInfo;
  v5 = [(CTCellularUsageWorkspaceInfo *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriberTag"];
    subscriberTag = v5->_subscriberTag;
    v5->_subscriberTag = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaDataForHomeCountry"];
    metaDataForHomeCountry = v5->_metaDataForHomeCountry;
    v5->_metaDataForHomeCountry = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaDataForRoaming"];
    metaDataForRoaming = v5->_metaDataForRoaming;
    v5->_metaDataForRoaming = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingCycleEndDate"];
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousBillingCycleDate"];
    previousBillingCycleDate = v5->_previousBillingCycleDate;
    v5->_previousBillingCycleDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingCycleSupported"];
    billingCycleSupported = v5->_billingCycleSupported;
    v5->_billingCycleSupported = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierSpaceSupported"];
    carrierSpaceSupported = v5->_carrierSpaceSupported;
    v5->_carrierSpaceSupported = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workspaceName"];
    workspaceName = v5->_workspaceName;
    v5->_workspaceName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workspacePath"];
    workspacePath = v5->_workspacePath;
    v5->_workspacePath = (NSString *)v22;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)subscriberTag
{
  return self->_subscriberTag;
}

- (NSNumber)metaDataForHomeCountry
{
  return self->_metaDataForHomeCountry;
}

- (NSNumber)metaDataForRoaming
{
  return self->_metaDataForRoaming;
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (NSDate)previousBillingCycleDate
{
  return self->_previousBillingCycleDate;
}

- (NSNumber)billingCycleSupported
{
  return self->_billingCycleSupported;
}

- (NSNumber)carrierSpaceSupported
{
  return self->_carrierSpaceSupported;
}

- (NSString)workspaceName
{
  return self->_workspaceName;
}

- (NSString)workspacePath
{
  return self->_workspacePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspacePath, 0);
  objc_storeStrong((id *)&self->_workspaceName, 0);
  objc_storeStrong((id *)&self->_carrierSpaceSupported, 0);
  objc_storeStrong((id *)&self->_billingCycleSupported, 0);
  objc_storeStrong((id *)&self->_previousBillingCycleDate, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_metaDataForRoaming, 0);
  objc_storeStrong((id *)&self->_metaDataForHomeCountry, 0);

  objc_storeStrong((id *)&self->_subscriberTag, 0);
}

@end