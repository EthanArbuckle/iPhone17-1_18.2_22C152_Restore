@interface ATXJSONHelper
+ (id)unwrapData:(id)a3;
+ (id)unwrapObject:(id)a3;
+ (id)wrapObject:(id)a3;
@end

@implementation ATXJSONHelper

+ (id)wrapObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = (id)[[NSString alloc] initWithData:v3 encoding:1];
    }
    else {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v5 = v4;

  return v5;
}

+ (id)unwrapObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

+ (id)unwrapData:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXJSONHelper unwrapObject:v3];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v3 dataUsingEncoding:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end