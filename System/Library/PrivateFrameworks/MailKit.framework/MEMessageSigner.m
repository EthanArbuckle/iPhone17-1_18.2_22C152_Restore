@interface MEMessageSigner
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MEMessageSigner)initWithCoder:(id)a3;
- (MEMessageSigner)initWithEmailAddresses:(NSArray *)emailAddresses signatureLabel:(NSString *)label context:(NSData *)context;
- (NSArray)emailAddresses;
- (NSData)context;
- (NSString)label;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageSigner

- (MEMessageSigner)initWithEmailAddresses:(NSArray *)emailAddresses signatureLabel:(NSString *)label context:(NSData *)context
{
  v9 = emailAddresses;
  v10 = label;
  v11 = context;
  v15.receiver = self;
  v15.super_class = (Class)MEMessageSigner;
  v12 = [(MEMessageSigner *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_emailAddresses, emailAddresses);
    objc_storeStrong((id *)&v13->_label, label);
    objc_storeStrong((id *)&v13->_context, context);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageSigner)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"EFPropertyKey_emailAddresses"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_label"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_context"];
  v11 = [(MEMessageSigner *)self initWithEmailAddresses:v8 signatureLabel:v9 context:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(MEMessageSigner *)self emailAddresses];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_emailAddresses"];

  v5 = [(MEMessageSigner *)self label];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_label"];

  uint64_t v6 = [(MEMessageSigner *)self context];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_context"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    id v7 = [(MEMessageSigner *)self emailAddresses];
    v8 = [v6 emailAddresses];
    if ([v7 isEqual:v8])
    {
      v9 = [(MEMessageSigner *)self label];
      v10 = [v6 label];
      if ([v9 isEqual:v10])
      {
        v11 = [(MEMessageSigner *)self context];
        v12 = [v6 context];
        char v13 = [v11 isEqual:v12];
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
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(MEMessageSigner *)self emailAddresses];
  uint64_t v4 = [v3 hash];

  v5 = [(MEMessageSigner *)self label];
  uint64_t v6 = [v5 hash];

  id v7 = [(MEMessageSigner *)self context];
  unint64_t v8 = 33 * (33 * v4 + v6) + [v7 hash] + 35937;

  return v8;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end