@interface NSDate(GCSJSONSerializable)
+ (id)dateFormatter;
- (id)initWithJSONObject:()GCSJSONSerializable;
- (id)jsonObject;
@end

@implementation NSDate(GCSJSONSerializable)

+ (id)dateFormatter
{
  id v0 = objc_alloc_init((Class)&off_26D32DC88);
  [v0 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];

  return v0;
}

- (id)initWithJSONObject:()GCSJSONSerializable
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = +[NSDate dateFormatter];
    v7 = [v6 dateFromString:v5];

    [v7 timeIntervalSince1970];
    a1 = (id)objc_msgSend(a1, "initWithTimeIntervalSince1970:");

    id v8 = a1;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)jsonObject
{
  v2 = +[NSDate dateFormatter];
  v3 = [v2 stringFromDate:a1];

  return v3;
}

@end