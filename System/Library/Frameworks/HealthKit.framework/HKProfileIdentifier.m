@interface HKProfileIdentifier
+ (BOOL)isValidProfileType:(int64_t)a3;
+ (BOOL)isValidSecondaryProfileType:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_profileWithUUID:(id)a3 type:(int64_t)a4;
+ (id)primaryProfile;
- (BOOL)isEqual:(id)a3;
- (HKProfileIdentifier)init;
- (HKProfileIdentifier)initWithCoder:(id)a3;
- (NSUUID)identifier;
- (id)_init;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKProfileIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKProfileIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKProfileIdentifier *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pident"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"ptype"];
  }

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKProfileIdentifier;
  return [(HKProfileIdentifier *)&v3 init];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    uint64_t v6 = [v4 identifier];
    char v7 = [(NSUUID *)identifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (BOOL)isValidProfileType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4 || a3 == 100;
}

+ (BOOL)isValidSecondaryProfileType:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3 || a3 == 100;
}

- (HKProfileIdentifier)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)primaryProfile
{
  if (primaryProfile_onceToken != -1) {
    dispatch_once(&primaryProfile_onceToken, &__block_literal_global_106);
  }
  v2 = (void *)primaryProfile_primaryProfile;

  return v2;
}

uint64_t __37__HKProfileIdentifier_primaryProfile__block_invoke()
{
  id v0 = [[HKProfileIdentifier alloc] _init];
  v1 = (void *)primaryProfile_primaryProfile;
  primaryProfile_primaryProfile = (uint64_t)v0;

  *(void *)(primaryProfile_primaryProfile + 16) = 1;
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  uint64_t v3 = *(void *)(primaryProfile_primaryProfile + 8);
  *(void *)(primaryProfile_primaryProfile + 8) = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)_profileWithUUID:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[HKProfileIdentifier alloc] _init];
  uint64_t v7 = [v5 copy];

  v8 = (void *)v6[1];
  v6[1] = v7;

  v6[2] = a4;

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = HKStringFromProfileType(self->_type);
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %@ %@>", v5, v6, self->_identifier];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"pident"];
  [v5 encodeInteger:self->_type forKey:@"ptype"];
}

- (int64_t)type
{
  return self->_type;
}

@end