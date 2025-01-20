@interface CLSLitePlacemarkTestData
- (BOOL)isIsland;
- (CLCircularRegion)region;
- (CLLocation)location;
- (NSArray)areasOfInterest;
- (NSArray)popularityScoresOrderedByAOI;
- (NSString)ISOcountryCode;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)inlandWater;
- (NSString)locality;
- (NSString)ocean;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdministrativeAreaCode:(id)a3;
- (void)setAreasOfInterest:(id)a3;
- (void)setISOcountryCode:(id)a3;
- (void)setInlandWater:(id)a3;
- (void)setIsIsland:(BOOL)a3;
- (void)setLocality:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOcean:(id)a3;
- (void)setPopularityScoresOrderedByAOI:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
@end

@implementation CLSLitePlacemarkTestData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popularityScoresOrderedByAOI, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_ISOcountryCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setPopularityScoresOrderedByAOI:(id)a3
{
}

- (NSArray)popularityScoresOrderedByAOI
{
  return self->_popularityScoresOrderedByAOI;
}

- (void)setIsIsland:(BOOL)a3
{
  self->_isIsland = a3;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (void)setAdministrativeAreaCode:(id)a3
{
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (void)setAreasOfInterest:(id)a3
{
}

- (NSArray)areasOfInterest
{
  return self->_areasOfInterest;
}

- (void)setOcean:(id)a3
{
}

- (NSString)ocean
{
  return self->_ocean;
}

- (void)setInlandWater:(id)a3
{
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (void)setISOcountryCode:(id)a3
{
}

- (NSString)ISOcountryCode
{
  return self->_ISOcountryCode;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setSubThoroughfare:(id)a3
{
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setThoroughfare:(id)a3
{
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setRegion:(id)a3
{
}

- (CLCircularRegion)region
{
  return self->_region;
}

@end