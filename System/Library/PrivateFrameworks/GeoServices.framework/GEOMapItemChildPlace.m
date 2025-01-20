@interface GEOMapItemChildPlace
- (BOOL)isEqual:(id)a3;
- (GEOMapItemChildPlace)initWithChildPlace:(id)a3;
- (GEOMapItemIdentifier)identifier;
- (NSString)name;
@end

@implementation GEOMapItemChildPlace

- (GEOMapItemChildPlace)initWithChildPlace:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapItemChildPlace;
  v6 = [(GEOMapItemChildPlace *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_childPlace, a3);
    childPlace = v7->_childPlace;
    if (childPlace)
    {
      -[GEOPDChildPlace _readMapsId]((uint64_t)v7->_childPlace);
      if (childPlace->_mapsId)
      {
        v9 = [GEOMapItemIdentifier alloc];
        v10 = -[GEOPDChildPlace mapsId]((id *)&v7->_childPlace->super.super.isa);
        uint64_t v11 = [(GEOMapItemIdentifier *)v9 initWithMapsIdentifier:v10];
        identifier = v7->_identifier;
        v7->_identifier = (GEOMapItemIdentifier *)v11;
      }
    }
    v13 = v7;
  }

  return v7;
}

- (NSString)name
{
  return -[GEOPDChildPlace name]((id *)&self->_childPlace->super.super.isa);
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOMapItemChildPlace *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(GEOMapItemChildPlace *)self identifier];
    v8 = [(GEOMapItemChildPlace *)v6 identifier];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_childPlace, 0);
}

@end