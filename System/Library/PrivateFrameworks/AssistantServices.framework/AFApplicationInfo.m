@interface AFApplicationInfo
+ (BOOL)supportsSecureCoding;
- (AFApplicationInfo)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)description;
- (int)pid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation AFApplicationInfo

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    if ([(NSString *)identifier isEqualToString:v6])
    {
      int pid = self->_pid;
      BOOL v8 = pid == [v4 pid];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFApplicationInfo;
  id v4 = [(AFApplicationInfo *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ %@ %d", v4, self->_identifier, self->_pid];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash] ^ self->_pid;
}

- (AFApplicationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFApplicationInfo;
  v5 = [(AFApplicationInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_int pid = [v4 decodeInt32ForKey:@"_pid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeInt32:self->_pid forKey:@"_pid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end