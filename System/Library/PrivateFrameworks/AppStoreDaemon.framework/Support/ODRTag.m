@interface ODRTag
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
@end

@implementation ODRTag

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"always_preserved";
  v4[1] = @"bundle_id";
  v4[2] = @"bundle_key";
  v4[3] = @"name";
  v4[4] = @"preservation_priority";
  v2 = +[NSArray arrayWithObjects:v4 count:5];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = sub_1002EC390(self);
    v7 = sub_1002EC390(v5);
    if ([v6 isEqualToString:v7])
    {
      v8 = sub_1002EC3C8(self);
      v9 = sub_1002EC3C8(v5);
      if ([v8 isEqualToString:v9])
      {
        v10 = sub_1002EC448(self);
        v11 = sub_1002EC448(v5);
        unsigned __int8 v12 = [v10 isEqualToString:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

@end