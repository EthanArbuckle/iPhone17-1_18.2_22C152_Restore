@interface INBookRestaurantReservationIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INBookRestaurantReservationIntentCode)code;
- (INBookRestaurantReservationIntentResponse)initWithCode:(INBookRestaurantReservationIntentCode)code userActivity:(NSUserActivity *)userActivity;
- (INBookRestaurantReservationIntentResponse)initWithCoder:(id)a3;
- (INRestaurantReservationUserBooking)userBooking;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setUserBooking:(INRestaurantReservationUserBooking *)userBooking;
@end

@implementation INBookRestaurantReservationIntentResponse

- (void).cxx_destruct
{
}

- (void)setUserBooking:(INRestaurantReservationUserBooking *)userBooking
{
}

- (INRestaurantReservationUserBooking)userBooking
{
  return self->_userBooking;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(INBookRestaurantReservationIntentResponse *)self copyWithZone:0];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"code";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[INBookRestaurantReservationIntentResponse code](self, "code"));
  v8[1] = @"userBooking";
  v9[0] = v3;
  userBooking = self->_userBooking;
  v5 = userBooking;
  if (!userBooking)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  if (!userBooking) {

  }
  return v6;
}

- (INBookRestaurantReservationIntentCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INBookRestaurantReservationIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INBookRestaurantReservationIntentResponse *)a3;
  id v6 = v5;
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
        id v7 = v6;
        v8 = [(INBookRestaurantReservationIntentResponse *)self userBooking];
        if (v8
          || ([(INBookRestaurantReservationIntentResponse *)v7 userBooking],
              (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v9 = [(INBookRestaurantReservationIntentResponse *)self userBooking];
          v10 = [(INBookRestaurantReservationIntentResponse *)v7 userBooking];
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

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INBookRestaurantReservationIntentResponse;
  id v4 = [(INIntentResponse *)&v7 copyWithZone:a3];
  v5 = [(INBookRestaurantReservationIntentResponse *)self userBooking];
  [v4 setUserBooking:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_userBooking, @"userBooking", v5.receiver, v5.super_class);
}

- (INBookRestaurantReservationIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INBookRestaurantReservationIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userBooking"];
    userBooking = v5->_userBooking;
    v5->_userBooking = (INRestaurantReservationUserBooking *)v6;
  }
  return v5;
}

- (INBookRestaurantReservationIntentResponse)initWithCode:(INBookRestaurantReservationIntentCode)code userActivity:(NSUserActivity *)userActivity
{
  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntentResponse;
  return (INBookRestaurantReservationIntentResponse *)[(INIntentResponse *)&v5 _initWithCode:code userActivity:userActivity];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end