@interface DBComparison
+ (BOOL)isValue:(id)a3 equalTo:(id)a4;
@end

@implementation DBComparison

+ (BOOL)isValue:(id)a3 equalTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if (v5 == v6)
    {
LABEL_2:
      BOOL v8 = 1;
      goto LABEL_3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      char v10 = [(id)v5 isEqualToArray:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        char v10 = [(id)v5 isEqualToDictionary:v7];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          char v10 = [(id)v5 isEqualToSet:v7];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v8 = 0;
            goto LABEL_3;
          }
          char v10 = [(id)v5 isEqual:v7];
        }
      }
    }
    BOOL v8 = v10;
  }
LABEL_3:

  return v8;
}

@end