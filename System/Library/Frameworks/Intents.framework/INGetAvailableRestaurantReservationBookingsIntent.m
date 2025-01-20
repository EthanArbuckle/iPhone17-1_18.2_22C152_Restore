@interface INGetAvailableRestaurantReservationBookingsIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (BOOL)isEqual:(id)a3;
- (INGetAvailableRestaurantReservationBookingsIntent)initWithCoder:(id)a3;
- (INGetAvailableRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant partySize:(NSUInteger)partySize preferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults latestBookingDateForResults:(NSDate *)latestBookingDateForResults;
- (INRestaurant)restaurant;
- (NSDate)earliestBookingDateForResults;
- (NSDate)latestBookingDateForResults;
- (NSDate)preferredBookingDate;
- (NSDateComponents)preferredBookingDateComponents;
- (NSNumber)maximumNumberOfResults;
- (NSUInteger)partySize;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults;
- (void)setLatestBookingDateForResults:(NSDate *)latestBookingDateForResults;
- (void)setMaximumNumberOfResults:(NSNumber *)maximumNumberOfResults;
- (void)setPartySize:(NSUInteger)partySize;
- (void)setPreferredBookingDate:(id)a3;
- (void)setPreferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents;
- (void)setRestaurant:(INRestaurant *)restaurant;
@end

@implementation INGetAvailableRestaurantReservationBookingsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredBookingDate, 0);
  objc_storeStrong((id *)&self->_latestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_earliestBookingDateForResults, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfResults, 0);
  objc_storeStrong((id *)&self->_preferredBookingDateComponents, 0);

  objc_storeStrong((id *)&self->_restaurant, 0);
}

- (void)setPreferredBookingDate:(id)a3
{
}

- (NSDate)preferredBookingDate
{
  return self->_preferredBookingDate;
}

- (void)setLatestBookingDateForResults:(NSDate *)latestBookingDateForResults
{
}

- (NSDate)latestBookingDateForResults
{
  return self->_latestBookingDateForResults;
}

- (void)setEarliestBookingDateForResults:(NSDate *)earliestBookingDateForResults
{
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

- (void)setPreferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents
{
}

- (NSDateComponents)preferredBookingDateComponents
{
  return self->_preferredBookingDateComponents;
}

- (void)setPartySize:(NSUInteger)partySize
{
  self->_partySize = partySize;
}

- (NSUInteger)partySize
{
  return self->_partySize;
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
  v18[6] = *MEMORY[0x1E4F143B8];
  v17[0] = @"restaurant";
  restaurant = self->_restaurant;
  uint64_t v4 = (uint64_t)restaurant;
  if (!restaurant)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"partySize";
  v16 = [NSNumber numberWithUnsignedInteger:self->_partySize];
  v18[1] = v16;
  v17[2] = @"preferredBookingDateComponents";
  preferredBookingDateComponents = self->_preferredBookingDateComponents;
  v6 = preferredBookingDateComponents;
  if (!preferredBookingDateComponents)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v6;
  v17[3] = @"maximumNumberOfResults";
  maximumNumberOfResults = self->_maximumNumberOfResults;
  v8 = maximumNumberOfResults;
  if (!maximumNumberOfResults)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v8;
  v17[4] = @"earliestBookingDateForResults";
  earliestBookingDateForResults = self->_earliestBookingDateForResults;
  v10 = earliestBookingDateForResults;
  if (!earliestBookingDateForResults)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v10;
  v17[5] = @"latestBookingDateForResults";
  latestBookingDateForResults = self->_latestBookingDateForResults;
  v12 = latestBookingDateForResults;
  if (!latestBookingDateForResults)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[5] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
  if (latestBookingDateForResults)
  {
    if (earliestBookingDateForResults) {
      goto LABEL_13;
    }
  }
  else
  {

    if (earliestBookingDateForResults)
    {
LABEL_13:
      if (maximumNumberOfResults) {
        goto LABEL_14;
      }
LABEL_22:

      if (preferredBookingDateComponents) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }

  if (!maximumNumberOfResults) {
    goto LABEL_22;
  }
LABEL_14:
  if (preferredBookingDateComponents) {
    goto LABEL_15;
  }
LABEL_23:

LABEL_15:
  if (!restaurant) {

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  id v4 = [(INIntent *)&v12 copyWithZone:a3];
  v5 = [(INGetAvailableRestaurantReservationBookingsIntent *)self restaurant];
  [v4 setRestaurant:v5];

  objc_msgSend(v4, "setPartySize:", -[INGetAvailableRestaurantReservationBookingsIntent partySize](self, "partySize"));
  v6 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
  [v4 setMaximumNumberOfResults:v6];

  v7 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
  [v4 setEarliestBookingDateForResults:v7];

  v8 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];
  [v4 setLatestBookingDateForResults:v8];

  v9 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDateComponents];
  [v4 setPreferredBookingDateComponents:v9];

  v10 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDate];
  [v4 setPreferredBookingDate:v10];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INGetAvailableRestaurantReservationBookingsIntent *)a3;
  v6 = v5;
  if (self == v5)
  {
    char v10 = 1;
    goto LABEL_37;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v10 = 0;
    goto LABEL_37;
  }
  v7 = v6;
  v8 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 preferredBookingDateComponents];
  if (v8)
  {
    char v9 = 0;
  }
  else
  {
    v11 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDateComponents];
    char v9 = v11 == 0;
  }
  uint64_t v12 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 preferredBookingDateComponents];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDateComponents];

    if (v14)
    {
      v15 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 preferredBookingDateComponents];
      v16 = [(INGetAvailableRestaurantReservationBookingsIntent *)self preferredBookingDateComponents];
      char v9 = [v15 isEqual:v16];
    }
  }
  v17 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 maximumNumberOfResults];
  if (!v17)
  {
    v3 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
    if (!v3)
    {
      char v20 = 1;
LABEL_17:

      goto LABEL_18;
    }
  }
  v18 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 maximumNumberOfResults];
  v19 = [(INGetAvailableRestaurantReservationBookingsIntent *)self maximumNumberOfResults];
  char v20 = [v18 isEqual:v19];

  if (!v17) {
    goto LABEL_17;
  }
