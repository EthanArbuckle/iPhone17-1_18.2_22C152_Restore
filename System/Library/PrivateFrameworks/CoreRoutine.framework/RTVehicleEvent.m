@interface RTVehicleEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)confirmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationFinalized;
- (BOOL)userSetLocation;
- (BOOL)usualLocation;
- (NSData)photo;
- (NSDate)date;
- (NSString)notes;
- (NSString)vehicleIdentifier;
- (NSUUID)identifier;
- (RTLocation)location;
- (RTLocationOfInterest)nearbyLocationOfInterest;
- (RTMapItem)mapItem;
- (RTVehicleEvent)init;
- (RTVehicleEvent)initWithCoder:(id)a3;
- (RTVehicleEvent)initWithDate:(id)a3;
- (RTVehicleEvent)initWithDate:(id)a3 location:(id)a4 vehicleIdentifier:(id)a5 userSetLocation:(BOOL)a6 notes:(id)a7 identifier:(id)a8 photo:(id)a9 mapItem:(id)a10 confirmed:(BOOL)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)locationQuality;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationFinalized:(BOOL)a3;
- (void)setLocationQuality:(unint64_t)a3;
- (void)setMapItem:(id)a3;
- (void)setNearbyLocationOfInterest:(id)a3;
- (void)setNotes:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setUserSetLocation:(BOOL)a3;
- (void)setUsualLocation:(BOOL)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation RTVehicleEvent

- (RTVehicleEvent)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  LOBYTE(v6) = 0;
  v4 = [(RTVehicleEvent *)self initWithDate:0 location:0 vehicleIdentifier:0 userSetLocation:0 notes:0 identifier:v3 photo:0 mapItem:0 confirmed:v6];

  return v4;
}

- (RTVehicleEvent)initWithDate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = [v4 UUID];
  LOBYTE(v9) = 0;
  v7 = [(RTVehicleEvent *)self initWithDate:v5 location:0 vehicleIdentifier:0 userSetLocation:0 notes:0 identifier:v6 photo:0 mapItem:0 confirmed:v9];

  return v7;
}

- (RTVehicleEvent)initWithDate:(id)a3 location:(id)a4 vehicleIdentifier:(id)a5 userSetLocation:(BOOL)a6 notes:(id)a7 identifier:(id)a8 photo:(id)a9 mapItem:(id)a10 confirmed:(BOOL)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v36.receiver = self;
  v36.super_class = (Class)RTVehicleEvent;
  v23 = [(RTVehicleEvent *)&v36 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    date = v23->_date;
    v23->_date = (NSDate *)v24;

    uint64_t v26 = [v17 copy];
    location = v23->_location;
    v23->_location = (RTLocation *)v26;

    uint64_t v28 = [v18 copy];
    vehicleIdentifier = v23->_vehicleIdentifier;
    v23->_vehicleIdentifier = (NSString *)v28;

    v23->_userSetLocation = a6;
    uint64_t v30 = [v19 copy];
    notes = v23->_notes;
    v23->_notes = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    identifier = v23->_identifier;
    v23->_identifier = (NSUUID *)v32;

    objc_storeStrong((id *)&v23->_photo, a9);
    objc_storeStrong((id *)&v23->_mapItem, a10);
    *(_WORD *)&v23->_confirmed = a11;
  }

  return v23;
}

