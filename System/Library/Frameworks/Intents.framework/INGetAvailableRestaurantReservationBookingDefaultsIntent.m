@interface INGetAvailableRestaurantReservationBookingDefaultsIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (BOOL)isEqual:(id)a3;
- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithCoder:(id)a3;
- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithRestaurant:(INRestaurant *)restaurant;
- (INRestaurant)restaurant;
- (id)_dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setRestaurant:(INRestaurant *)restaurant;
@end

@implementation INGetAvailableRestaurantReservationBookingDefaultsIntent

- (void).cxx_destruct
{
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
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"restaurant";
  restaurant = self->_restaurant;
  v3 = restaurant;
  if (!restaurant)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!restaurant) {

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INGetAvailableRestaurantReservationBookingDefaultsIntent *)a3;
  v6 = v5;
  if (v5 == self)
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
        v8 = [(INGetAvailableRestaurantReservationBookingDefaultsIntent *)v7 restaurant];
        if (v8
          || ([(INGetAvailableRestaurantReservationBookingDefaultsIntent *)self restaurant],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = [(INGetAvailableRestaurantReservationBookingDefaultsIntent *)v7 restaurant];
          v10 = [(INGetAvailableRestaurantReservationBookingDefaultsIntent *)self restaurant];
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

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  id v4 = a3;
  [(INIntent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_restaurant, @"restaurant", v5.receiver, v5.super_class);
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  objc_super v5 = [(INIntent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurant"];
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;
  }
  return v5;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntent)initWithRestaurant:(INRestaurant *)restaurant
{
  id v4 = restaurant;
  v8.receiver = self;
  v8.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntent;
  objc_super v5 = [(INIntent *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(INGetAvailableRestaurantReservationBookingDefaultsIntent *)v5 setRestaurant:v4];
  }

  return v6;
}

+ (id)intentDescription
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__INGetAvailableRestaurantReservationBookingDefaultsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken != -1) {
    dispatch_once(&intentDescription_onceToken, block);
  }
  v2 = (void *)intentDescription_intentDescription;

  return v2;
}

void __77__INGetAvailableRestaurantReservationBookingDefaultsIntent_intentDescription__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = [[INIntentSlotDescription alloc] initWithName:@"restaurant", 1, @"restaurant", 0, 0, 0, 0, 1, &unk_1EDBAAEF0, &unk_1EDBAAF08, objc_opt_class(), sel_resolveRestaurantForGetAvailableRestaurantReservationBookingDefaults_withCompletion_, 0, @"restaurant" tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  v2 = [[INIntentDescription alloc] initWithName:@"GetAvailableRestaurantReservationBookingDefaultsIntent" responseName:@"GetAvailableRestaurantReservationBookingDefaultsIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleGetAvailableRestaurantReservationBookingDefaults_completion_ confirmSelector:sel_confirmGetAvailableRestaurantReservationBookingDefaults_completion_ slotsByName:v1];
  v3 = (void *)intentDescription_intentDescription;
  intentDescription_intentDescription = (uint64_t)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end