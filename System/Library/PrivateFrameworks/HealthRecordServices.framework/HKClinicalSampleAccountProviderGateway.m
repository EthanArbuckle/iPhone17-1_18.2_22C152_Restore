@interface HKClinicalSampleAccountProviderGateway
- (HKFHIRVersion)FHIRVersion;
- (NSDictionary)properties;
- (NSString)identifier;
- (NSString)title;
- (void)setFHIRVersion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProperties:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKClinicalSampleAccountProviderGateway

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (void)setFHIRVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end