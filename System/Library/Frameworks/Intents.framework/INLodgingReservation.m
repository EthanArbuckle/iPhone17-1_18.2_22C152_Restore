@interface INLodgingReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)lodgingBusinessLocation;
- (INDateComponentsRange)reservationDuration;
- (INLodgingReservation)initWithCoder:(id)a3;
- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren;
- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren;
- (NSNumber)numberOfAdults;
- (NSNumber)numberOfChildren;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INLodgingReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfChildren, 0);
  objc_storeStrong((id *)&self->_numberOfAdults, 0);
  objc_storeStrong((id *)&self->_reservationDuration, 0);

  objc_storeStrong((id *)&self->_lodgingBusinessLocation, 0);
}

- (NSNumber)numberOfChildren
{
  return self->_numberOfChildren;
}

- (NSNumber)numberOfAdults
{
  return self->_numberOfAdults;
}

- (INDateComponentsRange)reservationDuration
{
  return self->_reservationDuration;
}

- (CLPlacemark)lodgingBusinessLocation
{
  return self->_lodgingBusinessLocation;
}

- (id)_dictionaryRepresentation
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)INLodgingReservation;
  v3 = [(INReservation *)&v15 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v16[0] = @"lodgingBusinessLocation";
  lodgingBusinessLocation = self->_lodgingBusinessLocation;
  v6 = lodgingBusinessLocation;
  if (!lodgingBusinessLocation)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v6;
  v16[1] = @"reservationDuration";
  reservationDuration = self->_reservationDuration;
  v8 = reservationDuration;
  if (!reservationDuration)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v8;
  v16[2] = @"numberOfAdults";
  numberOfAdults = self->_numberOfAdults;
  v10 = numberOfAdults;
  if (!numberOfAdults)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v10;
  v16[3] = @"numberOfChildren";
  numberOfChildren = self->_numberOfChildren;
  v12 = numberOfChildren;
  if (!numberOfChildren)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  [v4 addEntriesFromDictionary:v13];

  if (numberOfChildren)
  {
    if (numberOfAdults) {
      goto LABEL_11;
    }
  }
  else
  {

    if (numberOfAdults)
    {
LABEL_11:
      if (reservationDuration) {
        goto LABEL_12;
      }
LABEL_18:

      if (lodgingBusinessLocation) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!reservationDuration) {
    goto LABEL_18;
  }
LABEL_12:
  if (lodgingBusinessLocation) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)INLodgingReservation;
  id v4 = a3;
  [(INReservation *)&v13 encodeWithCoder:v4];
  lodgingBusinessLocation = self->_lodgingBusinessLocation;
  v6 = NSStringFromSelector(sel_lodgingBusinessLocation);
  objc_msgSend(v4, "encodeObject:forKey:", lodgingBusinessLocation, v6, v13.receiver, v13.super_class);

  reservationDuration = self->_reservationDuration;
  v8 = NSStringFromSelector(sel_reservationDuration);
  [v4 encodeObject:reservationDuration forKey:v8];

  numberOfAdults = self->_numberOfAdults;
  v10 = NSStringFromSelector(sel_numberOfAdults);
  [v4 encodeObject:numberOfAdults forKey:v10];

  numberOfChildren = self->_numberOfChildren;
  v12 = NSStringFromSelector(sel_numberOfChildren);
  [v4 encodeObject:numberOfChildren forKey:v12];
}

- (INLodgingReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INLodgingReservation;
  v5 = [(INReservation *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_lodgingBusinessLocation);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    lodgingBusinessLocation = v5->_lodgingBusinessLocation;
    v5->_lodgingBusinessLocation = (CLPlacemark *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_reservationDuration);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    reservationDuration = v5->_reservationDuration;
    v5->_reservationDuration = (INDateComponentsRange *)v12;

    uint64_t v14 = objc_opt_class();
    objc_super v15 = NSStringFromSelector(sel_numberOfAdults);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    numberOfAdults = v5->_numberOfAdults;
    v5->_numberOfAdults = (NSNumber *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_numberOfChildren);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    numberOfChildren = v5->_numberOfChildren;
    v5->_numberOfChildren = (NSNumber *)v20;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INLodgingReservation *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v12.receiver = self,
          v12.super_class = (Class)INLodgingReservation,
          [(INReservation *)&v12 isEqual:v4]))
    {
      v5 = v4;
      lodgingBusinessLocation = self->_lodgingBusinessLocation;
      BOOL v10 = 0;
      if (lodgingBusinessLocation == v5->_lodgingBusinessLocation
        || -[CLPlacemark isEqual:](lodgingBusinessLocation, "isEqual:"))
      {
        reservationDuration = self->_reservationDuration;
        if (reservationDuration == v5->_reservationDuration
          || -[INDateComponentsRange isEqual:](reservationDuration, "isEqual:"))
        {
          numberOfAdults = self->_numberOfAdults;
          if (numberOfAdults == v5->_numberOfAdults || -[NSNumber isEqual:](numberOfAdults, "isEqual:"))
          {
            numberOfChildren = self->_numberOfChildren;
            if (numberOfChildren == v5->_numberOfChildren
              || -[NSNumber isEqual:](numberOfChildren, "isEqual:"))
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
  v8.super_class = (Class)INLodgingReservation;
  unint64_t v3 = [(INReservation *)&v8 hash];
  uint64_t v4 = [(CLPlacemark *)self->_lodgingBusinessLocation hash] ^ v3;
  unint64_t v5 = [(INDateComponentsRange *)self->_reservationDuration hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_numberOfAdults hash];
  return v6 ^ [(NSNumber *)self->_numberOfChildren hash];
}

- (id)_duration
{
  return self->_reservationDuration;
}

- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren
{
  return [(INLodgingReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 lodgingBusinessLocation:lodgingBusinessLocation reservationDuration:reservationDuration numberOfAdults:numberOfAdults numberOfChildren:numberOfChildren];
}

- (INLodgingReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL lodgingBusinessLocation:(CLPlacemark *)lodgingBusinessLocation reservationDuration:(INDateComponentsRange *)reservationDuration numberOfAdults:(NSNumber *)numberOfAdults numberOfChildren:(NSNumber *)numberOfChildren
{
  uint64_t v18 = lodgingBusinessLocation;
  v19 = reservationDuration;
  uint64_t v20 = numberOfAdults;
  v21 = numberOfChildren;
  v34.receiver = self;
  v34.super_class = (Class)INLodgingReservation;
  v22 = [(INReservation *)&v34 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v22)
  {
    uint64_t v23 = [(CLPlacemark *)v18 copy];
    v24 = v22->_lodgingBusinessLocation;
    v22->_lodgingBusinessLocation = (CLPlacemark *)v23;

    uint64_t v25 = [(INDateComponentsRange *)v19 copy];
    v26 = v22->_reservationDuration;
    v22->_reservationDuration = (INDateComponentsRange *)v25;

    uint64_t v27 = [(NSNumber *)v20 copy];
    v28 = v22->_numberOfAdults;
    v22->_numberOfAdults = (NSNumber *)v27;

    uint64_t v29 = [(NSNumber *)v21 copy];
    v30 = v22->_numberOfChildren;
    v22->_numberOfChildren = (NSNumber *)v29;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end