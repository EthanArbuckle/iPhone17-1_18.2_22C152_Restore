@interface IDSServerMessagingIncomingContext
+ (BOOL)supportsSecureCoding;
- (BOOL)fromServerStorage;
- (IDSCertifiedDeliveryContext)certifiedDeliveryContext;
- (IDSServerMessagingIncomingContext)initWithCoder:(id)a3;
- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 command:(id)a5 identifier:(id)a6 additionalTopLevelFields:(id)a7;
- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 identifier:(id)a5;
- (NSDictionary)additionalTopLevelFields;
- (NSNumber)command;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCertifiedDeliveryContext:(id)a3;
- (void)setCommand:(id)a3;
- (void)setFromServerStorage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation IDSServerMessagingIncomingContext

- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 identifier:(id)a5
{
  return [(IDSServerMessagingIncomingContext *)self initWithFromServerStorage:a3 certifiedDeliveryContext:a4 command:0 identifier:a5 additionalTopLevelFields:MEMORY[0x1E4F1CC08]];
}

- (IDSServerMessagingIncomingContext)initWithFromServerStorage:(BOOL)a3 certifiedDeliveryContext:(id)a4 command:(id)a5 identifier:(id)a6 additionalTopLevelFields:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSServerMessagingIncomingContext;
  v17 = [(IDSServerMessagingIncomingContext *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_fromServerStorage = a3;
    objc_storeStrong((id *)&v17->_certifiedDeliveryContext, a4);
    objc_storeStrong((id *)&v18->_identifier, a6);
    objc_storeStrong((id *)&v18->_command, a5);
    objc_storeStrong((id *)&v18->_additionalTopLevelFields, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IDSServerMessagingIncomingContext fromServerStorage](self, "fromServerStorage"), @"fromStorage");
  v5 = [(IDSServerMessagingIncomingContext *)self certifiedDeliveryContext];
  [v4 encodeObject:v5 forKey:@"cdContext"];

  v6 = [(IDSServerMessagingIncomingContext *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(IDSServerMessagingIncomingContext *)self command];
  [v4 encodeObject:v7 forKey:@"command"];

  id v8 = [(IDSServerMessagingIncomingContext *)self additionalTopLevelFields];
  [v4 encodeObject:v8 forKey:@"additionalTopLevel"];
}

- (IDSServerMessagingIncomingContext)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeBoolForKey:@"fromStorage"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cdContext"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  id v14 = [v3 decodeObjectOfClasses:v13 forKey:@"additionalTopLevel"];

  id v15 = [(IDSServerMessagingIncomingContext *)self initWithFromServerStorage:v4 certifiedDeliveryContext:v5 command:v7 identifier:v6 additionalTopLevelFields:v14];
  return v15;
}

- (BOOL)fromServerStorage
{
  return self->_fromServerStorage;
}

- (void)setFromServerStorage:(BOOL)a3
{
  self->_fromServerStorage = a3;
}

- (IDSCertifiedDeliveryContext)certifiedDeliveryContext
{
  return self->_certifiedDeliveryContext;
}

- (void)setCertifiedDeliveryContext:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (NSDictionary)additionalTopLevelFields
{
  return self->_additionalTopLevelFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTopLevelFields, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_certifiedDeliveryContext, 0);
}

@end