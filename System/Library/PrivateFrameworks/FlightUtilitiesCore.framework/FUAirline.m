@interface FUAirline
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FUAirline)initWithCoder:(id)a3;
- (NSString)FAACode;
- (NSString)IATACode;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFAACode:(id)a3;
- (void)setIATACode:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation FUAirline

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(FUAirline *)self IATACode];
    v9 = [v7 IATACode];
    if (v8 != v9)
    {
      v10 = [(FUAirline *)self IATACode];
      [v7 IATACode];
      v38 = v37 = v10;
      if (!objc_msgSend(v10, "isEqual:"))
      {
        char v11 = 0;
        goto LABEL_29;
      }
    }
    v12 = [(FUAirline *)self FAACode];
    v13 = [v7 FAACode];
    if (v12 != v13)
    {
      v5 = [(FUAirline *)self FAACode];
      v3 = [v7 FAACode];
      if (![v5 isEqual:v3])
      {
        char v11 = 0;
LABEL_27:

LABEL_28:
        if (v8 == v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    uint64_t v14 = [(FUAirline *)self name];
    uint64_t v35 = [v7 name];
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      v15 = [(FUAirline *)self name];
      v33 = [v7 name];
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        char v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      v32 = v3;
    }
    v16 = [(FUAirline *)self phoneNumber];
    v17 = [v7 phoneNumber];
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      v4 = [(FUAirline *)self phoneNumber];
      v31 = [v7 phoneNumber];
      if (!objc_msgSend(v4, "isEqual:"))
      {
        char v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    v20 = [(FUAirline *)self URL];
    uint64_t v21 = [v7 URL];
    if (v20 == (void *)v21)
    {

      char v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      [(FUAirline *)self URL];
      v23 = v27 = v4;
      [v7 URL];
      v28 = v12;
      v25 = v24 = v16;
      char v11 = [v23 isEqual:v25];

      v16 = v24;
      v12 = v28;

      v4 = v27;
    }
    v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  char v11 = 0;
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(FUAirline *)self IATACode];
  v6 = (void *)[v5 copy];
  [v4 setIATACode:v6];

  id v7 = [(FUAirline *)self FAACode];
  v8 = (void *)[v7 copy];
  [v4 setFAACode:v8];

  v9 = [(FUAirline *)self name];
  v10 = (void *)[v9 copy];
  [v4 setName:v10];

  char v11 = [(FUAirline *)self phoneNumber];
  v12 = (void *)[v11 copy];
  [v4 setPhoneNumber:v12];

  v13 = [(FUAirline *)self URL];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setURL:v14];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(FUAirline *)self name];
  v5 = [(FUAirline *)self IATACode];
  v6 = [v3 stringWithFormat:@"Airline: %@ (%@)", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(FUAirline *)self IATACode];

  if (v4)
  {
    v5 = [(FUAirline *)self IATACode];
    [v14 encodeObject:v5 forKey:@"IATACode"];
  }
  v6 = [(FUAirline *)self FAACode];

  if (v6)
  {
    id v7 = [(FUAirline *)self FAACode];
    [v14 encodeObject:v7 forKey:@"FAACode"];
  }
  v8 = [(FUAirline *)self name];

  if (v8)
  {
    v9 = [(FUAirline *)self name];
    [v14 encodeObject:v9 forKey:@"name"];
  }
  v10 = [(FUAirline *)self phoneNumber];

  if (v10)
  {
    char v11 = [(FUAirline *)self phoneNumber];
    [v14 encodeObject:v11 forKey:@"phoneNumber"];
  }
  v12 = [(FUAirline *)self URL];

  if (v12)
  {
    v13 = [(FUAirline *)self URL];
    [v14 encodeObject:v13 forKey:@"URL"];
  }
}

- (FUAirline)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FUAirline;
  v5 = [(FUAirline *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IATACode"];
    IATACode = v5->_IATACode;
    v5->_IATACode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FAACode"];
    FAACode = v5->_FAACode;
    v5->_FAACode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;

    v16 = v5;
  }

  return v5;
}

- (NSString)IATACode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIATACode:(id)a3
{
}

- (NSString)FAACode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFAACode:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_FAACode, 0);
  objc_storeStrong((id *)&self->_IATACode, 0);
}

@end