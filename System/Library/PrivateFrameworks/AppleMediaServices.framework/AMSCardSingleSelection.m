@interface AMSCardSingleSelection
+ (BOOL)supportsSecureCoding;
- (AMSCardSingleSelection)initWithCoder:(id)a3;
- (AMSCardSingleSelection)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
@end

@implementation AMSCardSingleSelection

- (AMSCardSingleSelection)initWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardSingleSelection;
  v8 = [(AMSCardSingleSelection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AMSCardSingleSelection *)v8 setPassTypeIdentifier:v6];
    [(AMSCardSingleSelection *)v9 setPassSerialNumber:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AMSCardSingleSelection *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v10 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(AMSCardSingleSelection *)self passTypeIdentifier];
    id v7 = [(AMSCardSingleSelection *)v5 passTypeIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(AMSCardSingleSelection *)self passSerialNumber];
      v9 = [(AMSCardSingleSelection *)v5 passSerialNumber];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
LABEL_6:
    char v10 = 0;
  }
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(AMSCardSingleSelection *)self passTypeIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSCardSingleSelection *)self passSerialNumber];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (AMSCardSingleSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardSingleSelection;
  v5 = [(AMSCardSingleSelection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passSerialNumber"];
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSCardSingleSelection *)self passTypeIdentifier];
  [v4 encodeObject:v5 forKey:@"passTypeIdentifier"];

  id v6 = [(AMSCardSingleSelection *)self passSerialNumber];
  [v4 encodeObject:v6 forKey:@"passSerialNumber"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end