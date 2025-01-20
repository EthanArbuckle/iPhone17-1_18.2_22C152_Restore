@interface NSUUID(GCSJSONSerializable)
- (id)initWithJSONObject:()GCSJSONSerializable;
@end

@implementation NSUUID(GCSJSONSerializable)

- (id)initWithJSONObject:()GCSJSONSerializable
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a1 = (id)[a1 initWithUUIDString:v4];
    id v5 = a1;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end