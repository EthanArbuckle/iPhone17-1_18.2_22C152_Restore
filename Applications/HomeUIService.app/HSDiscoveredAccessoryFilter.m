@interface HSDiscoveredAccessoryFilter
- (BOOL)shouldShowAccessory:(id)a3;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSDiscoveredAccessoryFilter)initWithEntitlementContext:(id)a3 setupAccessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5;
- (HSEntitlementContext)entitlementContext;
- (MTSDeviceSetupRequest)matterDeviceSetupRequest;
- (NSSet)denylistedAccessoryCategories;
- (void)_computeDenylistedAccessoryCategories;
- (void)setDenylistedAccessoryCategories:(id)a3;
@end

@implementation HSDiscoveredAccessoryFilter

- (HSDiscoveredAccessoryFilter)initWithEntitlementContext:(id)a3 setupAccessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HSDiscoveredAccessoryFilter;
  v12 = [(HSDiscoveredAccessoryFilter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entitlementContext, a3);
    objc_storeStrong((id *)&v13->_setupAccessoryDescription, a4);
    objc_storeStrong((id *)&v13->_matterDeviceSetupRequest, a5);
    [(HSDiscoveredAccessoryFilter *)v13 _computeDenylistedAccessoryCategories];
  }

  return v13;
}

- (BOOL)shouldShowAccessory:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessory];
  v6 = [(HSDiscoveredAccessoryFilter *)self setupAccessoryDescription];
  if ([v6 isSetupInitiatedByOtherMatterEcosystem] && v5)
  {
    unsigned __int8 v7 = [v5 supportsCHIP];

    if ((v7 & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v8 = [(HSDiscoveredAccessoryFilter *)self entitlementContext];
  unsigned int v9 = [v8 isEntitledForHomeKitSPI];

  id v10 = [v4 sharingDevice];
  id v11 = v10;
  if (v9)
  {

    if (v11)
    {
      v12 = [v4 sharingDevice];
      unsigned int v13 = [v12 deviceClassCode];

      LOBYTE(v13) = (v13 & 0xFFFFFFFD) == 4;
      goto LABEL_22;
    }
    if (!v5)
    {
LABEL_14:
      LOBYTE(v13) = 0;
      goto LABEL_22;
    }
  }
  else
  {

    LOBYTE(v13) = 0;
    if (v11 || !v5) {
      goto LABEL_22;
    }
  }
  v14 = [(HSDiscoveredAccessoryFilter *)self denylistedAccessoryCategories];
  objc_super v15 = [v5 category];
  v16 = [v15 categoryType];
  unsigned __int8 v17 = [v14 containsObject:v16];

  if (v17) {
    goto LABEL_14;
  }
  if ([v5 supportsCHIP]
    && [v5 knownToSystemCommissioner]
    && ([(HSDiscoveredAccessoryFilter *)self matterDeviceSetupRequest],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v18))
  {
    v19 = [(HSDiscoveredAccessoryFilter *)self matterDeviceSetupRequest];
    unsigned int v13 = [v19 hs_shouldShowAccessory:v5];

    v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(HSDiscoveredAccessoryFilter *)self matterDeviceSetupRequest];
      v23[0] = 67109634;
      v23[1] = v13;
      __int16 v24 = 2112;
      v25 = v5;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "answerFromRequest=%d for accessory %@ request %@", (uint8_t *)v23, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }
LABEL_22:

  return v13;
}

- (void)_computeDenylistedAccessoryCategories
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048400;
  v4[3] = &unk_1000AAE28;
  v4[4] = self;
  v3 = sub_100048400((uint64_t)v4);
  [(HSDiscoveredAccessoryFilter *)self setDenylistedAccessoryCategories:v3];
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (NSSet)denylistedAccessoryCategories
{
  return self->_denylistedAccessoryCategories;
}

- (void)setDenylistedAccessoryCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denylistedAccessoryCategories, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);

  objc_storeStrong((id *)&self->_entitlementContext, 0);
}

@end