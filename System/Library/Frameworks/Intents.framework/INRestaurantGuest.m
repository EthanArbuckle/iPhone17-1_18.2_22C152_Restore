@interface INRestaurantGuest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INRestaurantGuest)initWithCoder:(id)a3;
- (INRestaurantGuest)initWithNameComponents:(NSPersonNameComponents *)nameComponents phoneNumber:(NSString *)phoneNumber emailAddress:(NSString *)emailAddress;
- (INRestaurantGuest)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (id)_dictionaryRepresentation;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEmailAddress:(NSString *)emailAddress;
- (void)setPhoneNumber:(NSString *)phoneNumber;
@end

@implementation INRestaurantGuest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

- (void)setEmailAddress:(NSString *)emailAddress
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"phoneNumber";
  phoneNumber = self->_phoneNumber;
  v4 = phoneNumber;
  if (!phoneNumber)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"emailAddress";
  v10[0] = v4;
  emailAddress = self->_emailAddress;
  v6 = emailAddress;
  if (!emailAddress)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (emailAddress)
  {
    if (phoneNumber) {
      goto LABEL_7;
    }
  }
  else
  {

    if (phoneNumber) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16
{
  id v18 = a4;
  id v19 = a5;
  uint64_t v20 = [v18 type];
  if (v20 == 2)
  {
    v21 = [v18 value];
  }
  else
  {
    v21 = 0;
  }
  if ([v18 type] == 1)
  {
    v22 = [v18 value];
    v23 = [(INRestaurantGuest *)self initWithNameComponents:v19 phoneNumber:v21 emailAddress:v22];
  }
  else
  {
    v23 = [(INRestaurantGuest *)self initWithNameComponents:v19 phoneNumber:v21 emailAddress:0];
  }
  if (v20 == 2) {

  }
  return v23;
}

- (INRestaurantGuest)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v11 type];
  if (v13 == 2)
  {
    v14 = [v11 value];
  }
  else
  {
    v14 = 0;
  }
  if ([v11 type] == 1)
  {
    v15 = [v11 value];
    v16 = [(INRestaurantGuest *)self initWithNameComponents:v12 phoneNumber:v14 emailAddress:v15];
  }
  else
  {
    v16 = [(INRestaurantGuest *)self initWithNameComponents:v12 phoneNumber:v14 emailAddress:0];
  }
  if (v13 == 2) {

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INRestaurantGuest *)a3;
  if (v5 == self)
  {
    BOOL v11 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_21;
  }
  v6 = v5;
  v7 = [(INRestaurantGuest *)v6 phoneNumber];
  if (!v7)
  {
    v3 = [(INRestaurantGuest *)self phoneNumber];
    if (!v3)
    {
      int v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v8 = [(INRestaurantGuest *)v6 phoneNumber];
  v9 = [(INRestaurantGuest *)self phoneNumber];
  int v10 = [v8 isEqualToString:v9];

  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:

  id v12 = [(INRestaurantGuest *)v6 emailAddress];
  if (!v12)
  {
    v3 = [(INRestaurantGuest *)self emailAddress];
    if (!v3)
    {
      int v15 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  uint64_t v13 = [(INRestaurantGuest *)v6 emailAddress];
  v14 = [(INRestaurantGuest *)self emailAddress];
  int v15 = [v13 isEqualToString:v14];

  if (!v12) {
    goto LABEL_16;
  }
LABEL_17:

  if ((v10 & v15) == 1)
  {
    v17.receiver = self;
    v17.super_class = (Class)INRestaurantGuest;
    BOOL v11 = [(INPerson *)&v17 isEqual:v6];
  }
  else
  {
    BOOL v11 = 0;
  }

LABEL_21:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INRestaurantGuest;
  id v4 = [(INPerson *)&v8 copyWithZone:a3];
  v5 = [(INRestaurantGuest *)self phoneNumber];
  [v4 setPhoneNumber:v5];

  v6 = [(INRestaurantGuest *)self emailAddress];
  [v4 setEmailAddress:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INRestaurantGuest;
  id v4 = a3;
  [(INPerson *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneNumber, @"phoneNumber", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_emailAddress forKey:@"emailAddress"];
}

- (INRestaurantGuest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantGuest;
  objc_super v5 = [(INPerson *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;
  }
  return v5;
}

- (INRestaurantGuest)initWithNameComponents:(NSPersonNameComponents *)nameComponents phoneNumber:(NSString *)phoneNumber emailAddress:(NSString *)emailAddress
{
  uint64_t v8 = phoneNumber;
  v9 = emailAddress;
  int v10 = nameComponents;
  objc_super v11 = [[INPersonHandle alloc] initWithValue:&stru_1EDA6DB28 type:0];
  v20.receiver = self;
  v20.super_class = (Class)INRestaurantGuest;
  char v19 = 0;
  char v18 = 0;
  id v12 = [(INPerson *)&v20 _initWithUserInput:0 personHandle:v11 nameComponents:v10 displayName:0 image:0 contactIdentifier:0 customIdentifier:0 relationship:0 aliases:0 suggestionType:0 isMe:v18 scoredAlternatives:0 sourceAppBundleIdentifier:0 phonemeData:0 isContactSuggestion:v19 searchProvider:0];

  if (v12)
  {
    uint64_t v13 = [(NSString *)v8 copy];
    v14 = v12->_phoneNumber;
    v12->_phoneNumber = (NSString *)v13;

    uint64_t v15 = [(NSString *)v9 copy];
    v16 = v12->_emailAddress;
    v12->_emailAddress = (NSString *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end