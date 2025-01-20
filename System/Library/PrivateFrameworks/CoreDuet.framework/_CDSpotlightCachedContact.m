@interface _CDSpotlightCachedContact
- (CNContact)contact;
- (NSDate)expirationDate;
- (_CDSpotlightCachedContact)initWithExpirationDate:(id)a3 contact:(id)a4;
- (void)setExpirationDate:(id)a3;
@end

@implementation _CDSpotlightCachedContact

- (_CDSpotlightCachedContact)initWithExpirationDate:(id)a3 contact:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDSpotlightCachedContact;
  v9 = [(_CDSpotlightCachedContact *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expirationDate, a3);
    objc_storeStrong((id *)&v10->_contact, a4);
  }

  return v10;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end