LABEL_18:

  v21 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 earliestBookingDateForResults];
  if (v21)
  {
    char v22 = 0;
  }
  else
  {
    v23 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
    char v22 = v23 == 0;
  }
  uint64_t v24 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 earliestBookingDateForResults];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];

    if (v26)
    {
      v27 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 earliestBookingDateForResults];
      v28 = [(INGetAvailableRestaurantReservationBookingsIntent *)self earliestBookingDateForResults];
      char v22 = [v27 isEqualToDate:v28];
    }
  }
  v29 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 latestBookingDateForResults];
  if (v29)
  {
    char v30 = 0;
  }
  else
  {
    v31 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];
    char v30 = v31 == 0;
  }
  uint64_t v32 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 latestBookingDateForResults];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];

    if (v34)
    {
      v35 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 latestBookingDateForResults];
      v36 = [(INGetAvailableRestaurantReservationBookingsIntent *)self latestBookingDateForResults];
      char v30 = [v35 isEqualToDate:v36];
    }
  }
  v37 = [(INGetAvailableRestaurantReservationBookingsIntent *)self restaurant];
  v38 = [(INGetAvailableRestaurantReservationBookingsIntent *)v7 restaurant];
  if ([v37 isEqual:v38])
  {
    NSUInteger v39 = [(INGetAvailableRestaurantReservationBookingsIntent *)self partySize];
    if (v39 == [(INGetAvailableRestaurantReservationBookingsIntent *)v7 partySize]) {
      char v40 = v9;
    }
    else {
      char v40 = 0;
    }
    char v10 = v40 & v20 & v22 & v30;
  }
  else
  {
    char v10 = 0;
  }

