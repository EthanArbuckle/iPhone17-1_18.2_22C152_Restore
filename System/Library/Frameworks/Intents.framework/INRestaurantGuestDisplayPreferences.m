@interface INRestaurantGuestDisplayPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)emailAddressEditable;
- (BOOL)emailAddressFieldShouldBeDisplayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)nameEditable;
- (BOOL)nameFieldFirstNameOptional;
- (BOOL)nameFieldLastNameOptional;
- (BOOL)nameFieldShouldBeDisplayed;
- (BOOL)phoneNumberEditable;
- (BOOL)phoneNumberFieldShouldBeDisplayed;
- (INRestaurantGuestDisplayPreferences)init;
- (INRestaurantGuestDisplayPreferences)initWithCoder:(id)a3;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEmailAddressEditable:(BOOL)emailAddressEditable;
- (void)setEmailAddressFieldShouldBeDisplayed:(BOOL)emailAddressFieldShouldBeDisplayed;
- (void)setNameEditable:(BOOL)nameEditable;
- (void)setNameFieldFirstNameOptional:(BOOL)nameFieldFirstNameOptional;
- (void)setNameFieldLastNameOptional:(BOOL)nameFieldLastNameOptional;
- (void)setNameFieldShouldBeDisplayed:(BOOL)nameFieldShouldBeDisplayed;
- (void)setPhoneNumberEditable:(BOOL)phoneNumberEditable;
- (void)setPhoneNumberFieldShouldBeDisplayed:(BOOL)phoneNumberFieldShouldBeDisplayed;
@end

@implementation INRestaurantGuestDisplayPreferences

- (void)setPhoneNumberEditable:(BOOL)phoneNumberEditable
{
  self->_phoneNumberEditable = phoneNumberEditable;
}

- (BOOL)phoneNumberEditable
{
  return self->_phoneNumberEditable;
}

- (void)setEmailAddressEditable:(BOOL)emailAddressEditable
{
  self->_emailAddressEditable = emailAddressEditable;
}

- (BOOL)emailAddressEditable
{
  return self->_emailAddressEditable;
}

- (void)setNameEditable:(BOOL)nameEditable
{
  self->_nameEditable = nameEditable;
}

- (BOOL)nameEditable
{
  return self->_nameEditable;
}

- (void)setPhoneNumberFieldShouldBeDisplayed:(BOOL)phoneNumberFieldShouldBeDisplayed
{
  self->_phoneNumberFieldShouldBeDisplayed = phoneNumberFieldShouldBeDisplayed;
}

- (BOOL)phoneNumberFieldShouldBeDisplayed
{
  return self->_phoneNumberFieldShouldBeDisplayed;
}

- (void)setEmailAddressFieldShouldBeDisplayed:(BOOL)emailAddressFieldShouldBeDisplayed
{
  self->_emailAddressFieldShouldBeDisplayed = emailAddressFieldShouldBeDisplayed;
}

- (BOOL)emailAddressFieldShouldBeDisplayed
{
  return self->_emailAddressFieldShouldBeDisplayed;
}

- (void)setNameFieldShouldBeDisplayed:(BOOL)nameFieldShouldBeDisplayed
{
  self->_nameFieldShouldBeDisplayed = nameFieldShouldBeDisplayed;
}

- (BOOL)nameFieldShouldBeDisplayed
{
  return self->_nameFieldShouldBeDisplayed;
}

- (void)setNameFieldLastNameOptional:(BOOL)nameFieldLastNameOptional
{
  self->_nameFieldLastNameOptional = nameFieldLastNameOptional;
}

- (BOOL)nameFieldLastNameOptional
{
  return self->_nameFieldLastNameOptional;
}

- (void)setNameFieldFirstNameOptional:(BOOL)nameFieldFirstNameOptional
{
  self->_nameFieldFirstNameOptional = nameFieldFirstNameOptional;
}

- (BOOL)nameFieldFirstNameOptional
{
  return self->_nameFieldFirstNameOptional;
}

