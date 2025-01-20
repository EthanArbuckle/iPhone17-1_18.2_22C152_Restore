@interface DDMatchPostalAddress
- (DDMatchPostalAddress)initWithDDScannerResult:(id)a3;
- (NSString)city;
- (NSString)country;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
@end

@implementation DDMatchPostalAddress

- (DDMatchPostalAddress)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DDMatchPostalAddress;
  v5 = [(DDMatch *)&v23 initWithDDScannerResult:v4];
  if (v5)
  {
    id v21 = 0;
    id v22 = 0;
    id v19 = 0;
    id v20 = 0;
    id v18 = 0;
    int v6 = [v4 getStreet:&v22 city:&v21 state:&v20 zip:&v19 country:&v18];
    id v7 = v22;
    id v17 = v22;
    id v8 = v21;
    id v16 = v21;
    id v9 = v20;
    id v15 = v20;
    id v10 = v19;
    id v11 = v19;
    id v12 = v18;
    id v13 = v18;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_street, v7);
      objc_storeStrong((id *)&v5->_city, v8);
      objc_storeStrong((id *)&v5->_state, v9);
      objc_storeStrong((id *)&v5->_postalCode, v10);
      objc_storeStrong((id *)&v5->_country, v12);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[DDMatchPostalAddress initWithDDScannerResult:]();
    }
  }
  return v5;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

- (void)initWithDDScannerResult:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_212A0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to extract address components from results", v0, 2u);
}

@end