@interface IDSLocalPairingIdentityDataErrorPair
+ (BOOL)supportsSecureCoding;
- (IDSLocalPairingIdentityDataErrorPair)initWithCoder:(id)a3;
- (IDSLocalPairingIdentityDataErrorPair)initWithError:(id)a3;
- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3;
- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3 error:(id)a4;
- (NSData)identityData;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setIdentityData:(id)a3;
@end

@implementation IDSLocalPairingIdentityDataErrorPair

- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSLocalPairingIdentityDataErrorPair;
  v9 = [(IDSLocalPairingIdentityDataErrorPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityData, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3
{
  return [(IDSLocalPairingIdentityDataErrorPair *)self initWithIdentityData:a3 error:0];
}

- (IDSLocalPairingIdentityDataErrorPair)initWithError:(id)a3
{
  return [(IDSLocalPairingIdentityDataErrorPair *)self initWithIdentityData:0 error:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingIdentityDataErrorPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentityData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kError"];

  id v7 = [(IDSLocalPairingIdentityDataErrorPair *)self initWithIdentityData:v5 error:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IDSLocalPairingIdentityDataErrorPair *)self identityData];
  [v4 encodeObject:v5 forKey:@"kIdentityData"];

  id v6 = [(IDSLocalPairingIdentityDataErrorPair *)self error];
  [v4 encodeObject:v6 forKey:@"kError"];
}

- (NSData)identityData
{
  return self->_identityData;
}

- (void)setIdentityData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_identityData, 0);
}

@end