@interface HKClinicalSampleAccount
- (HKClinicalSampleAccountProvider)provider;
- (NSArray)batches;
- (NSDictionary)properties;
- (id)asClinicalGatewayWithBrand:(id)a3;
- (id)asClinicalProviderWithBrand:(id)a3;
- (void)setBatches:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation HKClinicalSampleAccount

- (id)asClinicalGatewayWithBrand:(id)a3
{
  provider = self->_provider;
  id v4 = a3;
  v5 = [(HKClinicalSampleAccountProvider *)provider gateway];
  v6 = [HKClinicalGateway alloc];
  uint64_t v7 = [v5 identifier];
  v8 = [v5 title];
  v18 = [v5 properties];
  v9 = [v18 objectForKeyedSubscript:@"subtitle"];
  v10 = [v5 properties];
  v11 = [v10 objectForKeyedSubscript:@"description"];
  v12 = HKClinicalGatewayUnknownBaseURL();
  v13 = [v5 FHIRVersion];
  v14 = v6;
  v15 = (void *)v7;
  v16 = -[HKClinicalGateway initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:](v14, "initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:", v7, v8, v9, v11, 0, 0, 0, 0, 0, 1, 1, v4, @"US", v12, v13,
          0,
          0,
          0,
          0,
          0);

  return v16;
}

- (id)asClinicalProviderWithBrand:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = [(HKClinicalSampleAccount *)self asClinicalGatewayWithBrand:a3];
  v5 = [HKClinicalProvider alloc];
  v6 = [(HKClinicalSampleAccountProvider *)self->_provider identifier];
  uint64_t v7 = [(HKClinicalSampleAccountProvider *)self->_provider title];
  v8 = [(HKClinicalSampleAccountProvider *)self->_provider properties];
  v9 = [v8 objectForKeyedSubscript:@"subtitle"];
  v10 = [(HKClinicalSampleAccountProvider *)self->_provider properties];
  v11 = [v10 objectForKeyedSubscript:@"location"];
  v12 = [v4 brand];
  v16[0] = v4;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  v14 = [(HKClinicalProvider *)v5 initWithExternalID:v6 title:v7 subtitle:v9 location:v11 informationURL:0 brand:v12 gateways:v13];

  return v14;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (HKClinicalSampleAccountProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSArray)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
  objc_storeStrong((id *)&self->_provider, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end