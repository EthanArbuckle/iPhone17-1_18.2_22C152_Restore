@interface ATXNamedHandle
+ (BOOL)supportsSecureCoding;
- (ATXNamedHandle)initWithCoder:(id)a3;
- (ATXNamedHandle)initWithName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5 handleType:(id)a6;
- (NSString)contactIdentifier;
- (NSString)handle;
- (NSString)handleType;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXNamedHandle

- (ATXNamedHandle)initWithName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5 handleType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNamedHandle;
  v14 = [(ATXNamedHandle *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    handle = v14->_handle;
    v14->_handle = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    handleType = v14->_handleType;
    v14->_handleType = (NSString *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXNamedHandle *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(ATXNamedHandle *)self handle];
  [v4 encodeObject:v6 forKey:@"handle"];

  v7 = [(ATXNamedHandle *)self contactIdentifier];
  [v4 encodeObject:v7 forKey:@"contactIdentifier"];

  id v8 = [(ATXNamedHandle *)self handleType];
  [v4 encodeObject:v8 forKey:@"handleType"];
}

- (ATXNamedHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXNamedHandle;
  v5 = [(ATXNamedHandle *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handleType"];
    handleType = v5->_handleType;
    v5->_handleType = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end