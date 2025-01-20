@interface _EXItemProviderItem
+ (BOOL)supportsSecureCoding;
- (NSCoder)encodedPayload;
- (NSError)error;
- (NSObject)payload;
- (NSString)typeIdentifier;
- (NSUUID)payloadIdentifier;
- (_EXItemProviderItem)initWithCoder:(id)a3;
- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 error:(id)a4;
- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 payload:(id)a4;
- (id)payloadOfClass:(Class)a3;
- (id)payloadOfClasses:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncodedPayload:(id)a3;
@end

@implementation _EXItemProviderItem

- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_EXItemProviderItem *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    typeIdentifier = v8->_typeIdentifier;
    v8->_typeIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_payload, a4);
    if (v7)
    {
      uint64_t v11 = objc_opt_new();
      payloadIdentifier = v8->_payloadIdentifier;
      v8->_payloadIdentifier = (NSUUID *)v11;
    }
  }

  return v8;
}

- (_EXItemProviderItem)initWithTypeIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_EXItemProviderItem *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    typeIdentifier = v8->_typeIdentifier;
    v8->_typeIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeIdentifier"];
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadIdentifier"];
    payloadIdentifier = v5->_payloadIdentifier;
    v5->_payloadIdentifier = (NSUUID *)v8;

    v10 = +[_EXDefaults sharedInstance];
    uint64_t v11 = [v10 errorTypes];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_typeIdentifier forKey:@"typeIdentifier"];
  error = self->_error;
  if (error) {
    [v6 encodeObject:error forKey:@"error"];
  }
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier) {
    [v6 encodeObject:payloadIdentifier forKey:@"payloadIdentifier"];
  }
}

- (id)payloadOfClass:(Class)a3
{
  payload = self->_payload;
  if (payload) {
    goto LABEL_4;
  }
  encodedPayload = self->_encodedPayload;
  if (encodedPayload)
  {
    id v7 = [(NSUUID *)self->_payloadIdentifier UUIDString];
    uint64_t v8 = [(NSCoder *)encodedPayload decodeObjectOfClass:a3 forKey:v7];
    uint64_t v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
LABEL_4:
    v10 = payload;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (id)payloadOfClasses:(id)a3
{
  id v4 = a3;
  payload = self->_payload;
  if (payload) {
    goto LABEL_4;
  }
  encodedPayload = self->_encodedPayload;
  if (encodedPayload)
  {
    id v7 = [(NSUUID *)self->_payloadIdentifier UUIDString];
    uint64_t v8 = [(NSCoder *)encodedPayload decodeObjectOfClasses:v4 forKey:v7];
    uint64_t v9 = self->_payload;
    self->_payload = v8;

    payload = self->_payload;
LABEL_4:
    v10 = payload;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)payloadIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSObject)payload
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSCoder)encodedPayload
{
  return (NSCoder *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncodedPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedPayload, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);

  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

@end