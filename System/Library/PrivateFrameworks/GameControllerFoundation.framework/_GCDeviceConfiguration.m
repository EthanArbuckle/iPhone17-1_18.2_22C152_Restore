@interface _GCDeviceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationWithIdentifier:(id)a3 priority:(unint64_t)a4 deviceIdentifier:(id)a5 deviceDependencies:(id)a6 deviceBuilder:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)isTransient;
- (NSArray)deviceDependencies;
- (NSDictionary)attributes;
- (NSObject)deviceBuilderIdentifier;
- (NSObject)deviceIdentifier;
- (NSObject)identifier;
- (_GCDeviceConfiguration)init;
- (_GCDeviceConfiguration)initWithCoder:(id)a3;
- (id)_initWithIdentifier:(id)a3 attributes:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (id)valueForAttribute:(id)a3;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCDeviceConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)configurationWithIdentifier:(id)a3 priority:(unint64_t)a4 deviceIdentifier:(id)a5 deviceDependencies:(id)a6 deviceBuilder:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = objc_alloc((Class)a1);
  v24[0] = @"Priority";
  v17 = +[NSNumber numberWithUnsignedInteger:a4];
  v25[0] = v17;
  v24[1] = @"DeviceIdentifier";
  v18 = (void *)[v14 copyWithZone:0];

  v25[1] = v18;
  v24[2] = @"DeviceDependencies";
  v19 = (void *)[v13 copy];

  v25[2] = v19;
  v24[3] = @"DeviceBuilderIdentifier";
  v20 = (void *)[v12 copyWithZone:0];

  v25[3] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v22 = (void *)[v16 _initWithIdentifier:v15 attributes:v21];

  return v22;
}

- (id)_initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GCDeviceConfiguration;
  v8 = [(_GCDeviceConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_attributes, a4);
  }

  return v8;
}

- (_GCDeviceConfiguration)init
{
  return 0;
}

- (_GCDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCDeviceConfiguration;
  v5 = [(_GCDeviceConfiguration *)&v15 init];
  if (v5)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v17 count:2];
    id v7 = +[NSSet setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v8;

    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v10 = +[NSArray arrayWithObjects:v16 count:5];
    v11 = +[NSSet setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  attributes = self->_attributes;
  id v5 = a3;
  [v5 encodeObject:attributes forKey:@"attributes"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [_GCMutableDeviceConfiguration alloc];
  identifier = self->_identifier;
  attributes = self->_attributes;

  return [(_GCMutableDeviceConfiguration *)v4 _initWithIdentifier:identifier attributes:attributes];
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v6 = [v4 identifier];
  if ([identifier isEqual:v6])
  {
    attributes = self->_attributes;
    uint64_t v8 = [v4 attributes];
    BOOL v9 = [(NSDictionary *)attributes isEqualToDictionary:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  identifier = self->_identifier;
  if (isKindOfClass)
  {
    id v7 = [v4 identifier];
    char v8 = [identifier isEqual:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v8 = [self->_identifier isEqual:v4];
    }
    else {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [self->_identifier hash];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  identifier = self->_identifier;
  if ([(_GCDeviceConfiguration *)self isTransient]) {
    id v5 = @" (transient)";
  }
  else {
    id v5 = &stru_26BED82A0;
  }
  return +[NSString stringWithFormat:@"<%@ '%@'%@ priority = %llu>", v3, identifier, v5, [(_GCDeviceConfiguration *)self priority]];
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [self->_identifier hash];
  if ([(_GCDeviceConfiguration *)self isTransient]) {
    id v5 = @" (transient)";
  }
  else {
    id v5 = &stru_26BED82A0;
  }
  return +[NSString stringWithFormat:@"<%@ '#%llx'%@ priority = %llu>", v3, v4, v5, [(_GCDeviceConfiguration *)self priority]];
}

- (id)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ %p '%@'> %@", v4, self, self->_identifier, self->_attributes];

  return v5;
}

- (id)valueForAttribute:(id)a3
{
  return [(NSDictionary *)self->_attributes objectForKey:a3];
}

- (unint64_t)priority
{
  v2 = [(NSDictionary *)self->_attributes objectForKey:@"Priority"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)isTransient
{
  v2 = [(NSDictionary *)self->_attributes objectForKey:@"Transient"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSObject)deviceIdentifier
{
  return [(NSDictionary *)self->_attributes objectForKey:@"DeviceIdentifier"];
}

- (NSArray)deviceDependencies
{
  return (NSArray *)[(NSDictionary *)self->_attributes objectForKey:@"DeviceDependencies"];
}

- (NSObject)deviceBuilderIdentifier
{
  return [(NSDictionary *)self->_attributes objectForKey:@"DeviceBuilderIdentifier"];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end