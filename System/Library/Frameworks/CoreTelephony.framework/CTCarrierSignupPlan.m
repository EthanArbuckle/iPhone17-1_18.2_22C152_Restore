@interface CTCarrierSignupPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSignupPlan)initWithCoder:(id)a3;
- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5;
- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5 option:(int64_t)a6 identifiers:(id)a7;
- (NSArray)identifiers;
- (NSString)name;
- (NSString)type;
- (NSString)url;
- (id)description;
- (int64_t)option;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCarrierSignupPlan

- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CTCarrierSignupPlan;
  v11 = [(CTCarrierSignupPlan *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a4);
    objc_storeStrong((id *)&v11->_type, a5);
    v11->_option = 0;
  }

  return v11;
}

- (CTCarrierSignupPlan)initWithName:(id)a3 url:(id)a4 type:(id)a5 option:(int64_t)a6 identifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CTCarrierSignupPlan;
  v16 = [(CTCarrierSignupPlan *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    objc_storeStrong((id *)&v16->_url, a4);
    objc_storeStrong((id *)&v16->_type, a5);
    v16->_option = a6;
    objc_storeStrong((id *)&v16->_identifiers, a7);
  }

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", name=%@", self->_name];
  [v3 appendFormat:@", url=%@", self->_url];
  [v3 appendFormat:@", type=%@", self->_type];
  [v3 appendFormat:@", option=%s", CTPlanPurchaseOptionAsString(-[CTCarrierSignupPlan option](self, "option"))];
  [v3 appendFormat:@", identifiers=%@", self->_identifiers];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTCarrierSignupPlan;
  if ([(CTPlan *)&v31 isEqual:v5])
  {
    v6 = [(CTCarrierSignupPlan *)self name];
    v7 = [v5 name];
    if (v6 != v7)
    {
      v3 = [(CTCarrierSignupPlan *)self name];
      id v8 = [v5 name];
      if (![v3 isEqual:v8])
      {
        char v9 = 0;
        goto LABEL_26;
      }
      v30 = v8;
    }
    id v10 = [(CTCarrierSignupPlan *)self url];
    v11 = [v5 url];
    if (v10 != v11)
    {
      id v12 = [(CTCarrierSignupPlan *)self url];
      id v13 = [v5 url];
      if (![v12 isEqual:v13])
      {
        char v9 = 0;
LABEL_24:

LABEL_25:
        id v8 = v30;
        if (v6 == v7)
        {
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
      v28 = v13;
      v29 = v12;
    }
    id v14 = [(CTCarrierSignupPlan *)self type];
    id v15 = [v5 type];
    if (v14 != v15)
    {
      v16 = [(CTCarrierSignupPlan *)self type];
      v27 = [v5 type];
      if (!objc_msgSend(v16, "isEqual:"))
      {
        char v9 = 0;
        goto LABEL_22;
      }
      v26 = v16;
    }
    int64_t v17 = [(CTCarrierSignupPlan *)self option];
    if (v17 == [v5 option])
    {
      v25 = v3;
      v18 = [(CTCarrierSignupPlan *)self identifiers];
      uint64_t v19 = [v5 identifiers];
      if (v18 == (void *)v19)
      {

        char v9 = 1;
      }
      else
      {
        v24 = (void *)v19;
        v23 = [(CTCarrierSignupPlan *)self identifiers];
        objc_super v20 = [v5 identifiers];
        char v9 = [v23 isEqual:v20];
      }
      BOOL v21 = v14 == v15;
      v3 = v25;
    }
    else
    {
      char v9 = 0;
      BOOL v21 = v14 == v15;
    }
    v16 = v26;
    if (v21)
    {
LABEL_23:

      id v13 = v28;
      id v12 = v29;
      if (v10 == v11) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
  char v9 = 0;
LABEL_28:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCarrierSignupPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CTCarrierSignupPlan;
  id v5 = [(CTPlan *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v10;

    v5->_option = [v4 decodeIntegerForKey:@"option"];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"planID"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTCarrierSignupPlan;
  id v4 = a3;
  [(CTPlan *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"name", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_url forKey:@"url"];
  [v4 encodeObject:self->_type forKey:@"type"];
  [v4 encodeInteger:self->_option forKey:@"option"];
  [v4 encodeObject:self->_identifiers forKey:@"planID"];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)type
{
  return self->_type;
}

- (int64_t)option
{
  return self->_option;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end