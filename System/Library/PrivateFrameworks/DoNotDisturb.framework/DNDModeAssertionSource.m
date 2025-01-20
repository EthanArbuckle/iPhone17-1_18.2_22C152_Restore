@interface DNDModeAssertionSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDModeAssertionSource)initWithClientIdentifier:(id)a3 deviceIdentifier:(id)a4;
- (DNDModeAssertionSource)initWithCoder:(id)a3;
- (NSString)clientIdentifier;
- (NSString)deviceIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeAssertionSource

- (DNDModeAssertionSource)initWithClientIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDModeAssertionSource;
  v8 = [(DNDModeAssertionSource *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  v3 = [(DNDModeAssertionSource *)self clientIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDModeAssertionSource *)self deviceIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDModeAssertionSource *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(DNDModeAssertionSource *)self clientIdentifier];
      id v7 = [(DNDModeAssertionSource *)v5 clientIdentifier];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDModeAssertionSource *)self clientIdentifier];
        if (!v8)
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v9 = (void *)v8;
        v10 = [(DNDModeAssertionSource *)v5 clientIdentifier];
        if (!v10)
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v11 = [(DNDModeAssertionSource *)self clientIdentifier];
        v12 = [(DNDModeAssertionSource *)v5 clientIdentifier];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      objc_super v14 = [(DNDModeAssertionSource *)self deviceIdentifier];
      uint64_t v15 = [(DNDModeAssertionSource *)v5 deviceIdentifier];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(DNDModeAssertionSource *)self deviceIdentifier];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDModeAssertionSource *)v5 deviceIdentifier];
          if (v19)
          {
            v22 = [(DNDModeAssertionSource *)self deviceIdentifier];
            v20 = [(DNDModeAssertionSource *)v5 deviceIdentifier];
            char v13 = [v22 isEqual:v20];
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
      }
      v10 = v25;
      uint64_t v9 = v26;
      v12 = v23;
      uint64_t v11 = v24;
      if (v6 == v7) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDModeAssertionSource *)self clientIdentifier];
  unint64_t v6 = [(DNDModeAssertionSource *)self deviceIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; clientIdentifier: '%@'; deviceIdentifier: '%@'>",
    v4,
    self,
    v5,
  id v7 = v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];

  id v7 = [(DNDModeAssertionSource *)self initWithClientIdentifier:v5 deviceIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDModeAssertionSource *)self clientIdentifier];
  [v4 encodeObject:v5 forKey:@"clientIdentifier"];

  id v6 = [(DNDModeAssertionSource *)self deviceIdentifier];
  [v4 encodeObject:v6 forKey:@"deviceIdentifier"];
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end