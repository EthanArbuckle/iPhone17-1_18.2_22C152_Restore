@interface BDSServiceNotificationStoreData
+ (BOOL)supportsSecureCoding;
- (BDSServiceNotificationStoreData)initWithCoder:(id)a3;
- (BDSServiceNotificationStoreData)initWithNotificationInfos:(id)a3 changeToken:(int64_t)a4;
- (NSArray)notificationInfos;
- (id)description;
- (int64_t)changeToken;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeToken:(int64_t)a3;
- (void)setNotificationInfos:(id)a3;
@end

@implementation BDSServiceNotificationStoreData

- (BDSServiceNotificationStoreData)initWithNotificationInfos:(id)a3 changeToken:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSServiceNotificationStoreData;
  v8 = [(BDSServiceNotificationStoreData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationInfos, a3);
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
  v4 = [(BDSServiceNotificationStoreData *)self notificationInfos];
  [v5 encodeObject:v4 forKey:@"notificationInfos"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BDSServiceNotificationStoreData changeToken](self, "changeToken"), @"changeToken");
}

- (BDSServiceNotificationStoreData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSServiceNotificationStoreData;
  id v5 = [(BDSServiceNotificationStoreData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"notificationInfos"];
    notificationInfos = v5->_notificationInfos;
    v5->_notificationInfos = (NSArray *)v8;

    v5->_changeToken = (int64_t)[v4 decodeIntegerForKey:@"changeToken"];
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BDSServiceNotificationStoreData *)self notificationInfos];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@:%p notificationInfos=%@ changeToken=%ld>", v4, self, v5, [(BDSServiceNotificationStoreData *)self changeToken]];

  return v6;
}

- (NSArray)notificationInfos
{
  return self->_notificationInfos;
}

- (void)setNotificationInfos:(id)a3
{
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