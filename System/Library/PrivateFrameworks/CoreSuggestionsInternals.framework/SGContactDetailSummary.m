@interface SGContactDetailSummary
- (NSArray)phones;
- (NSArray)socialProfileIdentifiers;
- (NSString)email;
- (void)setEmail:(id)a3;
- (void)setPhones:(id)a3;
- (void)setSocialProfileIdentifiers:(id)a3;
@end

@implementation SGContactDetailSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phones, 0);
}

- (void)setSocialProfileIdentifiers:(id)a3
{
}

- (NSArray)socialProfileIdentifiers
{
  return self->_socialProfileIdentifiers;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setPhones:(id)a3
{
}

- (NSArray)phones
{
  return self->_phones;
}

@end