- (id)description
{
  id v18 = NSString;
  id v17 = [(RTVehicleEvent *)self date];
  id v16 = [(RTVehicleEvent *)self location];
  v3 = [(RTVehicleEvent *)self vehicleIdentifier];
  BOOL v15 = [(RTVehicleEvent *)self userSetLocation];
  v4 = [(RTVehicleEvent *)self notes];
  id v5 = [(RTVehicleEvent *)self identifier];
  uint64_t v6 = [(RTVehicleEvent *)self mapItem];
  v7 = [v6 address];
  unint64_t v8 = [(RTVehicleEvent *)self locationQuality];
  BOOL v9 = [(RTVehicleEvent *)self usualLocation];
  BOOL v10 = [(RTVehicleEvent *)self confirmed];
  BOOL v11 = [(RTVehicleEvent *)self locationFinalized];
  v12 = [(RTVehicleEvent *)self nearbyLocationOfInterest];
  v13 = [v18 stringWithFormat:@"date, %@, location, %@, vehicleIdentifier, %@, userSetLocation, %d, notes, %@, identifier, %@, address, <%@>, quality, %lu, usualLocation, %d, confirmed, %d, locationFinalized, %d, nearbyLocationOfInterest, %@", v17, v16, v3, v15, v4, v5, v7, v8, v9, v10, v11, v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTVehicleEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTVehicleEvent;
  id v5 = [(RTVehicleEvent *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (RTLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleIdentifier"];
    vehicleIdentifier = v5->_vehicleIdentifier;
    v5->_vehicleIdentifier = (NSString *)v10;

    v5->_userSetLocation = [v4 decodeBoolForKey:@"userSetLocation"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
    notes = v5->_notes;
    v5->_notes = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photo"];
    photo = v5->_photo;
    v5->_photo = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];
    mapItem = v5->_mapItem;
    v5->_mapItem = (RTMapItem *)v18;

    v5->_locationQuality = [v4 decodeIntegerForKey:@"locationQuality"];
    v5->_usualLocation = [v4 decodeBoolForKey:@"usualLocation"];
    v5->_confirmed = [v4 decodeBoolForKey:@"confirmed"];
    v5->_locationFinalized = [v4 decodeBoolForKey:@"locationFinalized"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nearbyLocationOfInterest"];
    nearbyLocationOfInterest = v5->_nearbyLocationOfInterest;
    v5->_nearbyLocationOfInterest = (RTLocationOfInterest *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_vehicleIdentifier forKey:@"vehicleIdentifier"];
  [v5 encodeBool:self->_userSetLocation forKey:@"userSetLocation"];
  [v5 encodeObject:self->_notes forKey:@"notes"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_photo forKey:@"photo"];
  [v5 encodeObject:self->_mapItem forKey:@"mapItem"];
  [v5 encodeInteger:self->_locationQuality forKey:@"locationQuality"];
  [v5 encodeBool:self->_usualLocation forKey:@"usualLocation"];
  [v5 encodeBool:self->_confirmed forKey:@"confirmed"];
  [v5 encodeBool:self->_locationFinalized forKey:@"locationFinalized"];
  [v5 encodeObject:self->_nearbyLocationOfInterest forKey:@"nearbyLocationOfInterest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RTVehicleEvent alloc];
  LOBYTE(v9) = self->_confirmed;
  uint64_t v5 = [(RTVehicleEvent *)v4 initWithDate:self->_date location:self->_location vehicleIdentifier:self->_vehicleIdentifier userSetLocation:self->_userSetLocation notes:self->_notes identifier:self->_identifier photo:self->_photo mapItem:self->_mapItem confirmed:v9];
  *(unsigned char *)(v5 + 11) = self->_locationFinalized;
  *(unsigned char *)(v5 + 9) = self->_usualLocation;
  *(void *)(v5 + 72) = self->_locationQuality;
  uint64_t v6 = [(RTLocationOfInterest *)self->_nearbyLocationOfInterest copy];
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RTVehicleEvent *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        uint64_t v8 = [(RTVehicleEvent *)self identifier];
        if (v8
          || ([(RTVehicleEvent *)v7 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v9 = [(RTVehicleEvent *)self identifier];
          uint64_t v10 = [(RTVehicleEvent *)v7 identifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(RTVehicleEvent *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)vehicleIdentifier
{
  return self->_vehicleIdentifier;
}

- (void)setVehicleIdentifier:(id)a3
{
}

- (BOOL)userSetLocation
{
  return self->_userSetLocation;
}

- (void)setUserSetLocation:(BOOL)a3
{
  self->_userSetLocation = a3;
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (unint64_t)locationQuality
{
  return self->_locationQuality;
}

- (void)setLocationQuality:(unint64_t)a3
{
  self->_locationQuality = a3;
}

- (BOOL)usualLocation
{
  return self->_usualLocation;
}

- (void)setUsualLocation:(BOOL)a3
{
  self->_usualLocation = a3;
}

- (RTLocationOfInterest)nearbyLocationOfInterest
{
  return self->_nearbyLocationOfInterest;
}

- (void)setNearbyLocationOfInterest:(id)a3
{
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)locationFinalized
{
  return self->_locationFinalized;
}

- (void)setLocationFinalized:(BOOL)a3
{
  self->_locationFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end