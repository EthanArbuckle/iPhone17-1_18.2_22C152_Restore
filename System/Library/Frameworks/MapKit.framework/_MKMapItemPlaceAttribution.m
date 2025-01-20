@interface _MKMapItemPlaceAttribution
- (NSArray)checkInURLs;
- (_MKMapItemPlaceAttribution)initWithGEOMapItemAttribution:(id)a3;
@end

@implementation _MKMapItemPlaceAttribution

- (_MKMapItemPlaceAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemPlaceAttribution;
  v6 = [(_MKMapItemAttribution *)&v10 initWithGEOMapItemAttribution:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_geoPlaceAttribution, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)checkInURLs
{
  return (NSArray *)[(GEOMapItemPlaceAttribution *)self->_geoPlaceAttribution checkInURLs];
}

- (void).cxx_destruct
{
}

@end