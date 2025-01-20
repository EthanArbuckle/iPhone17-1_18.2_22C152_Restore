@interface IREvent
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEligibleApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOutsideApp;
- (IREvent)init;
- (IREvent)initWithCoder:(id)a3;
- (IREvent)initWithName:(id)a3;
- (NSString)name;
- (id)bundleID;
- (id)contextIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventSubType;
- (int64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IREvent

- (IREvent)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IREvent;
  v6 = [(IREvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  name = self->_name;
  return (id)[v4 initWithName:name];
}

- (void)encodeWithCoder:(id)a3
{
}

- (IREvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IREvent;
  id v5 = [(IREvent *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v7 = self;

    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_super v9 = v5;
  }

  return v5;
}

- (IREvent)init
{
}

+ (id)new
{
}

- (int64_t)eventSubType
{
}

- (id)contextIdentifier
{
}

- (id)bundleID
{
}

- (int64_t)eventType
{
}

- (BOOL)isOutsideApp
{
  return 0;
}

- (BOOL)isEligibleApp
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", name: %@", self->_name];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IREvent *)self name];
    uint64_t v7 = [v5 name];
    if ([v6 isEqual:v7])
    {
      BOOL v8 = 1;
    }
    else
    {
      objc_super v9 = [(IREvent *)self name];
      v10 = [v5 name];
      BOOL v8 = v9 == v10;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash] ^ 0x43;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end