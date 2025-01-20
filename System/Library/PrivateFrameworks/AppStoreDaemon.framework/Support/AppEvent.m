@interface AppEvent
+ (Class)databaseEntityClass;
- (AppEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppEvent

- (AppEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppEvent;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)description
{
  objc_super v3 = +[NSMutableArray array];
  unsigned __int8 v4 = sub_10026E91C(self, @"event_type");
  v5 = sub_10022DD24((uint64_t)AppEvent, v4);
  v6 = +[NSString stringWithFormat:@"eventType:%@", v5];
  [v3 addObject:v6];

  if (v4 == 2)
  {
    v7 = sub_10026E8A4(self, @"launch_time");
    v8 = v7;
    if (v7)
    {
      v9 = sub_1002826D4(v7);
      v10 = +[NSString stringWithFormat:@"launchTime:%@", v9];
      [v3 addObject:v10];
    }
    v11 = sub_10026E8A4(self, @"launch_end_time");
    v12 = v11;
    if (v11)
    {
      v13 = sub_1002826D4(v11);
      v14 = +[NSString stringWithFormat:@"launchEndTime:%@", v13];
      [v3 addObject:v14];
    }
  }
  v15 = [v3 componentsJoinedByString:@","];
  v16 = +[NSString stringWithFormat:@"{ %@ }", v15];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AppEvent;
  v5 = -[SQLiteMemoryEntity copyWithZone:](&v9, "copyWithZone:");
  id v6 = [(NSMutableArray *)self->_mutableForegroundEvents copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryAccountID, 0);
  objc_storeStrong((id *)&self->_mutableForegroundEvents, 0);
}

@end