@interface INGetRestaurantGuestIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INGetRestaurantGuestIntentResponse)initWithBackingStore:(id)a3;
- (INGetRestaurantGuestIntentResponse)initWithCode:(INGetRestaurantGuestIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetRestaurantGuestIntentResponse)initWithCoder:(id)a3;
- (INGetRestaurantGuestIntentResponseCode)code;
- (INRestaurantGuest)guest;
- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setGuest:(INRestaurantGuest *)guest;
- (void)setGuestDisplayPreferences:(INRestaurantGuestDisplayPreferences *)guestDisplayPreferences;
@end

@implementation INGetRestaurantGuestIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);

  objc_storeStrong((id *)&self->_guest, 0);
}

- (void)setGuestDisplayPreferences:(INRestaurantGuestDisplayPreferences *)guestDisplayPreferences
{
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (void)setGuest:(INRestaurantGuest *)guest
{
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(INGetRestaurantGuestIntentResponse *)self copyWithZone:0];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"guest";
  guest = self->_guest;
  v4 = guest;
  if (!guest)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"guestDisplayPreferences";
  guestDisplayPreferences = self->_guestDisplayPreferences;
  id v6 = guestDisplayPreferences;
  if (!guestDisplayPreferences)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"code";
  INGetRestaurantGuestIntentResponseCode v7 = [(INGetRestaurantGuestIntentResponse *)self code];
  v8 = @"Failure";
  if (v7 != INGetRestaurantGuestIntentResponseCodeFailure) {
    v8 = 0;
  }
  if (v7 == INGetRestaurantGuestIntentResponseCodeSuccess) {
    v8 = @"Success";
  }
  v9 = v8;
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v9) {

  }
  if (guestDisplayPreferences)
  {
    if (guest) {
      goto LABEL_15;
    }
  }
  else
  {

    if (guest) {
      goto LABEL_15;
    }
  }

LABEL_15:

  return v11;
}

- (INGetRestaurantGuestIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INGetRestaurantGuestIntentResponse *)a3;
  if (v5 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      INGetRestaurantGuestIntentResponseCode v7 = [(INGetRestaurantGuestIntentResponse *)v6 guest];
      if (v7
        || ([(INGetRestaurantGuestIntentResponse *)self guest],
            (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = [(INGetRestaurantGuestIntentResponse *)self guest];
        v9 = [(INGetRestaurantGuestIntentResponse *)v6 guest];
        char v10 = [v8 isEqual:v9];

        if (v7)
        {
LABEL_11:

          v12 = [(INGetRestaurantGuestIntentResponse *)v6 guestDisplayPreferences];
          if (v12
            || ([(INGetRestaurantGuestIntentResponse *)self guestDisplayPreferences],
                (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v13 = [(INGetRestaurantGuestIntentResponse *)self guestDisplayPreferences];
            v14 = [(INGetRestaurantGuestIntentResponse *)v6 guestDisplayPreferences];
            char v15 = [v13 isEqual:v14];

            if (v12)
            {
LABEL_17:

              char v11 = v10 & v15;
              goto LABEL_18;
            }
          }
          else
          {
            char v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        char v10 = 1;
      }

      goto LABEL_11;
    }
    char v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INGetRestaurantGuestIntentResponse;
  id v4 = [(INIntentResponse *)&v8 copyWithZone:a3];
  v5 = [(INGetRestaurantGuestIntentResponse *)self guest];
  [v4 setGuest:v5];

  id v6 = [(INGetRestaurantGuestIntentResponse *)self guestDisplayPreferences];
  [v4 setGuestDisplayPreferences:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_guest, @"guest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_guestDisplayPreferences forKey:@"guestDisplayPreferences"];
}

- (INGetRestaurantGuestIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetRestaurantGuestIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guest"];
    guest = v5->_guest;
    v5->_guest = (INRestaurantGuest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestDisplayPreferences"];
    guestDisplayPreferences = v5->_guestDisplayPreferences;
    v5->_guestDisplayPreferences = (INRestaurantGuestDisplayPreferences *)v8;
  }
  return v5;
}

- (INGetRestaurantGuestIntentResponse)initWithCode:(INGetRestaurantGuestIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return (INGetRestaurantGuestIntentResponse *)[(INIntentResponse *)&v5 _initWithCode:code userActivity:userActivity];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INGetRestaurantGuestIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetRestaurantGuestIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end