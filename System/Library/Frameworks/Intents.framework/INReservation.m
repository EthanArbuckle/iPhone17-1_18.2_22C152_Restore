@interface INReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)_duration;
- (INReservation)initWithCoder:(id)a3;
- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8;
- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 URL:(id)a9;
- (INReservationStatus)reservationStatus;
- (INSpeakableString)itemReference;
- (NSArray)actions;
- (NSDate)bookingTime;
- (NSString)reservationHolderName;
- (NSString)reservationNumber;
- (NSURL)URL;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)url;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__duration, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_reservationHolderName, 0);
  objc_storeStrong((id *)&self->_bookingTime, 0);
  objc_storeStrong((id *)&self->_reservationNumber, 0);

  objc_storeStrong((id *)&self->_itemReference, 0);
}

- (INDateComponentsRange)_duration
{
  return self->__duration;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)reservationHolderName
{
  return self->_reservationHolderName;
}

- (INReservationStatus)reservationStatus
{
  return self->_reservationStatus;
}

- (NSDate)bookingTime
{
  return self->_bookingTime;
}

- (NSString)reservationNumber
{
  return self->_reservationNumber;
}

- (INSpeakableString)itemReference
{
  return self->_itemReference;
}

- (id)_dictionaryRepresentation
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = @"itemReference";
  itemReference = self->_itemReference;
  uint64_t v4 = (uint64_t)itemReference;
  if (!itemReference)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = @"reservationNumber";
  reservationNumber = self->_reservationNumber;
  uint64_t v6 = (uint64_t)reservationNumber;
  if (!reservationNumber)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = @"bookingTime";
  bookingTime = self->_bookingTime;
  v8 = bookingTime;
  if (!bookingTime)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[2] = v8;
  v18[3] = @"reservationStatus";
  v9 = [NSNumber numberWithInteger:self->_reservationStatus];
  v19[3] = v9;
  v18[4] = @"reservationHolderName";
  reservationHolderName = self->_reservationHolderName;
  v11 = reservationHolderName;
  if (!reservationHolderName)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v11;
  v18[5] = @"URL";
  URL = self->_URL;
  v13 = URL;
  if (!URL)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  if (URL)
  {
    if (reservationHolderName) {
      goto LABEL_13;
    }
  }
  else
  {

    if (reservationHolderName) {
      goto LABEL_13;
    }
  }

LABEL_13:
  if (bookingTime)
  {
    if (reservationNumber) {
      goto LABEL_15;
    }
LABEL_22:

    if (itemReference) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }

  if (!reservationNumber) {
    goto LABEL_22;
  }
LABEL_15:
  if (itemReference) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v14;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INReservation;
  uint64_t v6 = [(INReservation *)&v11 description];
  v7 = [(INReservation *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INReservation *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  itemReference = self->_itemReference;
  id v5 = a3;
  [v5 encodeObject:itemReference forKey:@"itemReference"];
  [v5 encodeObject:self->_reservationNumber forKey:@"reservationNumber"];
  [v5 encodeObject:self->_bookingTime forKey:@"bookingTime"];
  [v5 encodeInteger:self->_reservationStatus forKey:@"reservationStatus"];
  [v5 encodeObject:self->_reservationHolderName forKey:@"reservationHolderName"];
  [v5 encodeObject:self->_URL forKey:@"URL"];
}

- (INReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INReservation;
  id v5 = [(INReservation *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemReference"];
    itemReference = v5->_itemReference;
    v5->_itemReference = (INSpeakableString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationNumber"];
    reservationNumber = v5->_reservationNumber;
    v5->_reservationNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingTime"];
    bookingTime = v5->_bookingTime;
    v5->_bookingTime = (NSDate *)v10;

    v5->_reservationStatus = [v4 decodeIntegerForKey:@"reservationStatus"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationHolderName"];
    reservationHolderName = v5->_reservationHolderName;
    v5->_reservationHolderName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INReservation *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      itemReference = self->_itemReference;
      BOOL v12 = 0;
      if (itemReference == v5->_itemReference || -[INSpeakableString isEqual:](itemReference, "isEqual:"))
      {
        reservationNumber = self->_reservationNumber;
        if (reservationNumber == v5->_reservationNumber
          || -[NSString isEqual:](reservationNumber, "isEqual:"))
        {
          bookingTime = self->_bookingTime;
          if ((bookingTime == v5->_bookingTime || -[NSDate isEqual:](bookingTime, "isEqual:"))
            && self->_reservationStatus == v5->_reservationStatus)
          {
            reservationHolderName = self->_reservationHolderName;
            if (reservationHolderName == v5->_reservationHolderName
              || -[NSString isEqual:](reservationHolderName, "isEqual:"))
            {
              actions = self->_actions;
              if (actions == v5->_actions || -[NSArray isEqual:](actions, "isEqual:"))
              {
                URL = self->_URL;
                if (URL == v5->_URL || -[NSURL isEqual:](URL, "isEqual:")) {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_itemReference hash];
  NSUInteger v4 = [(NSString *)self->_reservationNumber hash] ^ v3;
  uint64_t v5 = v4 ^ [(NSDate *)self->_bookingTime hash];
  uint64_t v6 = [NSNumber numberWithInteger:self->_reservationStatus];
  uint64_t v7 = v5 ^ [v6 hash];
  NSUInteger v8 = [(NSString *)self->_reservationHolderName hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_actions hash];
  unint64_t v10 = v7 ^ v9 ^ [(NSURL *)self->_URL hash];

  return v10;
}

- (id)url
{
  return self->_URL;
}

- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 URL:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)INReservation;
  v21 = [(INReservation *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    itemReference = v21->_itemReference;
    v21->_itemReference = (INSpeakableString *)v22;

    uint64_t v24 = [v16 copy];
    reservationNumber = v21->_reservationNumber;
    v21->_reservationNumber = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    bookingTime = v21->_bookingTime;
    v21->_bookingTime = (NSDate *)v26;

    v21->_reservationStatus = a6;
    uint64_t v28 = [v18 copy];
    reservationHolderName = v21->_reservationHolderName;
    v21->_reservationHolderName = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    actions = v21->_actions;
    v21->_actions = (NSArray *)v30;

    uint64_t v32 = [v20 copy];
    URL = v21->_URL;
    v21->_URL = (NSURL *)v32;
  }
  return v21;
}

- (INReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8
{
  return [(INReservation *)self initWithItemReference:a3 reservationNumber:a4 bookingTime:a5 reservationStatus:a6 reservationHolderName:a7 actions:a8 URL:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end