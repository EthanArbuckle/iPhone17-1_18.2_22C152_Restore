@interface ASCABLELoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCABLELoginChoice)initWithCoder:(id)a3;
- (ASCABLELoginChoice)initWithQRCodeURL:(id)a3;
- (NSURL)qrCodeURL;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCABLELoginChoice

- (unint64_t)loginChoiceKind
{
  return 4;
}

- (ASCABLELoginChoice)initWithQRCodeURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCABLELoginChoice;
  v6 = [(ASCABLELoginChoice *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_qrCodeURL, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCABLELoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCABLELoginChoice;
  id v5 = [(ASCABLELoginChoice *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qrCodeURL"];
    qrCodeURL = v5->_qrCodeURL;
    v5->_qrCodeURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSURL)qrCodeURL
{
  return self->_qrCodeURL;
}

- (void).cxx_destruct
{
}

@end