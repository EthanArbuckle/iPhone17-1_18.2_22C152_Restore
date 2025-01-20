@interface GEODotPlace
- (GEODotPlace)init;
- (GEODotPlace)initWithDotPlace:(id)a3;
- (GEOLatLng)latLng;
- (GEOMapItemIdentifier)identifier;
- (GEOStyleAttributes)styleAttributes;
- (NSString)name;
@end

@implementation GEODotPlace

- (GEODotPlace)init
{
  result = (GEODotPlace *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEODotPlace)initWithDotPlace:(id)a3
{
  v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEODotPlace;
  v5 = [(GEODotPlace *)&v17 init];
  if (v5)
  {
    v6 = [GEOMapItemIdentifier alloc];
    v7 = -[GEOPDDotPlace mapsId](v4);
    uint64_t v8 = [(GEOMapItemIdentifier *)v6 initWithMapsIdentifier:v7];
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v8;

    uint64_t v10 = -[GEOPDDotPlace latLng](v4);
    latLng = v5->_latLng;
    v5->_latLng = (GEOLatLng *)v10;

    uint64_t v12 = -[GEOPDDotPlace styleAttributes](v4);
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v12;

    uint64_t v14 = -[GEOPDDotPlace name](v4);
    name = v5->_name;
    v5->_name = (NSString *)v14;
  }
  return v5;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_latLng, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end