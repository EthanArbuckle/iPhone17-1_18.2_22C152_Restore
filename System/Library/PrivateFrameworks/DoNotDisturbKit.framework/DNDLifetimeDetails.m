@interface DNDLifetimeDetails
+ (id)lifetimeDetailsForEvent:(id)a3 relativeToDate:(id)a4;
+ (id)lifetimeDetailsForOneHour;
+ (id)lifetimeDetailsForPlaceInference:(id)a3;
+ (id)lifetimeDetailsUntilEvening;
+ (id)lifetimeDetailsUntilMorning;
- (BOOL)isEqual:(id)a3;
- (DNDLifetimeDetails)initWithIdentifier:(id)a3 name:(id)a4 metadata:(id)a5;
- (NSString)identifier;
- (NSString)metadata;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
@end

@implementation DNDLifetimeDetails

+ (id)lifetimeDetailsForPlaceInference:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
  v5 = [v4 localizedStringForKey:@"DND_UNTIL_I_LEAVE_LIFETIME_TITLE" value:&stru_26CF76938 table:0];

  v6 = [v3 preferredName];
  if ([v6 length])
  {
    [v3 confidence];
    if (v7 < 0.7) {
      v8 = @"DND_UNTIL_I_LEAVE_LIFETIME_WITH_LOW_CONFIDENCE_LOI_METADATA";
    }
    else {
      v8 = @"DND_UNTIL_I_LEAVE_LIFETIME_WITH_HIGH_CONFIDENCE_LOI_METADATA";
    }
    v9 = DNDLocalizedStringHelper(@"%@", v8);
    v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v6);
  }
  else
  {
    v10 = 0;
  }
  v11 = [[DNDLifetimeDetails alloc] initWithIdentifier:@"com.apple.donotdisturb.kit.lifetime.location" name:v5 metadata:v10];

  return v11;
}

+ (id)lifetimeDetailsForEvent:(id)a3 relativeToDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
  v8 = [v7 localizedStringForKey:@"DND_UNTIL_END_THIS_EVENT_TITLE" value:&stru_26CF76938 table:0];

  if (v5)
  {
    v9 = [v5 startDate];
    uint64_t v10 = [v5 endDate];
    if ([v6 compare:v9] == -1)
    {
      v11 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
      uint64_t v12 = [v11 localizedStringForKey:@"DND_UNTIL_END_NEXT_EVENT_TITLE" value:&stru_26CF76938 table:0];

      v8 = (void *)v12;
    }
    v13 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    [v13 getHour:&v29 minute:0 second:0 nanosecond:0 fromDate:v9];
    [v13 getHour:&v28 minute:0 second:0 nanosecond:0 fromDate:v10];
    uint64_t v14 = v29 / 12;
    uint64_t v15 = v28 / 12;
    v16 = [MEMORY[0x263F29C30] sharedInstance];
    v17 = v16;
    v26 = v8;
    id v27 = v6;
    if (v14 == v15) {
      [v16 formatDateAsTimeNoAMPM:v9];
    }
    else {
    v19 = [v16 formatDateAsTimeStyle:v9];
    }
    v20 = [v17 formatDateAsTimeStyle:v10];
    v21 = [v5 title];
    v22 = DNDLocalizedStringHelper(@"%@%@%@", @"DND_UNTIL_END_EVENT_DURATION_DESCRIPTION");
    objc_msgSend(NSString, "stringWithFormat:", v22, v19, v20, v21);
    v18 = v23 = (void *)v10;

    v8 = v26;
    id v6 = v27;
  }
  else
  {
    v18 = 0;
  }
  v24 = [[DNDLifetimeDetails alloc] initWithIdentifier:@"com.apple.donotdisturb.kit.lifetime.event" name:v8 metadata:v18];

  return v24;
}

+ (id)lifetimeDetailsForOneHour
{
  v2 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
  id v3 = [v2 localizedStringForKey:@"DND_ONE_HOUR_LIFETIME_TITLE" value:&stru_26CF76938 table:0];

  v4 = [[DNDLifetimeDetails alloc] initWithIdentifier:@"com.apple.donotdisturb.kit.lifetime.one-hour" name:v3 metadata:&stru_26CF76938];
  return v4;
}