LABEL_37:
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  id v4 = a3;
  [(INIntent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredBookingDate, @"preferredBookingDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_restaurant forKey:@"restaurant"];
  [v4 encodeInteger:self->_partySize forKey:@"partySize"];
  [v4 encodeObject:self->_preferredBookingDateComponents forKey:@"preferredBookingDateComponents"];
  [v4 encodeObject:self->_maximumNumberOfResults forKey:@"maximumNumberOfResults"];
  [v4 encodeObject:self->_earliestBookingDateForResults forKey:@"earliestBookingDateForResults"];
  [v4 encodeObject:self->_latestBookingDateForResults forKey:@"latestBookingDateForResults"];
}

- (INGetAvailableRestaurantReservationBookingsIntent)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  objc_super v5 = [(INIntent *)&v21 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurant"];
  if (v6)
  {
    restaurant = v5->_restaurant;
    v5->_restaurant = (INRestaurant *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredBookingDate"];
    preferredBookingDate = v5->_preferredBookingDate;
    v5->_preferredBookingDate = (NSDate *)v8;

    v5->_partySize = [v4 decodeIntegerForKey:@"partySize"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredBookingDateComponents"];
    preferredBookingDateComponents = v5->_preferredBookingDateComponents;
    v5->_preferredBookingDateComponents = (NSDateComponents *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumNumberOfResults"];
    maximumNumberOfResults = v5->_maximumNumberOfResults;
    v5->_maximumNumberOfResults = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestBookingDateForResults"];
    earliestBookingDateForResults = v5->_earliestBookingDateForResults;
    v5->_earliestBookingDateForResults = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestBookingDateForResults"];
    latestBookingDateForResults = v5->_latestBookingDateForResults;
    v5->_latestBookingDateForResults = (NSDate *)v16;

LABEL_4:
    v18 = v5;
    goto LABEL_8;
  }
  v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[INGetAvailableRestaurantReservationBookingsIntent initWithCoder:]";
    __int16 v24 = 2080;
    v25 = "_restaurant";
    _os_log_error_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
  }
  v18 = 0;
LABEL_8:

  return v18;
}

- (INGetAvailableRestaurantReservationBookingsIntent)initWithRestaurant:(INRestaurant *)restaurant partySize:(NSUInteger)partySize preferredBookingDateComponents:(NSDateComponents *)preferredBookingDateComponents maximumNumberOfResults:(NSNumber *)maximumNumberOfResults earliestBookingDateForResults:(NSDate *)earliestBookingDateForResults latestBookingDateForResults:(NSDate *)latestBookingDateForResults
{
  uint64_t v14 = restaurant;
  v15 = preferredBookingDateComponents;
  uint64_t v16 = maximumNumberOfResults;
  v17 = earliestBookingDateForResults;
  v18 = latestBookingDateForResults;
  v22.receiver = self;
  v22.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntent;
  v19 = [(INIntent *)&v22 init];
  char v20 = v19;
  if (v19)
  {
    [(INGetAvailableRestaurantReservationBookingsIntent *)v19 setRestaurant:v14];
    [(INGetAvailableRestaurantReservationBookingsIntent *)v20 setPartySize:partySize];
    [(INGetAvailableRestaurantReservationBookingsIntent *)v20 setPreferredBookingDateComponents:v15];
    [(INGetAvailableRestaurantReservationBookingsIntent *)v20 setMaximumNumberOfResults:v16];
    [(INGetAvailableRestaurantReservationBookingsIntent *)v20 setEarliestBookingDateForResults:v17];
    [(INGetAvailableRestaurantReservationBookingsIntent *)v20 setLatestBookingDateForResults:v18];
  }

  return v20;
}

+ (id)intentDescription
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__INGetAvailableRestaurantReservationBookingsIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_42646 != -1) {
    dispatch_once(&intentDescription_onceToken_42646, block);
  }
  v2 = (void *)intentDescription_intentDescription_42647;

  return v2;
}

void __70__INGetAvailableRestaurantReservationBookingsIntent_intentDescription__block_invoke()
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v0 = [[INIntentSlotDescription alloc] initWithName:@"restaurant", 1, @"restaurant", 0, 0, 0, 0, 1, &unk_1EDBAAF68, &unk_1EDBAAF80, objc_opt_class(), sel_resolveRestaurantForGetAvailableRestaurantReservationBookings_withCompletion_, 0, @"restaurant" tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v10[0] = v0;
  v9[1] = @"partySize";
  v1 = [[INIntentSlotDescription alloc] initWithName:@"partySize", 2, @"partySize", 0, 0, 0, 8, 1, &unk_1EDBAAF98, &unk_1EDBAAFB0, objc_opt_class(), sel_resolvePartySizeForGetAvailableRestaurantReservationBookings_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v10[1] = v1;
  v9[2] = @"preferredBookingDateComponents";
  v2 = [[INIntentSlotDescription alloc] initWithName:@"preferredBookingDateComponents", 3, @"preferredBookingDateComponents", 0, 0, 0, 14, 1, &unk_1EDBAAFC8, &unk_1EDBAAFE0, objc_opt_class(), sel_resolvePreferredBookingDateComponentsForGetAvailableRestaurantReservationBookings_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v10[2] = v2;
  v9[3] = @"maximumNumberOfResults";
  v3 = [[INIntentSlotDescription alloc] initWithName:@"maximumNumberOfResults" tag:4 facadePropertyName:@"maximumNumberOfResults" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:24 valueStyle:2 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v10[3] = v3;
  v9[4] = @"earliestBookingDateForResults";
  id v4 = [[INIntentSlotDescription alloc] initWithName:@"earliestBookingDateForResults" tag:5 facadePropertyName:@"earliestBookingDateForResults" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:14 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v10[4] = v4;
  v9[5] = @"latestBookingDateForResults";
  objc_super v5 = [[INIntentSlotDescription alloc] initWithName:@"latestBookingDateForResults" tag:6 facadePropertyName:@"latestBookingDateForResults" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:14 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v10[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];

  v7 = [[INIntentDescription alloc] initWithName:@"GetAvailableRestaurantReservationBookingsIntent" responseName:@"GetAvailableRestaurantReservationBookingsIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleGetAvailableRestaurantReservationBookings_completion_ confirmSelector:sel_confirmGetAvailableRestaurantReservationBookings_completion_ slotsByName:v6];
  uint64_t v8 = (void *)intentDescription_intentDescription_42647;
  intentDescription_intentDescription_42647 = (uint64_t)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end