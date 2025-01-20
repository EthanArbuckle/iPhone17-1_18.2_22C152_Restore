@interface NSDictionary
+ (id)nn_activeSyncStateWithIdentifier:(id)a3 active:(BOOL)a4;
- (BOOL)nn_active;
- (NSDate)nn_date;
- (NSString)nn_identifier;
@end

@implementation NSDictionary

+ (id)nn_activeSyncStateWithIdentifier:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[NSDate date];
  v14[0] = v6;
  v14[1] = v7;
  v8 = +[NSNumber numberWithBool:v4];
  v14[2] = v8;
  v9 = +[NSArray arrayWithObjects:v14 count:3];
  v13[0] = @"nn_identifier";
  v13[1] = @"nn_date";
  v13[2] = @"nn_active";
  v10 = +[NSArray arrayWithObjects:v13 count:3];

  v11 = [a1 dictionaryWithObjects:v9 forKeys:v10];

  return v11;
}

- (NSString)nn_identifier
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"nn_identifier"];
}

- (NSDate)nn_date
{
  return (NSDate *)[(NSDictionary *)self objectForKeyedSubscript:@"nn_date"];
}

- (BOOL)nn_active
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"nn_active"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end