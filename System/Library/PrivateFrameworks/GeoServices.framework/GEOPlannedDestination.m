@interface GEOPlannedDestination
+ (BOOL)supportsSecureCoding;
- (GEOPlannedDestination)init;
- (GEOPlannedDestination)initWithCoder:(id)a3;
- (GEOPlannedDestination)initWithCoordinate:(id)a3;
- (GEOPlannedDestination)initWithMapItem:(id)a3;
- (GEOPlannedDestination)initWithMapItemHandle:(id)a3;
- (NSData)handle;
- (NSDate)arrivalDate;
- (NSDate)expirationDate;
- (id)description;
- (int)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setTransportType:(int)a3;
@end

@implementation GEOPlannedDestination

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPlannedDestination)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlannedDestination;
  v2 = [(GEOPlannedDestination *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_transportType = 4;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v4;
  }
  return v3;
}

- (GEOPlannedDestination)initWithMapItemHandle:(id)a3
{
  id v5 = a3;
  v6 = [(GEOPlannedDestination *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (GEOPlannedDestination)initWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPlannedDestination *)self init];
  if (v5)
  {
    v6 = +[GEOMapService sharedService];
    uint64_t v7 = [v6 handleForMapItem:v4];
    handle = v5->_handle;
    v5->_handle = (NSData *)v7;
  }
  return v5;
}

- (GEOPlannedDestination)initWithCoordinate:(id)a3
{
  id v4 = [[GEOPlace alloc] initWithLatitude:a3.var0 longitude:a3.var1];
  id v5 = +[GEOMapItemStorage mapItemStorageForPlace:v4];
  v6 = [(GEOPlannedDestination *)self initWithMapItem:v5];

  return v6;
}

- (GEOPlannedDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlannedDestination;
  id v5 = [(GEOPlannedDestination *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPlannedDestinationArrivalDateKey"];
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v6;

    v5->_transportType = [v4 decodeIntegerForKey:@"GEOPlannedDestinationTransportTypeKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPlannedDestinationHandleKey"];
    handle = v5->_handle;
    v5->_handle = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPlannedDestinationExpirationDateKey"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOPlannedDestination *)self arrivalDate];
  [v4 encodeObject:v5 forKey:@"GEOPlannedDestinationArrivalDateKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEOPlannedDestination transportType](self, "transportType"), @"GEOPlannedDestinationTransportTypeKey");
  uint64_t v6 = [(GEOPlannedDestination *)self handle];
  [v4 encodeObject:v6 forKey:@"GEOPlannedDestinationHandleKey"];

  id v7 = [(GEOPlannedDestination *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"GEOPlannedDestinationExpirationDateKey"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [(GEOPlannedDestination *)self arrivalDate];
  uint64_t v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:1];
  uint64_t v7 = [(GEOPlannedDestination *)self transportType];
  if (v7 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E53EDA00[(int)v7];
  }
  v9 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v10 = [(GEOPlannedDestination *)self expirationDate];
  v11 = [v9 localizedStringFromDate:v10 dateStyle:1 timeStyle:1];
  v12 = [v3 stringWithFormat:@"{ Arrival Date %@ | TransportType %@ | Expiration Date %@ | Handle %p }", v6, v8, v11, self->_handle];

  return v12;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(id)a3
{
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (NSData)handle
{
  return self->_handle;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_arrivalDate, 0);
}

@end