@interface CTResumableRoadsideProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTResumableRoadsideProvider:(id)a3;
- (BOOL)success;
- (CTResumableRoadsideProvider)initWithCoder:(id)a3;
- (NSNumber)providerId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProviderId:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation CTResumableRoadsideProvider

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTResumableRoadsideProvider *)self success];
  v5 = "NO";
  if (v4) {
    v5 = "YES";
  }
  [v3 appendFormat:@", success=%s", v5];
  v6 = [(CTResumableRoadsideProvider *)self providerId];
  [v3 appendFormat:@", providerId=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTResumableRoadsideProvider:(id)a3
{
  id v4 = a3;
  int v5 = [(CTResumableRoadsideProvider *)self success];
  if (v5 == [v4 success])
  {
    v7 = [(CTResumableRoadsideProvider *)self providerId];
    v8 = [v4 providerId];
    if (v7 == v8)
    {
      char v6 = 1;
    }
    else
    {
      v9 = [(CTResumableRoadsideProvider *)self providerId];
      v10 = [v4 providerId];
      char v6 = [v9 isEqualToNumber:v10];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTResumableRoadsideProvider *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTResumableRoadsideProvider *)self isEqualToCTResumableRoadsideProvider:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSuccess:", -[CTResumableRoadsideProvider success](self, "success"));
  char v6 = [(CTResumableRoadsideProvider *)self providerId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setProviderId:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTResumableRoadsideProvider success](self, "success"), @"success");
  id v4 = [(CTResumableRoadsideProvider *)self providerId];
  [v5 encodeObject:v4 forKey:@"providerId"];
}

- (CTResumableRoadsideProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTResumableRoadsideProvider;
  id v5 = [(CTResumableRoadsideProvider *)&v9 init];
  if (v5)
  {
    v5->_success = [v4 decodeBoolForKey:@"success"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerId"];
    providerId = v5->_providerId;
    v5->_providerId = (NSNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSNumber)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end