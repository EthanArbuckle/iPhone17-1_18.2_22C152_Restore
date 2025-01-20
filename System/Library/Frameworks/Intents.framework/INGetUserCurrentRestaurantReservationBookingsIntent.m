@interface INGetUserCurrentRestaurantReservationBookingsIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (BOOL)isEqual:(id)a3;
- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithCoder:(id)a3;
- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant reservationIdentifier:(NSString *)reservationIdentifier maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults;
- (INRestaurant)restaurant;
- (NSDate)earliestBookingDateForResults;
- (NSNumber)maximumNumberOfResults;
- (NSString)reservationIdentifier;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults;
- (void)setMaximumNumberOfResults:(NSNumber *)maximumNumberOfResults;
- (void)setReservationIdentifier:(NSString *)reservationIdentifier;
- (void)setRestaurant:(INRestaurant *)restaurant;
@end

@implementation INGetUserCurrentRestaurantReservationBookingsIntent

- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
}

+ (id)intentDescription
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__INGetUserCurrentRestaurantReservationBookingsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_39133 != -1) {
    dispatch_once(&intentDescription_onceToken_39133, block);
  }
  v2 = (void *)intentDescription_intentDescription_39134;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfResults, 0);
  objc_storeStrong((id *)&self->_reservationIdentifier, 0);

  objc_storeStrong((id *)&self->_restaurant, 0);
}

- (NSDate)earliestBookingDateForResults
{
  return self->_earliestBookingDateForResults;
}

- (void)setMaximumNumberOfResults:(NSNumber *)maximumNumberOfResults
{
}

- (NSNumber)maximumNumberOfResults
{
  return self->_maximumNumberOfResults;
}

- (void)setReservationIdentifier:(NSString *)reservationIdentifier
{
}

