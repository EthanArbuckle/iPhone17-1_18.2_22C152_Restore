@interface AccountEvent
+ (Class)databaseEntityClass;
- (AccountEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AccountEvent

- (AccountEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AccountEvent;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)description
{
  objc_super v3 = sub_100222BDC(self);
  v4 = sub_1002826D4(v3);
  v5 = sub_100222BA4(self);
  v6 = sub_1002826D4(v5);
  v7 = sub_100222B34(self);
  v8 = sub_100222B6C(self);
  v9 = +[NSString stringWithFormat:@"{ start: %@ end: %@ account: %@/%@  type: %ld }", v4, v6, v7, v8, sub_100222C14(self)];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AccountEvent;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end