+ (id)lifetimeDetailsUntilEvening
{
  v2 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
  id v3 = [v2 localizedStringForKey:@"DND_UNTIL_EVENING_LIFETIME_TITLE" value:&stru_26CF76938 table:0];

  v4 = [[DNDLifetimeDetails alloc] initWithIdentifier:@"com.apple.donotdisturb.kit.lifetime.evening" name:v3 metadata:&stru_26CF76938];
  return v4;
}

+ (id)lifetimeDetailsUntilMorning
{
  v2 = objc_msgSend(MEMORY[0x263F086E0], "dndk_localizationBundle");
  id v3 = [v2 localizedStringForKey:@"DND_UNTIL_MORNING_LIFETIME_TITLE" value:&stru_26CF76938 table:0];

  v4 = [[DNDLifetimeDetails alloc] initWithIdentifier:@"com.apple.donotdisturb.kit.lifetime.morning" name:v3 metadata:&stru_26CF76938];
  return v4;
}

- (DNDLifetimeDetails)initWithIdentifier:(id)a3 name:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDLifetimeDetails;
  v11 = [(DNDLifetimeDetails *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    metadata = v11->_metadata;
    v11->_metadata = (NSString *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  id v3 = [(DNDLifetimeDetails *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(DNDLifetimeDetails *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  double v7 = [(DNDLifetimeDetails *)self metadata];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (DNDLifetimeDetails *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      double v7 = [(DNDLifetimeDetails *)self identifier];
      unint64_t v8 = [(DNDLifetimeDetails *)v6 identifier];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDLifetimeDetails *)self identifier];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_37;
        }
        id v10 = (void *)v9;
        v11 = [(DNDLifetimeDetails *)v6 identifier];
        if (!v11)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v12 = [(DNDLifetimeDetails *)self identifier];
        id v3 = [(DNDLifetimeDetails *)v6 identifier];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      uint64_t v14 = [(DNDLifetimeDetails *)self name];
      uint64_t v15 = [(DNDLifetimeDetails *)v6 name];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDLifetimeDetails *)self name];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [(DNDLifetimeDetails *)v6 name];
          if (v18)
          {
            v35 = v14;
            objc_super v19 = [(DNDLifetimeDetails *)self name];
            id v3 = [(DNDLifetimeDetails *)v6 name];
            if ([v19 isEqual:v3])
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              v20 = [(DNDLifetimeDetails *)self metadata];
              uint64_t v21 = [(DNDLifetimeDetails *)v6 metadata];
              if (v20 == (void *)v21)
              {

                char v13 = 1;
                id v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                uint64_t v23 = [(DNDLifetimeDetails *)self metadata];
                if (v23)
                {
                  v24 = (void *)v23;
                  v25 = [(DNDLifetimeDetails *)v6 metadata];
                  if (v25)
                  {
                    v30 = v25;
                    uint64_t v29 = [(DNDLifetimeDetails *)self metadata];
                    v26 = [(DNDLifetimeDetails *)v6 metadata];
                    char v13 = [v29 isEqual:v26];

                    v25 = v30;
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {

                  char v13 = 0;
                }
                id v3 = v34;
                id v27 = v35;
              }
              if (v27 != v15)
              {
              }
LABEL_34:
              v11 = v38;
              id v10 = v39;
              id v3 = v36;
              uint64_t v12 = v37;
              if (v7 != v8) {
                goto LABEL_35;
              }
LABEL_37:

              goto LABEL_38;
            }

            uint64_t v14 = v35;
          }
        }
        char v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    char v13 = 0;
  }
LABEL_38:

  return v13;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDLifetimeDetails *)self identifier];
  uint64_t v6 = [(DNDLifetimeDetails *)self name];
  double v7 = [(DNDLifetimeDetails *)self metadata];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: '%@'; name: '%@'; metadata: '%@'>",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end