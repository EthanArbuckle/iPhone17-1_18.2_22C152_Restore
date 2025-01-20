@interface DMFControlSessionIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToControlSessionIdentifier:(id)a3;
- (DMFControlGroupIdentifier)groupIdentifier;
- (DMFControlSessionIdentifier)initWithCoder:(id)a3;
- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4;
- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5;
- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5 port:(unsigned __int16)a6;
- (DMFControlSessionIdentifier)initWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringValue;
- (unint64_t)hash;
- (unsigned)leaderIP;
- (unsigned)port;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFControlSessionIdentifier

- (id)stringValue
{
  v3 = NSString;
  v4 = [(DMFControlGroupIdentifier *)self organizationUUID];
  v5 = [v4 UUIDString];
  unsigned int v6 = [(DMFControlGroupIdentifier *)self groupID];
  v7.s_addr = self->_leaderIP;
  v8 = [v3 stringWithFormat:@"%@:%d:%s:%d", v5, v6, inet_ntoa(v7), -[DMFControlSessionIdentifier port](self, "port")];

  return v8;
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  v3 = [DMFControlGroupIdentifier alloc];
  v4 = [(DMFControlGroupIdentifier *)self organizationUUID];
  v5 = [(DMFControlGroupIdentifier *)v3 initWithOrganizationUUID:v4 groupID:[(DMFControlGroupIdentifier *)self groupID]];

  return v5;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  in_addr v7 = (void *)MEMORY[0x1E4F28B00];
  id v8 = a3;
  v9 = [v7 currentHandler];
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"DMFControlSessionIdentifier.m", 35, @"%@ cannot call %@", v10, v11 object file lineNumber description];

  v12 = [(DMFControlSessionIdentifier *)self initWithOrganizationUUID:v8 groupID:v4 leaderIP:0 port:3283];
  return v12;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5
{
  return [(DMFControlSessionIdentifier *)self initWithOrganizationUUID:a3 groupID:a4 leaderIP:*(void *)&a5 port:3283];
}

- (DMFControlSessionIdentifier)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"DMFControlSessionIdentifier.m", 49, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  unsigned int v6 = [v5 componentsSeparatedByString:@":"];
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v8 = [v6 firstObject];
  v9 = (void *)[v7 initWithUUIDString:v8];

  if (v9)
  {
    if ((unint64_t)[v6 count] < 2)
    {
      unsigned __int16 v11 = 0;
    }
    else
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:1];
      unsigned __int16 v11 = [v10 intValue];
    }
    if ((unint64_t)[v6 count] < 3)
    {
      uint64_t v15 = 0;
    }
    else
    {
      id v13 = [v6 objectAtIndexedSubscript:2];
      in_addr_t v14 = inet_addr((const char *)[v13 UTF8String]);

      if (v14 == -1) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
    }
    if ((unint64_t)[v6 count] < 4)
    {
      v16 = 0;
    }
    else
    {
      v16 = [v6 objectAtIndexedSubscript:3];
    }
    if ([v16 length]) {
      unsigned __int16 v17 = [v16 intValue];
    }
    else {
      unsigned __int16 v17 = 3283;
    }
    self = [(DMFControlSessionIdentifier *)self initWithOrganizationUUID:v9 groupID:v11 leaderIP:v15 port:v17];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5 port:(unsigned __int16)a6
{
  v9.receiver = self;
  v9.super_class = (Class)DMFControlSessionIdentifier;
  result = [(DMFControlGroupIdentifier *)&v9 initWithOrganizationUUID:a3 groupID:a4];
  if (result)
  {
    result->_leaderIP = a5;
    result->_port = a6;
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [(DMFControlGroupIdentifier *)self organizationUUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(DMFControlGroupIdentifier *)self groupID];
  uint64_t v6 = [(DMFControlSessionIdentifier *)self leaderIP];
  unint64_t v7 = v5 ^ v6 ^ [(DMFControlSessionIdentifier *)self port];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DMFControlSessionIdentifier;
  if ([(DMFControlGroupIdentifier *)&v7 isEqual:v4]) {
    BOOL v5 = [(DMFControlSessionIdentifier *)self isEqualToControlSessionIdentifier:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToControlSessionIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(DMFControlSessionIdentifier *)self leaderIP];
  if (v5 == [v4 leaderIP])
  {
    int v6 = [(DMFControlSessionIdentifier *)self port];
    BOOL v7 = v6 == [v4 port];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unsigned int v5 = [(DMFControlGroupIdentifier *)self organizationUUID];
  int v6 = objc_msgSend(v4, "initWithOrganizationUUID:groupID:leaderIP:port:", v5, -[DMFControlGroupIdentifier groupID](self, "groupID"), -[DMFControlSessionIdentifier leaderIP](self, "leaderIP"), -[DMFControlSessionIdentifier port](self, "port"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFControlSessionIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFControlSessionIdentifier;
  unsigned int v5 = [(DMFControlGroupIdentifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leaderIP"];
    v5->_leaderIP = [v6 unsignedIntegerValue];

    if ([v4 containsValueForKey:@"port"])
    {
      BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"port"];
      v5->_port = [v7 unsignedIntegerValue];
    }
    else
    {
      v5->_port = 3283;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFControlSessionIdentifier;
  id v4 = a3;
  [(DMFControlGroupIdentifier *)&v7 encodeWithCoder:v4];
  unsigned int v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[DMFControlSessionIdentifier leaderIP](self, "leaderIP", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"leaderIP"];

  int v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", -[DMFControlSessionIdentifier port](self, "port"));
  [v4 encodeObject:v6 forKey:@"port"];
}

- (unsigned)leaderIP
{
  return self->_leaderIP;
}

- (unsigned)port
{
  return self->_port;
}

@end