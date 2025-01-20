@interface INRestaurantReservationBooking
+ (BOOL)supportsSecureCoding;
- (BOOL)isBookingAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresEmailAddress;
- (BOOL)requiresManualRequest;
- (BOOL)requiresName;
- (BOOL)requiresPhoneNumber;
- (INRestaurant)restaurant;
- (INRestaurantReservationBooking)init;
- (INRestaurantReservationBooking)initWithCoder:(id)a3;
- (INRestaurantReservationBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier;
- (NSArray)offers;
- (NSDate)bookingDate;
- (NSString)bookingDescription;
- (NSString)bookingIdentifier;
- (NSString)description;
- (NSUInteger)partySize;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBookingAvailable:(BOOL)bookingAvailable;
- (void)setBookingDate:(NSDate *)bookingDate;
- (void)setBookingDescription:(NSString *)bookingDescription;
- (void)setBookingIdentifier:(NSString *)bookingIdentifier;
- (void)setOffers:(NSArray *)offers;
- (void)setPartySize:(NSUInteger)partySize;
- (void)setRequiresEmailAddress:(BOOL)requiresEmailAddress;
- (void)setRequiresManualRequest:(BOOL)requiresManualRequest;
- (void)setRequiresName:(BOOL)requiresName;
- (void)setRequiresPhoneNumber:(BOOL)requiresPhoneNumber;
- (void)setRestaurant:(INRestaurant *)restaurant;
@end

@implementation INRestaurantReservationBooking

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_bookingIdentifier, 0);
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_bookingDescription, 0);

  objc_storeStrong((id *)&self->_restaurant, 0);
}

- (void)setRequiresPhoneNumber:(BOOL)requiresPhoneNumber
{
  self->_requiresPhoneNumber = requiresPhoneNumber;
}

- (BOOL)requiresPhoneNumber
{
  return self->_requiresPhoneNumber;
}

- (void)setRequiresName:(BOOL)requiresName
{
  self->_requiresName = requiresName;
}

- (BOOL)requiresName
{
  return self->_requiresName;
}

- (void)setRequiresEmailAddress:(BOOL)requiresEmailAddress
{
  self->_requiresEmailAddress = requiresEmailAddress;
}

- (BOOL)requiresEmailAddress
{
  return self->_requiresEmailAddress;
}

- (void)setRequiresManualRequest:(BOOL)requiresManualRequest
{
  self->_requiresManualRequest = requiresManualRequest;
}

- (BOOL)requiresManualRequest
{
  return self->_requiresManualRequest;
}

- (void)setOffers:(NSArray *)offers
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setBookingAvailable:(BOOL)bookingAvailable
{
  self->_bookingAvailable = bookingAvailable;
}

- (BOOL)isBookingAvailable
{
  return self->_bookingAvailable;
}

- (void)setBookingIdentifier:(NSString *)bookingIdentifier
{
}

- (NSString)bookingIdentifier
{
  return self->_bookingIdentifier;
}

- (void)setPartySize:(NSUInteger)partySize
{
  self->_partySize = partySize;
}

- (NSUInteger)partySize
{
  return self->_partySize;
}

- (void)setBookingDate:(NSDate *)bookingDate
{
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
}

- (void)setBookingDescription:(NSString *)bookingDescription
{
}

