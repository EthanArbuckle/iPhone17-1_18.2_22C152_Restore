@interface DMFControlGroupIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGroupIdentifier:(id)a3;
- (DMFControlGroupIdentifier)init;
- (DMFControlGroupIdentifier)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4;
- (DMFControlGroupIdentifier)initWithString:(id)a3;
- (NSString)stringValue;
- (NSUUID)organizationUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)groupID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFControlGroupIdentifier

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"DMFControlGroupIdentifier.m", 16, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (DMFControlGroupIdentifier)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"DMFControlGroupIdentifier.m", 21, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (DMFControlGroupIdentifier)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"DMFControlGroupIdentifier.m", 26, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v6 = [v5 componentsSeparatedByString:@":"];
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  v8 = [v6 firstObject];
  v9 = (void *)[v7 initWithUUIDString:v8];

  if ((unint64_t)[v6 count] < 2)
  {
    unsigned __int16 v11 = 0;
    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v10 = [v6 objectAtIndexedSubscript:1];
  unsigned __int16 v11 = [v10 intValue];

  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  self = [(DMFControlGroupIdentifier *)self initWithOrganizationUUID:v9 groupID:v11];
  v12 = self;
LABEL_8:

  return v12;
}

- (DMFControlGroupIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"DMFControlGroupIdentifier.m", 43, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)DMFControlGroupIdentifier;
  v9 = [(DMFControlGroupIdentifier *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_organizationUUID, a3);
    v10->_groupID = a4;
  }

  return v10;
}

- (NSString)stringValue
{
  v3 = NSString;
  v4 = [(DMFControlGroupIdentifier *)self organizationUUID];
  id v5 = [v4 UUIDString];
  v6 = [v3 stringWithFormat:@"%@:%d", v5, -[DMFControlGroupIdentifier groupID](self, "groupID")];

  return (NSString *)v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DMFControlGroupIdentifier *)self stringValue];
  v6 = [v3 stringWithFormat:@"<%@: %p { identifier =  %@ }>", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(DMFControlGroupIdentifier *)self organizationUUID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(DMFControlGroupIdentifier *)self groupID];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFControlGroupIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(DMFControlGroupIdentifier *)self isEqualToGroupIdentifier:v4];
  }

  return v5;
}

- (BOOL)isEqualToGroupIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DMFControlGroupIdentifier *)self organizationUUID];
  v6 = [v4 organizationUUID];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    BOOL v11 = 0;
  }
  else
  {
    int v10 = [(DMFControlGroupIdentifier *)self groupID];
    BOOL v11 = v10 == [v4 groupID];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL v5 = [(DMFControlGroupIdentifier *)self organizationUUID];
  v6 = objc_msgSend(v4, "initWithOrganizationUUID:groupID:", v5, -[DMFControlGroupIdentifier groupID](self, "groupID"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFControlGroupIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFControlGroupIdentifier;
  BOOL v5 = [(DMFControlGroupIdentifier *)&v11 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationUUID"];
    organizationUUID = v5->_organizationUUID;
    v5->_organizationUUID = (NSUUID *)v7;

    int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    v5->_groupID = [v9 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DMFControlGroupIdentifier *)self organizationUUID];
  [v4 encodeObject:v5 forKey:@"organizationUUID"];

  objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[DMFControlGroupIdentifier groupID](self, "groupID"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"groupID"];
}

- (NSUUID)organizationUUID
{
  return self->_organizationUUID;
}

- (unsigned)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
}

@end