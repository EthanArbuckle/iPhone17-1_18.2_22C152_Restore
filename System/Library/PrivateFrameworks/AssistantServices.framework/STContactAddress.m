@interface STContactAddress
+ (BOOL)supportsSecureCoding;
- (STContactAddress)initWithCoder:(id)a3;
- (STContactAddress)initWithStringValue:(id)a3;
- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4;
- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4 contactIdentifier:(id)a5 contactInternalGUID:(id)a6;
- (id)_aceContextObjectValue;
- (id)contactIdentifier;
- (id)contactInternalGUID;
- (id)description;
- (id)stringValue;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STContactAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInternalGUID, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (STContactAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STContactAddress;
  v5 = [(STSiriModelObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactInternalGUID"];
    contactInternalGUID = v5->_contactInternalGUID;
    v5->_contactInternalGUID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STContactAddress;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"_type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_stringValue forKey:@"_stringValue"];
  [v4 encodeObject:self->_contactIdentifier forKey:@"_contactIdentifier"];
  [v4 encodeObject:self->_contactInternalGUID forKey:@"_contactInternalGUID"];
}

- (id)_aceContextObjectValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F968D0]);
  id v4 = [(STContactAddress *)self stringValue];
  [v3 setData:v4];

  return v3;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  id v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @": %p", self);
  [v3 appendString:@"; type="];
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v6 = @"INVALID";
  }
  else {
    uint64_t v6 = off_1E5924D68[type];
  }
  [v3 appendString:v6];
  [v3 appendString:@"; stringValue="];
  if (self->_stringValue) {
    stringValue = (__CFString *)self->_stringValue;
  }
  else {
    stringValue = @"nil";
  }
  [v3 appendString:stringValue];
  [v3 appendString:@"; contactIdentifier="];
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    v9 = [(NSURL *)contactIdentifier absoluteString];
    [v3 appendString:v9];
  }
  else
  {
    [v3 appendString:@"nil"];
  }
  [v3 appendString:@"; contactInternalGUID="];
  if (self->_contactInternalGUID) {
    contactInternalGUID = (__CFString *)self->_contactInternalGUID;
  }
  else {
    contactInternalGUID = @"nil";
  }
  [v3 appendString:contactInternalGUID];
  [v3 appendString:@">"];
  return v3;
}

- (id)contactInternalGUID
{
  return self->_contactInternalGUID;
}

- (id)contactIdentifier
{
  return self->_contactIdentifier;
}

- (id)stringValue
{
  return self->_stringValue;
}

- (int64_t)type
{
  return self->_type;
}

- (STContactAddress)initWithStringValue:(id)a3
{
  return [(STContactAddress *)self initWithType:0 stringValue:a3];
}

- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4 contactIdentifier:(id)a5 contactInternalGUID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STContactAddress;
  objc_super v13 = [(STContactAddress *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_unint64_t type = a3;
    uint64_t v15 = [v10 copy];
    stringValue = v14->_stringValue;
    v14->_stringValue = (NSString *)v15;

    objc_storeStrong((id *)&v14->_contactIdentifier, a5);
    objc_storeStrong((id *)&v14->_contactInternalGUID, a6);
  }

  return v14;
}

- (STContactAddress)initWithType:(int64_t)a3 stringValue:(id)a4
{
  return [(STContactAddress *)self initWithType:a3 stringValue:a4 contactIdentifier:0 contactInternalGUID:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end