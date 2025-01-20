@interface GEOGeographicMetadataRegulatoryFetcher
- (GEOGeographicMetadataRegulatoryFetcher)init;
@end

@implementation GEOGeographicMetadataRegulatoryFetcher

- (GEOGeographicMetadataRegulatoryFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOGeographicMetadataRegulatoryFetcher;
  return (GEOGeographicMetadataRegulatoryFetcher *)[(GEOGeographicMetadataMobileAssetFetcher *)&v3 initForType:1 parameters:0];
}

@end