- (id)_dictionaryRepresentation
{
  v14[8] = *MEMORY[0x1E4F143B8];
  v13[0] = @"nameFieldFirstNameOptional";
  v3 = [NSNumber numberWithBool:self->_nameFieldFirstNameOptional];
  v14[0] = v3;
  v13[1] = @"nameFieldLastNameOptional";
  v4 = [NSNumber numberWithBool:self->_nameFieldLastNameOptional];
  v14[1] = v4;
  v13[2] = @"nameFieldShouldBeDisplayed";
  v5 = [NSNumber numberWithBool:self->_nameFieldShouldBeDisplayed];
  v14[2] = v5;
  v13[3] = @"emailAddressFieldShouldBeDisplayed";
  v6 = [NSNumber numberWithBool:self->_emailAddressFieldShouldBeDisplayed];
  v14[3] = v6;
  v13[4] = @"phoneNumberFieldShouldBeDisplayed";
  v7 = [NSNumber numberWithBool:self->_phoneNumberFieldShouldBeDisplayed];
  v14[4] = v7;
  v13[5] = @"nameEditable";
  v8 = [NSNumber numberWithBool:self->_nameEditable];
  v14[5] = v8;
  v13[6] = @"emailAddressEditable";
  v9 = [NSNumber numberWithBool:self->_emailAddressEditable];
  v14[6] = v9;
  v13[7] = @"phoneNumberEditable";
  v10 = [NSNumber numberWithBool:self->_phoneNumberEditable];
  v14[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantGuestDisplayPreferences;
  v6 = [(INRestaurantGuestDisplayPreferences *)&v11 description];
  v7 = [(INRestaurantGuestDisplayPreferences *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRestaurantGuestDisplayPreferences *)self descriptionAtIndent:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INRestaurantGuestDisplayPreferences *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(INRestaurantGuestDisplayPreferences *)v5 nameFieldFirstNameOptional];
      if (v6 == [(INRestaurantGuestDisplayPreferences *)self nameFieldFirstNameOptional]
        && (BOOL v7 = [(INRestaurantGuestDisplayPreferences *)v5 nameFieldLastNameOptional],
            v7 == [(INRestaurantGuestDisplayPreferences *)self nameFieldLastNameOptional])
        && (BOOL v8 = [(INRestaurantGuestDisplayPreferences *)v5 nameFieldShouldBeDisplayed],
            v8 == [(INRestaurantGuestDisplayPreferences *)self nameFieldShouldBeDisplayed])
        && (v9 = [(INRestaurantGuestDisplayPreferences *)v5 emailAddressFieldShouldBeDisplayed], v9 == [(INRestaurantGuestDisplayPreferences *)self emailAddressFieldShouldBeDisplayed])&& (v10 = [(INRestaurantGuestDisplayPreferences *)v5 phoneNumberFieldShouldBeDisplayed], v10 == [(INRestaurantGuestDisplayPreferences *)self phoneNumberFieldShouldBeDisplayed])&& (BOOL v11 = [(INRestaurantGuestDisplayPreferences *)v5 nameEditable], v11 == [(INRestaurantGuestDisplayPreferences *)self nameEditable])&& (v12 = [(INRestaurantGuestDisplayPreferences *)v5 emailAddressEditable], v12 == [(INRestaurantGuestDisplayPreferences *)self emailAddressEditable]))
      {
        BOOL v15 = [(INRestaurantGuestDisplayPreferences *)v5 phoneNumberEditable];
        int v13 = v15 ^ [(INRestaurantGuestDisplayPreferences *)self phoneNumberEditable] ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[INRestaurantGuestDisplayPreferences allocWithZone:a3] init];
  [(INRestaurantGuestDisplayPreferences *)v4 setNameFieldFirstNameOptional:[(INRestaurantGuestDisplayPreferences *)self nameFieldFirstNameOptional]];
  [(INRestaurantGuestDisplayPreferences *)v4 setNameFieldLastNameOptional:[(INRestaurantGuestDisplayPreferences *)self nameFieldLastNameOptional]];
  [(INRestaurantGuestDisplayPreferences *)v4 setNameFieldShouldBeDisplayed:[(INRestaurantGuestDisplayPreferences *)self nameFieldShouldBeDisplayed]];
  [(INRestaurantGuestDisplayPreferences *)v4 setEmailAddressFieldShouldBeDisplayed:[(INRestaurantGuestDisplayPreferences *)self emailAddressFieldShouldBeDisplayed]];
  [(INRestaurantGuestDisplayPreferences *)v4 setPhoneNumberFieldShouldBeDisplayed:[(INRestaurantGuestDisplayPreferences *)self phoneNumberFieldShouldBeDisplayed]];
  [(INRestaurantGuestDisplayPreferences *)v4 setNameEditable:[(INRestaurantGuestDisplayPreferences *)self nameEditable]];
  [(INRestaurantGuestDisplayPreferences *)v4 setEmailAddressEditable:[(INRestaurantGuestDisplayPreferences *)self emailAddressEditable]];
  [(INRestaurantGuestDisplayPreferences *)v4 setPhoneNumberEditable:[(INRestaurantGuestDisplayPreferences *)self phoneNumberEditable]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL nameFieldFirstNameOptional = self->_nameFieldFirstNameOptional;
  id v5 = a3;
  [v5 encodeBool:nameFieldFirstNameOptional forKey:@"nameFieldFirstNameOptional"];
  [v5 encodeBool:self->_nameFieldLastNameOptional forKey:@"nameFieldLastNameOptional"];
  [v5 encodeBool:self->_nameFieldShouldBeDisplayed forKey:@"nameFieldShouldBeDisplayed"];
  [v5 encodeBool:self->_emailAddressFieldShouldBeDisplayed forKey:@"emailAddressFieldShouldBeDisplayed"];
  [v5 encodeBool:self->_phoneNumberFieldShouldBeDisplayed forKey:@"phoneNumberFieldShouldBeDisplayed"];
  [v5 encodeBool:self->_nameEditable forKey:@"nameEditable"];
  [v5 encodeBool:self->_emailAddressEditable forKey:@"emailAddressEditable"];
  [v5 encodeBool:self->_phoneNumberEditable forKey:@"phoneNumberEditable"];
}

- (INRestaurantGuestDisplayPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(INRestaurantGuestDisplayPreferences *)self init];
  if (v5)
  {
    v5->_BOOL nameFieldFirstNameOptional = [v4 decodeBoolForKey:@"nameFieldFirstNameOptional"];
    v5->_nameFieldLastNameOptional = [v4 decodeBoolForKey:@"nameFieldLastNameOptional"];
    v5->_nameFieldShouldBeDisplayed = [v4 decodeBoolForKey:@"nameFieldShouldBeDisplayed"];
    v5->_emailAddressFieldShouldBeDisplayed = [v4 decodeBoolForKey:@"emailAddressFieldShouldBeDisplayed"];
    v5->_phoneNumberFieldShouldBeDisplayed = [v4 decodeBoolForKey:@"phoneNumberFieldShouldBeDisplayed"];
    v5->_nameEditable = [v4 decodeBoolForKey:@"nameEditable"];
    v5->_emailAddressEditable = [v4 decodeBoolForKey:@"emailAddressEditable"];
    v5->_phoneNumberEditable = [v4 decodeBoolForKey:@"phoneNumberEditable"];
  }

  return v5;
}

- (INRestaurantGuestDisplayPreferences)init
{
  v3.receiver = self;
  v3.super_class = (Class)INRestaurantGuestDisplayPreferences;
  result = [(INRestaurantGuestDisplayPreferences *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_BOOL nameFieldFirstNameOptional = 0;
    *(_DWORD *)&result->_nameFieldShouldBeDisplayed = 16843009;
    *(_WORD *)&result->_emailAddressEditable = 257;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end