@interface ASDNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationWithName:(id)a3 userInfo:(id)a4;
- (ASDNotification)initWithCoder:(id)a3;
- (ASDNotification)initWithName:(id)a3 userInfo:(id)a4;
- (NSDictionary)userInfo;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDNotification

+ (id)notificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 userInfo:v6];

  return v8;
}

- (ASDNotification)initWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDNotification;
  v8 = [(ASDNotification *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ASDNotification;
  v4 = [(ASDNotification *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {name = %@ userInfo = %@}", v4, self->_name, self->_userInfo];;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASDNotification;
  v5 = [(ASDNotification *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"N"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"U"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"N"];
  [v5 encodeObject:self->_userInfo forKey:@"U"];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end