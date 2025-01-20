@interface MKMapItemIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MKMapItemIdentifier)init;
- (MKMapItemIdentifier)initWithCoder:(id)a3;
- (MKMapItemIdentifier)initWithGEOMapItemIdentifier:(id)a3;
- (MKMapItemIdentifier)initWithIdentifierString:(id)a3;
- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3;
- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(CLLocationCoordinate2D)a4;
- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5;
- (NSString)identifierString;
- (id)debugDescription;
- (id)geoMapItemIdentifier;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKMapItemIdentifier

- (MKMapItemIdentifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapItemIdentifier;

  return 0;
}

- (MKMapItemIdentifier)initWithIdentifierString:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F646B8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMapsIdentifierString:v5];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)MKMapItemIdentifier;
    v7 = [(MKMapItemIdentifier *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_geoMapItemIdentifier, v6);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemIdentifier;
  v4 = [(MKMapItemIdentifier *)&v9 init];
  if (v4
    && (uint64_t v5 = [objc_alloc(MEMORY[0x1E4F646B8]) initWithMUID:a3],
        geoMapItemIdentifier = v4->_geoMapItemIdentifier,
        v4->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v5,
        geoMapItemIdentifier,
        v4->_geoMapItemIdentifier))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  v12.receiver = self;
  v12.super_class = (Class)MKMapItemIdentifier;
  v7 = [(MKMapItemIdentifier *)&v12 init];
  if (v7
    && (uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:coordinate:", a3, latitude, longitude),
        geoMapItemIdentifier = v7->_geoMapItemIdentifier,
        v7->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v8,
        geoMapItemIdentifier,
        v7->_geoMapItemIdentifier))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MKMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  uint64_t v7 = *(void *)&a4;
  v14.receiver = self;
  v14.super_class = (Class)MKMapItemIdentifier;
  objc_super v9 = [(MKMapItemIdentifier *)&v14 init];
  if (v9
    && (uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:resultProviderID:coordinate:", a3, v7, latitude, longitude), geoMapItemIdentifier = v9->_geoMapItemIdentifier, v9->_geoMapItemIdentifier = (GEOMapItemIdentifier *)v10, geoMapItemIdentifier, v9->_geoMapItemIdentifier))
  {
    objc_super v12 = v9;
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (MKMapItemIdentifier)initWithGEOMapItemIdentifier:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)MKMapItemIdentifier,
        v6 = [(MKMapItemIdentifier *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_geoMapItemIdentifier, a3);
    self = self;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)identifierString
{
  v2 = [(GEOMapItemIdentifier *)self->_geoMapItemIdentifier mapsIdentifierString];
  objc_super v3 = v2;
  if (!v2) {
    v2 = &stru_1ED919588;
  }
  v4 = v2;

  return v4;
}

- (unint64_t)muid
{
  return [(GEOMapItemIdentifier *)self->_geoMapItemIdentifier muid];
}

- (id)geoMapItemIdentifier
{
  return self->_geoMapItemIdentifier;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<MKMapItemIdentifier %p { %@ }>", self, self->_geoMapItemIdentifier];
}

- (unint64_t)hash
{
  return [(GEOMapItemIdentifier *)self->_geoMapItemIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MKMapItemIdentifier *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = [(GEOMapItemIdentifier *)self->_geoMapItemIdentifier isEqual:v5->_geoMapItemIdentifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MKMapItemIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKIdentifier"];

  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKMapItemIdentifier;
    char v6 = [(MKMapItemIdentifier *)&v10 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_geoMapItemIdentifier, v5);
    }
    self = v7;
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end