- (NSString)bookingDescription
{
  return self->_bookingDescription;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (id)_dictionaryRepresentation
{
  v26[11] = *MEMORY[0x1E4F143B8];
  uint64_t restaurant = (uint64_t)self->_restaurant;
  uint64_t v24 = restaurant;
  v25[0] = @"restaurant";
  if (!restaurant)
  {
    uint64_t restaurant = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)restaurant;
  v26[0] = restaurant;
  v25[1] = @"bookingDescription";
  uint64_t bookingDescription = (uint64_t)self->_bookingDescription;
  uint64_t v23 = bookingDescription;
  if (!bookingDescription)
  {
    uint64_t bookingDescription = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)bookingDescription;
  v26[1] = bookingDescription;
  v25[2] = @"bookingDate";
  bookingDate = self->_bookingDate;
  uint64_t v6 = (uint64_t)bookingDate;
  if (!bookingDate)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v6;
  v26[2] = v6;
  v25[3] = @"partySize";
  v22 = [NSNumber numberWithUnsignedInteger:self->_partySize];
  v26[3] = v22;
  v25[4] = @"bookingIdentifier";
  bookingIdentifier = self->_bookingIdentifier;
  uint64_t v8 = (uint64_t)bookingIdentifier;
  if (!bookingIdentifier)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v8;
  v26[4] = v8;
  v25[5] = @"isBookingAvailable";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INRestaurantReservationBooking isBookingAvailable](self, "isBookingAvailable"));
  v26[5] = v9;
  v25[6] = @"offers";
  offers = self->_offers;
  v11 = offers;
  if (!offers)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[6] = v11;
  v25[7] = @"requiresManualRequest";
  v12 = [NSNumber numberWithBool:self->_requiresManualRequest];
  v26[7] = v12;
  v25[8] = @"requiresEmailAddress";
  v13 = [NSNumber numberWithBool:self->_requiresEmailAddress];
  v26[8] = v13;
  v25[9] = @"requiresName";
  v14 = [NSNumber numberWithBool:self->_requiresName];
  v26[9] = v14;
  v25[10] = @"requiresPhoneNumber";
  v15 = [NSNumber numberWithBool:self->_requiresPhoneNumber];
  v26[10] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:11];

  if (!offers) {
  if (!bookingIdentifier)
  }

  if (!bookingDate) {
  if (!v23)
  }

  if (!v24) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantReservationBooking;
  uint64_t v6 = [(INRestaurantReservationBooking *)&v11 description];
  v7 = [(INRestaurantReservationBooking *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRestaurantReservationBooking *)self descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INRestaurantReservationBooking *)a3;
  uint64_t v6 = v5;
  if (v5 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (v5)
    {
      v7 = objc_opt_class();
      if ([v7 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v8 = v6;
        v9 = [(INRestaurantReservationBooking *)v8 bookingDescription];
        if (v9
          || ([(INRestaurantReservationBooking *)self bookingDescription],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v10 = [(INRestaurantReservationBooking *)v8 bookingDescription];
          objc_super v11 = [(INRestaurantReservationBooking *)self bookingDescription];
          if (v11)
          {
            v12 = [(INRestaurantReservationBooking *)self bookingDescription];
            int v13 = [v10 isEqualToString:v12];
          }
          else
          {
            int v13 = [v10 isEqualToString:&stru_1EDA6DB28];
          }

          if (v9)
          {
LABEL_15:

            v15 = [(INRestaurantReservationBooking *)v8 offers];
            if (v15
              || ([(INRestaurantReservationBooking *)self offers],
                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v16 = [(INRestaurantReservationBooking *)v8 offers];
              v17 = [(INRestaurantReservationBooking *)self offers];
              if (v17)
              {
                v18 = [(INRestaurantReservationBooking *)self offers];
                int v19 = [v16 isEqualToArray:v18];
              }
              else
              {
                int v19 = [v16 isEqualToArray:MEMORY[0x1E4F1CBF0]];
              }

              if (v15)
              {
LABEL_24:

                v20 = [(INRestaurantReservationBooking *)v8 restaurant];
                v21 = [(INRestaurantReservationBooking *)self restaurant];
                if (([v20 isEqual:v21] & v13) != 1)
                {
                  LOBYTE(v14) = 0;
LABEL_38:

                  goto LABEL_39;
                }
                v22 = [(INRestaurantReservationBooking *)v8 bookingDate];
                uint64_t v23 = [(INRestaurantReservationBooking *)self bookingDate];
                if (![v22 isEqualToDate:v23]
                  || (uint64_t v24 = [(INRestaurantReservationBooking *)v8 partySize],
                      v24 != [(INRestaurantReservationBooking *)self partySize]))
                {
                  LOBYTE(v14) = 0;
                  goto LABEL_37;
                }
                v25 = [(INRestaurantReservationBooking *)v8 bookingIdentifier];
                v33 = [(INRestaurantReservationBooking *)self bookingIdentifier];
                if (objc_msgSend(v25, "isEqualToString:"))
                {
                  v32 = v25;
                  BOOL v26 = [(INRestaurantReservationBooking *)v8 isBookingAvailable];
                  LOBYTE(v14) = 0;
                  if (v26 != [(INRestaurantReservationBooking *)self isBookingAvailable])
                  {
                    v25 = v32;
                    goto LABEL_34;
                  }
                  v25 = v32;
                  if ((v19 ^ 1))
                  {
LABEL_34:

LABEL_37:
                    goto LABEL_38;
                  }
                  BOOL v27 = [(INRestaurantReservationBooking *)v8 requiresManualRequest];
                  if (v27 == [(INRestaurantReservationBooking *)self requiresManualRequest])
                  {
                    BOOL v28 = [(INRestaurantReservationBooking *)v8 requiresName];
                    if (v28 == [(INRestaurantReservationBooking *)self requiresName])
                    {
                      BOOL v29 = [(INRestaurantReservationBooking *)v8 requiresPhoneNumber];
                      if (v29 == [(INRestaurantReservationBooking *)self requiresPhoneNumber])
                      {
                        BOOL v31 = [(INRestaurantReservationBooking *)v8 requiresEmailAddress];
                        int v14 = v31 ^ [(INRestaurantReservationBooking *)self requiresEmailAddress] ^ 1;
                        goto LABEL_34;
                      }
                    }
                  }
                }
                LOBYTE(v14) = 0;
                goto LABEL_34;
              }
            }
            else
            {
              int v19 = 1;
            }

            goto LABEL_24;
          }
        }
        else
        {
          int v13 = 1;
        }

        goto LABEL_15;
      }
    }
    LOBYTE(v14) = 0;
  }
LABEL_39:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(INRestaurantReservationBooking *)self restaurant];
  [v4 setRestaurant:v5];

  uint64_t v6 = [(INRestaurantReservationBooking *)self bookingDescription];
  [v4 setBookingDescription:v6];

  v7 = [(INRestaurantReservationBooking *)self bookingDate];
  [v4 setBookingDate:v7];

  objc_msgSend(v4, "setPartySize:", -[INRestaurantReservationBooking partySize](self, "partySize"));
  uint64_t v8 = [(INRestaurantReservationBooking *)self bookingIdentifier];
  [v4 setBookingIdentifier:v8];

  objc_msgSend(v4, "setBookingAvailable:", -[INRestaurantReservationBooking isBookingAvailable](self, "isBookingAvailable"));
  v9 = [(INRestaurantReservationBooking *)self offers];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    objc_super v11 = [(INRestaurantReservationBooking *)self offers];
    v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setOffers:v12];
  }
  objc_msgSend(v4, "setRequiresManualRequest:", -[INRestaurantReservationBooking requiresManualRequest](self, "requiresManualRequest"));
  objc_msgSend(v4, "setRequiresName:", -[INRestaurantReservationBooking requiresName](self, "requiresName"));
  objc_msgSend(v4, "setRequiresPhoneNumber:", -[INRestaurantReservationBooking requiresPhoneNumber](self, "requiresPhoneNumber"));
  objc_msgSend(v4, "setRequiresEmailAddress:", -[INRestaurantReservationBooking requiresEmailAddress](self, "requiresEmailAddress"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t restaurant = self->_restaurant;
  id v5 = a3;
  [v5 encodeObject:restaurant forKey:@"restaurant"];
  [v5 encodeObject:self->_bookingDescription forKey:@"bookingDescription"];
  [v5 encodeObject:self->_bookingDate forKey:@"bookingDate"];
  [v5 encodeInteger:self->_partySize forKey:@"partySize"];
  [v5 encodeObject:self->_bookingIdentifier forKey:@"bookingIdentifier"];
  [v5 encodeBool:self->_bookingAvailable forKey:@"isBookingAvailable"];
  [v5 encodeObject:self->_offers forKey:@"offers"];
  [v5 encodeBool:self->_requiresManualRequest forKey:@"requiresManualRequest"];
  [v5 encodeBool:self->_requiresName forKey:@"requiresName"];
  [v5 encodeBool:self->_requiresPhoneNumber forKey:@"requiresPhoneNumber"];
  [v5 encodeBool:self->_requiresEmailAddress forKey:@"requiresEmailAddress"];
}

- (INRestaurantReservationBooking)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INRestaurantReservationBooking *)self init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurant"];
  if (!v6)
  {
    v20 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[INRestaurantReservationBooking initWithCoder:]";
    __int16 v24 = 2080;
    v25 = "_restaurant";
LABEL_13:
    _os_log_error_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
    goto LABEL_14;
  }
  uint64_t restaurant = v5->_restaurant;
  v5->_uint64_t restaurant = (INRestaurant *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingDate"];
  if (!v8)
  {
    v20 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[INRestaurantReservationBooking initWithCoder:]";
    __int16 v24 = 2080;
    v25 = "_bookingDate";
    goto LABEL_13;
  }
  bookingDate = v5->_bookingDate;
  v5->_bookingDate = (NSDate *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingIdentifier"];
  if (!v10)
  {
    v20 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[INRestaurantReservationBooking initWithCoder:]";
      __int16 v24 = 2080;
      v25 = "_bookingIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    int v19 = 0;
    goto LABEL_15;
  }
  bookingIdentifier = v5->_bookingIdentifier;
  v5->_bookingIdentifier = (NSString *)v10;

  v5->_partySize = [v4 decodeIntegerForKey:@"partySize"];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingDescription"];
  uint64_t bookingDescription = v5->_bookingDescription;
  v5->_uint64_t bookingDescription = (NSString *)v12;

  v5->_bookingAvailable = [v4 decodeBoolForKey:@"isBookingAvailable"];
  int v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"offers"];
  offers = v5->_offers;
  v5->_offers = (NSArray *)v17;

  v5->_requiresManualRequest = [v4 decodeBoolForKey:@"requiresManualRequest"];
  v5->_requiresName = [v4 decodeBoolForKey:@"requiresName"];
  v5->_requiresPhoneNumber = [v4 decodeBoolForKey:@"requiresPhoneNumber"];
  v5->_requiresEmailAddress = [v4 decodeBoolForKey:@"requiresEmailAddress"];
LABEL_6:
  int v19 = v5;
LABEL_15:

  return v19;
}

