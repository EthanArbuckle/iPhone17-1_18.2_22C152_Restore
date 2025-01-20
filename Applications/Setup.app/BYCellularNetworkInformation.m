@interface BYCellularNetworkInformation
- (NSArray)homeSubregionISOCodes;
- (NSArray)networkSubregionISOCodes;
- (NSString)homeCountryISOCode;
- (NSString)networkCountryISOCode;
- (int64_t)homeMCC;
- (int64_t)homeMNC;
- (int64_t)networkMCC;
- (int64_t)networkMNC;
- (void)setHomeCountryISOCode:(id)a3;
- (void)setHomeMCC:(int64_t)a3;
- (void)setHomeMNC:(int64_t)a3;
- (void)setHomeSubregionISOCodes:(id)a3;
- (void)setNetworkCountryISOCode:(id)a3;
- (void)setNetworkMCC:(int64_t)a3;
- (void)setNetworkMNC:(int64_t)a3;
- (void)setNetworkSubregionISOCodes:(id)a3;
@end

@implementation BYCellularNetworkInformation

- (int64_t)homeMCC
{
  return self->_homeMCC;
}

- (void)setHomeMCC:(int64_t)a3
{
  self->_homeMCC = a3;
}

- (int64_t)homeMNC
{
  return self->_homeMNC;
}

- (void)setHomeMNC:(int64_t)a3
{
  self->_homeMNC = a3;
}

- (int64_t)networkMCC
{
  return self->_networkMCC;
}

- (void)setNetworkMCC:(int64_t)a3
{
  self->_networkMCC = a3;
}

- (int64_t)networkMNC
{
  return self->_networkMNC;
}

- (void)setNetworkMNC:(int64_t)a3
{
  self->_networkMNC = a3;
}

- (NSString)homeCountryISOCode
{
  return self->_homeCountryISOCode;
}

- (void)setHomeCountryISOCode:(id)a3
{
}

- (NSArray)homeSubregionISOCodes
{
  return self->_homeSubregionISOCodes;
}

- (void)setHomeSubregionISOCodes:(id)a3
{
}

- (NSString)networkCountryISOCode
{
  return self->_networkCountryISOCode;
}

- (void)setNetworkCountryISOCode:(id)a3
{
}

- (NSArray)networkSubregionISOCodes
{
  return self->_networkSubregionISOCodes;
}

- (void)setNetworkSubregionISOCodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end