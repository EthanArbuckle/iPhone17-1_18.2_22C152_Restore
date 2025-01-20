@interface INGetUserCurrentRestaurantReservationBookingsIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)init;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithUserCurrentBookings:(NSArray *)userCurrentBookings code:(INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code;
- (NSArray)userCurrentBookings;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setUserCurrentBookings:(NSArray *)userCurrentBookings;
@end

@implementation INGetUserCurrentRestaurantReservationBookingsIntentResponse

- (void).cxx_destruct
{
}

- (void)setUserCurrentBookings:(NSArray *)userCurrentBookings
{
}

- (NSArray)userCurrentBookings
{
  return self->_userCurrentBookings;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self copyWithZone:0];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v3 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INGetUserCurrentRestaurantReservationBookingsIntentResponseCodeUnspecified)
  {
    v5 = off_1E551A420[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"userCurrentBookings";
  v11[0] = v5;
  userCurrentBookings = self->_userCurrentBookings;
  id v7 = userCurrentBookings;
  if (!userCurrentBookings)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!userCurrentBookings) {

  }
  if (v4 >= 4) {

  }
  return v8;
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (INGetUserCurrentRestaurantReservationBookingsIntentResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)v6 userCurrentBookings];
    v8 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self userCurrentBookings];
    if ([v7 isEqualToArray:v8])
    {
      INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v9 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self code];
      BOOL v10 = v9 == [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)v6 code];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  id v4 = [(INIntentResponse *)&v10 copyWithZone:a3];
  v5 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self userCurrentBookings];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v7 = [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self userCurrentBookings];
    v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setUserCurrentBookings:v8];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_userCurrentBookings, @"userCurrentBookings", v5.receiver, v5.super_class);
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithUserCurrentBookings:(NSArray *)userCurrentBookings code:(INGetUserCurrentRestaurantReservationBookingsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  v8 = userCurrentBookings;
  v13.receiver = self;
  v13.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v9 = [(INIntentResponse *)&v13 _initWithCode:code userActivity:userActivity];
  if (v9)
  {
    uint64_t v10 = [(NSArray *)v8 copy];
    v11 = v9->_userCurrentBookings;
    v9->_userCurrentBookings = (NSArray *)v10;
  }
  return v9;
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  return [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self initWithUserCurrentBookings:MEMORY[0x1E4F1CBF0] code:a3 userActivity:a4];
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetUserCurrentRestaurantReservationBookingsIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    INGetUserCurrentRestaurantReservationBookingsIntentResponseCode v9 = [v4 decodeObjectOfClasses:v8 forKey:@"userCurrentBookings"];

    if (v9) {
      objc_storeStrong((id *)&v5->_userCurrentBookings, v9);
    }
  }
  return v5;
}

- (INGetUserCurrentRestaurantReservationBookingsIntentResponse)init
{
  return [(INGetUserCurrentRestaurantReservationBookingsIntentResponse *)self initWithCode:3 userActivity:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end