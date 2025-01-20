@interface AppMetricsEvent
+ (Class)databaseEntityClass;
- (AppMetricsEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)engagementData;
@end

@implementation AppMetricsEvent

- (AppMetricsEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppMetricsEvent;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)engagementData
{
  if (a1)
  {
    a1 = [a1 valueForProperty:@"payload"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AppMetricsEvent;
  id v5 = -[SQLiteMemoryEntity copyWithZone:](&v12, "copyWithZone:");
  v6 = v5;
  if (self)
  {
    v7 = [(SQLiteMemoryEntity *)self valueForProperty:@"bundle_id"];
    sub_10023A24C(v6, v7);

    unsigned __int8 v8 = sub_10026E91C(self, @"event_type");
  }
  else
  {
    sub_10023A24C(v5, 0);
    unsigned __int8 v8 = 0;
  }
  sub_10023A320(v6, v8);
  v9 = -[AppMetricsEvent engagementData]_0(self);
  id v10 = [v9 copyWithZone:a3];
  sub_10023A400(v6, v10);

  return v6;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end