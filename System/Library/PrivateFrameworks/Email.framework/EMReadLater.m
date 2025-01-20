@interface EMReadLater
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (EMReadLater)initWithCoder:(id)a3;
- (EMReadLater)initWithDate:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSString)ef_publicDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMReadLater

- (EMReadLater)initWithDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMReadLater;
  v6 = [(EMReadLater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v7;
}

- (NSString)description
{
  v2 = [(EMReadLater *)self date];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (BOOL)isActive
{
  v2 = [(EMReadLater *)self date];
  char v3 = objc_msgSend(v2, "ef_isEarlierThanNow");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMReadLater *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(EMReadLater *)self date];
      v6 = [(EMReadLater *)v4 date];
      char v7 = EFObjectsAreEqual();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EMReadLater *)self date];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = NSString;
  v4 = [(EMReadLater *)self date];
  id v5 = [v3 stringWithFormat:@"date:%@, isActive:%d", v4, -[EMReadLater isActive](self, "isActive")];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMReadLater)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_date"];
  v6 = [(EMReadLater *)self initWithDate:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(EMReadLater *)self date];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_date"];
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end