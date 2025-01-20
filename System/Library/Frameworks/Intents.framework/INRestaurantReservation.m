@interface INRestaurantReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)restaurantLocation;
- (INDateComponentsRange)reservationDuration;
- (INRestaurantReservation)initWithCoder:(id)a3;
- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation;
- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation;
- (NSNumber)partySize;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRestaurantReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantLocation, 0);
  objc_storeStrong((id *)&self->_partySize, 0);

  objc_storeStrong((id *)&self->_reservationDuration, 0);
}

- (CLPlacemark)restaurantLocation
{
  return self->_restaurantLocation;
}

- (NSNumber)partySize
{
  return self->_partySize;
}

- (INDateComponentsRange)reservationDuration
{
  return self->_reservationDuration;
}

- (id)_dictionaryRepresentation
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)INRestaurantReservation;
  v3 = [(INReservation *)&v13 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v14[0] = @"reservationDuration";
  reservationDuration = self->_reservationDuration;
  v6 = reservationDuration;
  if (!reservationDuration)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v6;
  v14[1] = @"partySize";
  partySize = self->_partySize;
  v8 = partySize;
  if (!partySize)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v8;
  v14[2] = @"restaurantLocation";
  restaurantLocation = self->_restaurantLocation;
  v10 = restaurantLocation;
  if (!restaurantLocation)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  [v4 addEntriesFromDictionary:v11];

  if (restaurantLocation)
  {
    if (partySize) {
      goto LABEL_9;
    }
LABEL_14:

    if (reservationDuration) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!partySize) {
    goto LABEL_14;
  }
LABEL_9:
  if (reservationDuration) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantReservation;
  id v4 = a3;
  [(INReservation *)&v11 encodeWithCoder:v4];
  reservationDuration = self->_reservationDuration;
  v6 = NSStringFromSelector(sel_reservationDuration);
  objc_msgSend(v4, "encodeObject:forKey:", reservationDuration, v6, v11.receiver, v11.super_class);

  partySize = self->_partySize;
  v8 = NSStringFromSelector(sel_partySize);
  [v4 encodeObject:partySize forKey:v8];

  restaurantLocation = self->_restaurantLocation;
  v10 = NSStringFromSelector(sel_restaurantLocation);
  [v4 encodeObject:restaurantLocation forKey:v10];
}

- (INRestaurantReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INRestaurantReservation;
  v5 = [(INReservation *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_reservationDuration);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    reservationDuration = v5->_reservationDuration;
    v5->_reservationDuration = (INDateComponentsRange *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_partySize);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    partySize = v5->_partySize;
    v5->_partySize = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_restaurantLocation);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    restaurantLocation = v5->_restaurantLocation;
    v5->_restaurantLocation = (CLPlacemark *)v16;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INRestaurantReservation *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)INRestaurantReservation,
          [(INReservation *)&v11 isEqual:v4]))
    {
      v5 = v4;
      reservationDuration = self->_reservationDuration;
      BOOL v9 = 0;
      if (reservationDuration == v5->_reservationDuration
        || -[INDateComponentsRange isEqual:](reservationDuration, "isEqual:"))
      {
        partySize = self->_partySize;
        if (partySize == v5->_partySize || -[NSNumber isEqual:](partySize, "isEqual:"))
        {
          restaurantLocation = self->_restaurantLocation;
          if (restaurantLocation == v5->_restaurantLocation
            || -[CLPlacemark isEqual:](restaurantLocation, "isEqual:"))
          {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)INRestaurantReservation;
  unint64_t v3 = [(INReservation *)&v7 hash];
  unint64_t v4 = [(INDateComponentsRange *)self->_reservationDuration hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_partySize hash];
  return v4 ^ v5 ^ [(CLPlacemark *)self->_restaurantLocation hash];
}

- (id)_duration
{
  return self->_reservationDuration;
}

- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation
{
  return [(INRestaurantReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 reservationDuration:reservationDuration partySize:partySize restaurantLocation:restaurantLocation];
}

- (INRestaurantReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservationDuration:(INDateComponentsRange *)reservationDuration partySize:(NSNumber *)partySize restaurantLocation:(CLPlacemark *)restaurantLocation
{
  v18 = reservationDuration;
  objc_super v19 = partySize;
  v20 = restaurantLocation;
  v30.receiver = self;
  v30.super_class = (Class)INRestaurantReservation;
  v21 = [(INReservation *)&v30 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v21)
  {
    uint64_t v22 = [(INDateComponentsRange *)v18 copy];
    v23 = v21->_reservationDuration;
    v21->_reservationDuration = (INDateComponentsRange *)v22;

    uint64_t v24 = [(NSNumber *)v19 copy];
    v25 = v21->_partySize;
    v21->_partySize = (NSNumber *)v24;

    uint64_t v26 = [(CLPlacemark *)v20 copy];
    v27 = v21->_restaurantLocation;
    v21->_restaurantLocation = (CLPlacemark *)v26;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end