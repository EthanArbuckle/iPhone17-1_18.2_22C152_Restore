@interface CTCellularPlanNumberValidator
+ (BOOL)validate:(id)a3;
@end

@implementation CTCellularPlanNumberValidator

+ (BOOL)validate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

@end