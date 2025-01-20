@interface HKClinicalSampleAccountProvider
- (HKClinicalSampleAccountProviderGateway)gateway;
- (NSDictionary)properties;
- (NSString)identifier;
- (NSString)title;
- (int64_t)minCompatibleAPIVersion;
- (void)setGateway:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMinCompatibleAPIVersion:(int64_t)a3;
- (void)setProperties:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKClinicalSampleAccountProvider

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

- (HKClinicalSampleAccountProviderGateway)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void)setMinCompatibleAPIVersion:(int64_t)a3
{
  self->_minCompatibleAPIVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end