- (NSString)reservationIdentifier
{
  return self->_reservationIdentifier;
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
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"restaurant";
  restaurant = self->_restaurant;
  v4 = restaurant;
  if (!restaurant)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"reservationIdentifier";
  reservationIdentifier = self->_reservationIdentifier;
  v6 = reservationIdentifier;
  if (!reservationIdentifier)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"maximumNumberOfResults";
  maximumNumberOfResults = self->_maximumNumberOfResults;
  v8 = maximumNumberOfResults;
  if (!maximumNumberOfResults)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"earliestBookingDateForResults";
  earliestBookingDateForResults = self->_earliestBookingDateForResults;
  v10 = earliestBookingDateForResults;
  if (!earliestBookingDateForResults)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (earliestBookingDateForResults)
  {
    if (maximumNumberOfResults) {
      goto LABEL_11;
    }
  }
  else
  {

    if (maximumNumberOfResults)
    {
LABEL_11:
      if (reservationIdentifier) {
        goto LABEL_12;
      }
LABEL_18:

      if (restaurant) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!reservationIdentifier) {
    goto LABEL_18;
  }
LABEL_12:
  if (restaurant) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  id v4 = [(INIntent *)&v10 copyWithZone:a3];
  v5 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self restaurant];
  [v4 setRestaurant:v5];

  v6 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self reservationIdentifier];
  [v4 setReservationIdentifier:v6];

  v7 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
  [v4 setMaximumNumberOfResults:v7];

  v8 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
  [v4 setEarliestBookingDateForResults:v8];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (INGetUserCurrentRestaurantReservationBookingsIntent *)a3;
  v8 = v7;
  if (self == v7)
  {
    char v11 = 1;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v8;
        objc_super v10 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 restaurant];
        if (v10
          || ([(INGetUserCurrentRestaurantReservationBookingsIntent *)self restaurant],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (v10)
          {
LABEL_12:

            v12 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 reservationIdentifier];
            if (v12
              || ([(INGetUserCurrentRestaurantReservationBookingsIntent *)self reservationIdentifier], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v5 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 reservationIdentifier];
              v13 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self reservationIdentifier];
              if (v13)
              {
                v14 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self reservationIdentifier];
                char v15 = [v5 isEqualToString:v14];
              }
              else
              {
                char v15 = [v5 isEqualToString:&stru_1EDA6DB28];
              }

              if (v12)
              {
LABEL_21:

                v16 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 maximumNumberOfResults];
                if (v16
                  || ([(INGetUserCurrentRestaurantReservationBookingsIntent *)self maximumNumberOfResults], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v17 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 maximumNumberOfResults];
                  v18 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
                  if (v18)
                  {
                    v19 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
                    char v20 = [v17 isEqualToNumber:v19];
                  }
                  else
                  {
                    char v20 = [v17 isEqualToNumber:&unk_1EDBA7528];
                  }

                  if (v16)
                  {
LABEL_30:

                    v21 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 earliestBookingDateForResults];
                    if (v21
                      || ([(INGetUserCurrentRestaurantReservationBookingsIntent *)self earliestBookingDateForResults], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      v22 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)v9 earliestBookingDateForResults];
                      v23 = [(INGetUserCurrentRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
                      if (v23) {
                        [(INGetUserCurrentRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
                      }
                      else {
                      v24 = [MEMORY[0x1E4F1C9C8] distantPast];
                      }
                      char v25 = [v22 isEqualToDate:v24];

                      if (v21) {
                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      char v25 = 1;
                    }

LABEL_39:
                    char v11 = isKindOfClass & v15 & v20 & v25;

                    goto LABEL_40;
                  }
                }
                else
                {
                  char v20 = 1;
                }

                goto LABEL_30;
              }
            }
            else
            {
              char v15 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          char isKindOfClass = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_40:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  id v4 = a3;
  [(INIntent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, @"restaurant", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_reservationIdentifier forKey:@"reservationIdentifier"];
  [v4 encodeObject:self->_maximumNumberOfResults forKey:@"maximumNumberOfResults"];
  [v4 encodeObject:self->_earliestBookingDateForResults forKey:@"earliestBookingDateForResults"];
}

- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  objc_super v5 = [(INIntent *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurant"];
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservationIdentifier"];
    reservationIdentifier = v5->_reservationIdentifier;
    v5->_reservationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumNumberOfResults"];
    maximumNumberOfResults = v5->_maximumNumberOfResults;
    v5->_maximumNumberOfResults = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestBookingDateForResults"];
    earliestBookingDateForResults = v5->_earliestBookingDateForResults;
    v5->_earliestBookingDateForResults = (NSDate *)v12;
  }
  return v5;
}

- (INGetUserCurrentRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant reservationIdentifier:(NSString *)reservationIdentifier maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
  uint64_t v10 = restaurant;
  char v11 = reservationIdentifier;
  uint64_t v12 = maximumNumberOfResults;
  v13 = earliestBookingDateForResults;
  v17.receiver = self;
  v17.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntent;
  v14 = [(INIntent *)&v17 init];
  objc_super v15 = v14;
  if (v14)
  {
    [(INGetUserCurrentRestaurantReservationBookingsIntent *)v14 setRestaurant:v10];
    [(INGetUserCurrentRestaurantReservationBookingsIntent *)v15 setReservationIdentifier:v11];
    [(INGetUserCurrentRestaurantReservationBookingsIntent *)v15 setMaximumNumberOfResults:v12];
    [(INGetUserCurrentRestaurantReservationBookingsIntent *)v15 setEarliestBookingDateForResults:v13];
  }

  return v15;
}

void __72__INGetUserCurrentRestaurantReservationBookingsIntent_intentDescription__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = [[INIntentSlotDescription alloc] initWithName:@"restaurant", 1, @"restaurant", 0, 0, 0, 0, 1, &unk_1EDBAAF38, &unk_1EDBAAF50, objc_opt_class(), sel_resolveRestaurantForGetUserCurrentRestaurantReservationBookings_withCompletion_, 0, @"restaurant" tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v6[0] = v0;
  v5[1] = @"reservationIdentifier";
  v1 = [[INIntentSlotDescription alloc] initWithName:@"reservationIdentifier" tag:2 facadePropertyName:@"reservationIdentifier" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  v3 = [[INIntentDescription alloc] initWithName:@"GetUserCurrentRestaurantReservationBookingsIntent" responseName:@"GetUserCurrentRestaurantReservationBookingsIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleGetUserCurrentRestaurantReservationBookings_completion_ confirmSelector:sel_confirmGetUserCurrentRestaurantReservationBookings_completion_ slotsByName:v2];
  id v4 = (void *)intentDescription_intentDescription_39134;
  intentDescription_intentDescription_39134 = (uint64_t)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end