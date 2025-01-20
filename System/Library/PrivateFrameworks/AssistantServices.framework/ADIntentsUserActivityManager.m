@interface ADIntentsUserActivityManager
- (ADIntentsUserActivityManager)init;
- (id)description;
- (id)userActivityForID:(id)a3;
- (void)reset;
- (void)setUserActivity:(id)a3 forID:(id)a4;
@end

@implementation ADIntentsUserActivityManager

- (void).cxx_destruct
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ADIntentsUserActivityManager;
  v3 = [(ADIntentsUserActivityManager *)&v7 description];
  v4 = [(NSMutableDictionary *)self->_userActivitiesStore description];
  v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (void)reset
{
}

- (void)setUserActivity:(id)a3 forID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    [(ADIntentsUserActivityManager *)self reset];
    userActivitiesStore = self->_userActivitiesStore;
    if (v8) {
      [(NSMutableDictionary *)userActivitiesStore setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)userActivitiesStore removeObjectForKey:v6];
    }
  }
}

- (id)userActivityForID:(id)a3
{
  if (a3)
  {
    v5 = -[NSMutableDictionary objectForKey:](self->_userActivitiesStore, "objectForKey:");
    if (!v5)
    {
      [(ADIntentsUserActivityManager *)self reset];
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (ADIntentsUserActivityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADIntentsUserActivityManager;
  v2 = [(ADIntentsUserActivityManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    userActivitiesStore = v2->_userActivitiesStore;
    v2->_userActivitiesStore = v3;
  }
  return v2;
}

@end