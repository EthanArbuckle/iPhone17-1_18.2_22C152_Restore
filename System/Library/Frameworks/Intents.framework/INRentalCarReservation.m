@interface INRentalCarReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)dropOffLocation;
- (CLPlacemark)pickupLocation;
- (INDateComponentsRange)rentalDuration;
- (INRentalCar)rentalCar;
- (INRentalCarReservation)initWithCoder:(id)a3;
- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation;
- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRentalCarReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropOffLocation, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_rentalDuration, 0);

  objc_storeStrong((id *)&self->_rentalCar, 0);
}

- (CLPlacemark)dropOffLocation
{
  return self->_dropOffLocation;
}

- (CLPlacemark)pickupLocation
{
  return self->_pickupLocation;
}

- (INDateComponentsRange)rentalDuration
{
  return self->_rentalDuration;
}

- (INRentalCar)rentalCar
{
  return self->_rentalCar;
}

- (id)_dictionaryRepresentation
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)INRentalCarReservation;
  v3 = [(INReservation *)&v15 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v16[0] = @"rentalCar";
  rentalCar = self->_rentalCar;
  v6 = rentalCar;
  if (!rentalCar)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v6;
  v16[1] = @"rentalDuration";
  rentalDuration = self->_rentalDuration;
  v8 = rentalDuration;
  if (!rentalDuration)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v8;
  v16[2] = @"pickupLocation";
  pickupLocation = self->_pickupLocation;
  v10 = pickupLocation;
  if (!pickupLocation)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v10;
  v16[3] = @"dropOffLocation";
  dropOffLocation = self->_dropOffLocation;
  v12 = dropOffLocation;
  if (!dropOffLocation)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  [v4 addEntriesFromDictionary:v13];

  if (dropOffLocation)
  {
    if (pickupLocation) {
      goto LABEL_11;
    }
  }
  else
  {

    if (pickupLocation)
    {
LABEL_11:
      if (rentalDuration) {
        goto LABEL_12;
      }
LABEL_18:

      if (rentalCar) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!rentalDuration) {
    goto LABEL_18;
  }
LABEL_12:
  if (rentalCar) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)INRentalCarReservation;
  id v4 = a3;
  [(INReservation *)&v13 encodeWithCoder:v4];
  rentalCar = self->_rentalCar;
  v6 = NSStringFromSelector(sel_rentalCar);
  objc_msgSend(v4, "encodeObject:forKey:", rentalCar, v6, v13.receiver, v13.super_class);

  rentalDuration = self->_rentalDuration;
  v8 = NSStringFromSelector(sel_rentalDuration);
  [v4 encodeObject:rentalDuration forKey:v8];

  pickupLocation = self->_pickupLocation;
  v10 = NSStringFromSelector(sel_pickupLocation);
  [v4 encodeObject:pickupLocation forKey:v10];

  dropOffLocation = self->_dropOffLocation;
  v12 = NSStringFromSelector(sel_dropOffLocation);
  [v4 encodeObject:dropOffLocation forKey:v12];
}

- (INRentalCarReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INRentalCarReservation;
  v5 = [(INReservation *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_rentalCar);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    rentalCar = v5->_rentalCar;
    v5->_rentalCar = (INRentalCar *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_rentalDuration);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    rentalDuration = v5->_rentalDuration;
    v5->_rentalDuration = (INDateComponentsRange *)v12;

    uint64_t v14 = objc_opt_class();
    objc_super v15 = NSStringFromSelector(sel_pickupLocation);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    pickupLocation = v5->_pickupLocation;
    v5->_pickupLocation = (CLPlacemark *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_dropOffLocation);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    dropOffLocation = v5->_dropOffLocation;
    v5->_dropOffLocation = (CLPlacemark *)v20;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INRentalCarReservation *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)INRentalCarReservation,
          [(INReservation *)&v12 isEqual:v4]))
    {
      v5 = v4;
      rentalCar = self->_rentalCar;
      BOOL v10 = 0;
      if (rentalCar == v5->_rentalCar || -[INRentalCar isEqual:](rentalCar, "isEqual:"))
      {
        rentalDuration = self->_rentalDuration;
        if (rentalDuration == v5->_rentalDuration || -[INDateComponentsRange isEqual:](rentalDuration, "isEqual:"))
        {
          pickupLocation = self->_pickupLocation;
          if (pickupLocation == v5->_pickupLocation
            || -[CLPlacemark isEqual:](pickupLocation, "isEqual:"))
          {
            dropOffLocation = self->_dropOffLocation;
            if (dropOffLocation == v5->_dropOffLocation
              || -[CLPlacemark isEqual:](dropOffLocation, "isEqual:"))
            {
              BOOL v10 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)INRentalCarReservation;
  unint64_t v3 = [(INReservation *)&v8 hash];
  unint64_t v4 = [(INRentalCar *)self->_rentalCar hash] ^ v3;
  unint64_t v5 = [(INDateComponentsRange *)self->_rentalDuration hash];
  uint64_t v6 = v4 ^ v5 ^ [(CLPlacemark *)self->_pickupLocation hash];
  return v6 ^ [(CLPlacemark *)self->_dropOffLocation hash];
}

- (id)_duration
{
  return self->_rentalDuration;
}

- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  return [(INRentalCarReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 rentalCar:rentalCar rentalDuration:rentalDuration pickupLocation:pickupLocation dropOffLocation:dropOffLocation];
}

- (INRentalCarReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL rentalCar:(INRentalCar *)rentalCar rentalDuration:(INDateComponentsRange *)rentalDuration pickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  uint64_t v18 = rentalCar;
  v19 = rentalDuration;
  uint64_t v20 = pickupLocation;
  v21 = dropOffLocation;
  v34.receiver = self;
  v34.super_class = (Class)INRentalCarReservation;
  v22 = [(INReservation *)&v34 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v22)
  {
    uint64_t v23 = [(INRentalCar *)v18 copy];
    v24 = v22->_rentalCar;
    v22->_rentalCar = (INRentalCar *)v23;

    uint64_t v25 = [(INDateComponentsRange *)v19 copy];
    v26 = v22->_rentalDuration;
    v22->_rentalDuration = (INDateComponentsRange *)v25;

    uint64_t v27 = [(CLPlacemark *)v20 copy];
    v28 = v22->_pickupLocation;
    v22->_pickupLocation = (CLPlacemark *)v27;

    uint64_t v29 = [(CLPlacemark *)v21 copy];
    v30 = v22->_dropOffLocation;
    v22->_dropOffLocation = (CLPlacemark *)v29;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end