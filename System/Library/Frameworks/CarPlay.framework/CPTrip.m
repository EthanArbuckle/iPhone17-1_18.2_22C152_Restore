@interface CPTrip
+ (BOOL)supportsSecureCoding;
- (BOOL)sendsNavigationMetadata;
- (CPTrip)init;
- (CPTrip)initWithCoder:(id)a3;
- (CPTrip)initWithOrigin:(MKMapItem *)origin destination:(MKMapItem *)destination routeChoices:(NSArray *)routeChoices;
- (MKMapItem)destination;
- (MKMapItem)origin;
- (NSArray)destinationNameVariants;
- (NSArray)routeChoices;
- (NSUUID)identifier;
- (id)description;
- (id)userInfo;
- (signed)destinationTimeZoneOffsetFromGMT;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationNameVariants:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSendsNavigationMetadata:(BOOL)a3;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPTrip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTrip)init
{
  v3 = [MEMORY[0x263F10960] mapItemForCurrentLocation];
  v4 = [MEMORY[0x263F10960] mapItemForCurrentLocation];
  v5 = [(CPTrip *)self initWithOrigin:v3 destination:v4 routeChoices:MEMORY[0x263EFFA68]];

  return v5;
}

- (CPTrip)initWithOrigin:(MKMapItem *)origin destination:(MKMapItem *)destination routeChoices:(NSArray *)routeChoices
{
  v23[1] = *MEMORY[0x263EF8340];
  v9 = origin;
  v10 = destination;
  v11 = routeChoices;
  v22.receiver = self;
  v22.super_class = (Class)CPTrip;
  v12 = [(CPTrip *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_origin, origin);
    objc_storeStrong((id *)&v12->_destination, destination);
    uint64_t v15 = [(NSArray *)v11 copy];
    v16 = v12->_routeChoices;
    v12->_routeChoices = (NSArray *)v15;

    v17 = [(MKMapItem *)v10 name];

    if (v17)
    {
      v18 = [(MKMapItem *)v10 name];
      v23[0] = v18;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      destinationNameVariants = v12->_destinationNameVariants;
      v12->_destinationNameVariants = (NSArray *)v19;
    }
  }

  return v12;
}

- (CPTrip)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPIdentifierKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTripOriginKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTripDestinationKey"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCPTripRouteChoicesKey"];

  v12 = [(CPTrip *)self initWithOrigin:v6 destination:v7 routeChoices:v11];
  [(CPTrip *)v12 setIdentifier:v5];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPTrip *)self identifier];
  [v4 encodeObject:v5 forKey:@"kCPIdentifierKey"];

  v6 = [(CPTrip *)self origin];
  id v26 = [v6 placemark];

  v25 = [v26 postalAddress];
  v7 = (void *)MEMORY[0x263F00AA8];
  v8 = [v26 location];
  uint64_t v9 = [v26 name];
  v10 = [v7 placemarkWithLocation:v8 name:v9 postalAddress:v25];

  id v11 = objc_alloc(MEMORY[0x263F10960]);
  v12 = (void *)[objc_alloc(MEMORY[0x263F109E0]) initWithPlacemark:v10];
  uint64_t v13 = (void *)[v11 initWithPlacemark:v12];

  v14 = [(CPTrip *)self destination];
  uint64_t v15 = [v14 placemark];

  v16 = [v15 postalAddress];
  v17 = (void *)MEMORY[0x263F00AA8];
  v18 = [v15 location];
  uint64_t v19 = [v15 name];
  v20 = [v17 placemarkWithLocation:v18 name:v19 postalAddress:v16];

  id v21 = objc_alloc(MEMORY[0x263F10960]);
  objc_super v22 = (void *)[objc_alloc(MEMORY[0x263F109E0]) initWithPlacemark:v20];
  v23 = (void *)[v21 initWithPlacemark:v22];

  [v4 encodeObject:v13 forKey:@"kCPTripOriginKey"];
  [v4 encodeObject:v23 forKey:@"kCPTripDestinationKey"];
  v24 = [(CPTrip *)self routeChoices];
  [v4 encodeObject:v24 forKey:@"kCPTripRouteChoicesKey"];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CPTrip;
  id v4 = [(CPTrip *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {origin: %@, destination: %@, routeChoices: %@}", v4, self->_origin, self->_destination, self->_routeChoices];

  return v5;
}

- (signed)destinationTimeZoneOffsetFromGMT
{
  v2 = [(CPTrip *)self destination];
  v3 = [v2 timeZone];
  uint64_t v4 = [v3 secondsFromGMT];
  unint64_t v5 = ((unsigned __int128)(v4 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v4;
  int v6 = (v5 >> 63) + (v5 >> 5);

  return v6;
}

- (MKMapItem)origin
{
  return self->_origin;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (NSArray)routeChoices
{
  return self->_routeChoices;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void)setDestinationNameVariants:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  self->_sendsNavigationMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_routeChoices, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_origin, 0);
}

@end