- (INRestaurantReservationBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier
{
  uint64_t v10 = restaurant;
  objc_super v11 = bookingDate;
  uint64_t v12 = bookingIdentifier;
  v21.receiver = self;
  v21.super_class = (Class)INRestaurantReservationBooking;
  int v13 = [(INRestaurantReservationBooking *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [(INRestaurant *)v10 copy];
    uint64_t v15 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v14;

    uint64_t v16 = [(NSDate *)v11 copy];
    uint64_t v17 = (void *)*((void *)v13 + 4);
    *((void *)v13 + 4) = v16;

    *((void *)v13 + 5) = partySize;
    uint64_t v18 = [(NSString *)v12 copy];
    int v19 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v18;

    v13[8] = 1;
    *(_DWORD *)(v13 + 9) = 0;
  }

  return (INRestaurantReservationBooking *)v13;
}

- (INRestaurantReservationBooking)init
{
  v3 = [INRestaurant alloc];
  id v4 = objc_opt_new();
  id v5 = [(INRestaurant *)v3 initWithLocation:v4 name:&stru_1EDA6DB28 vendorIdentifier:&stru_1EDA6DB28 restaurantIdentifier:&stru_1EDA6DB28];

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [(INRestaurantReservationBooking *)self initWithRestaurant:v5 bookingDate:v6 partySize:0 bookingIdentifier:&stru_1EDA6DB28];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end