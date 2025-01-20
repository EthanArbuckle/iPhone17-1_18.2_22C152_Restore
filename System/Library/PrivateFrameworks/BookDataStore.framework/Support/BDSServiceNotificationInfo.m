@interface BDSServiceNotificationInfo
+ (BOOL)supportsSecureCoding;
- (BDSServiceNotificationInfo)initWithCoder:(id)a3;
- (BDSServiceNotificationInfo)initWithName:(id)a3 changeToken:(int64_t)a4;
- (NSString)name;
- (id)description;
- (int64_t)changeToken;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeToken:(int64_t)a3;
@end

@implementation BDSServiceNotificationInfo

- (BDSServiceNotificationInfo)initWithName:(id)a3 changeToken:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSServiceNotificationInfo;
  v8 = [(BDSServiceNotificationInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_changeToken = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(BDSServiceNotificationInfo *)self name];
  [v5 encodeObject:v4 forKey:@"name"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BDSServiceNotificationInfo changeToken](self, "changeToken"), @"changeToken");
}

- (BDSServiceNotificationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSServiceNotificationInfo;
  id v5 = [(BDSServiceNotificationInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_changeToken = (int64_t)[v4 decodeIntegerForKey:@"changeToken"];
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BDSServiceNotificationInfo *)self name];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@:%p name=%@ changeToken=%ld>", v4, self, v5, [(BDSServiceNotificationInfo *)self changeToken]];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(int64_t)a3
{
  self->_changeToken = a3;
}

- (void).cxx_destruct
{
}

@end