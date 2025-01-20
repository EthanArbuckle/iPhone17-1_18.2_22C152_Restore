@interface IDSServerMessagingOptions
+ (BOOL)supportsSecureCoding;
- (IDSServerMessagingOptions)initWithCoder:(id)a3;
- (NSDictionary)additionalTopLevelFields;
- (NSNumber)cancelOnClientCrash;
- (NSNumber)command;
- (NSNumber)timeout;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalTopLevelFields:(id)a3;
- (void)setCancelOnClientCrash:(id)a3;
- (void)setCommand:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation IDSServerMessagingOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IDSServerMessagingOptions *)self timeout];
  [v4 encodeObject:v5 forKey:@"timeout"];

  v6 = [(IDSServerMessagingOptions *)self command];
  [v4 encodeObject:v6 forKey:@"command"];

  v7 = [(IDSServerMessagingOptions *)self cancelOnClientCrash];
  [v4 encodeObject:v7 forKey:@"cancelOnCrash"];

  id v8 = [(IDSServerMessagingOptions *)self additionalTopLevelFields];
  [v4 encodeObject:v8 forKey:@"options"];
}

- (IDSServerMessagingOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IDSServerMessagingOptions;
  v5 = [(IDSServerMessagingOptions *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeout"];
    timeout = v5->_timeout;
    v5->_timeout = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
    command = v5->_command;
    v5->_command = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelOnCrash"];
    cancelOnClientCrash = v5->_cancelOnClientCrash;
    v5->_cancelOnClientCrash = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"options"];
    additionalTopLevelFields = v5->_additionalTopLevelFields;
    v5->_additionalTopLevelFields = (NSDictionary *)v18;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IDSServerMessagingOptions *)self timeout];
  uint64_t v6 = [(IDSServerMessagingOptions *)self command];
  v7 = [(IDSServerMessagingOptions *)self cancelOnClientCrash];
  uint64_t v8 = [(IDSServerMessagingOptions *)self additionalTopLevelFields];
  v9 = [v3 stringWithFormat:@"<%@: %p timeout: %@, command: %@, cancelOnClientCrash: %@, additionalTopLevelFields: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (NSNumber)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSNumber)cancelOnClientCrash
{
  return self->_cancelOnClientCrash;
}

- (void)setCancelOnClientCrash:(id)a3
{
}

- (NSDictionary)additionalTopLevelFields
{
  return self->_additionalTopLevelFields;
}

- (void)setAdditionalTopLevelFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTopLevelFields, 0);
  objc_storeStrong((id *)&self->_cancelOnClientCrash, 0);
  objc_storeStrong((id *)&self->_command, 0);

  objc_storeStrong((id *)&self->_timeout, 0);
}

@end