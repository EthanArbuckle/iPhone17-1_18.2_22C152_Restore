@interface SKStorefront
- (NSString)countryCode;
- (NSString)identifier;
- (SKStorefront)initWithIdentifier:(id)a3 countryCode:(id)a4;
- (id)description;
@end

@implementation SKStorefront

- (SKStorefront)initWithIdentifier:(id)a3 countryCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKStorefront;
  v9 = [(SKStorefront *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countryCode, a4);
    objc_storeStrong((id *)&v10->_identifier, a3);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@-%@", self->_countryCode, self->_identifier];
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end