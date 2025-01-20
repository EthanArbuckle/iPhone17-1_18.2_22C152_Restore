@interface CTCellularPlanDateParser
+ (BOOL)validate:(id)a3;
+ (BOOL)validate:(id)a3 parseTo:(double *)a4;
@end

@implementation CTCellularPlanDateParser

+ (BOOL)validate:(id)a3 parseTo:(double *)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_10;
  }
  if (validate_parseTo__onceToken != -1) {
    dispatch_once(&validate_parseTo__onceToken, &__block_literal_global);
  }
  BOOL v6 = 0;
  if (v5 && validate_parseTo__sDateFormatter)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(id)validate_parseTo__sDateFormatter dateFromString:v5];
      v8 = v7;
      if (!v7 || ([v7 timeIntervalSinceReferenceDate], v9 == 0.0))
      {
        BOOL v6 = 0;
      }
      else
      {
        *a4 = v9;
        BOOL v6 = 1;
      }

      goto LABEL_13;
    }
LABEL_10:
    BOOL v6 = 0;
  }
LABEL_13:

  return v6;
}

void __45__CTCellularPlanDateParser_validate_parseTo___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)validate_parseTo__sDateFormatter;
  validate_parseTo__sDateFormatter = (uint64_t)v0;

  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)validate_parseTo__sDateFormatter setLocale:v4];
  [(id)validate_parseTo__sDateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssz"];
  v2 = (void *)validate_parseTo__sDateFormatter;
  v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

+ (BOOL)validate:(id)a3
{
  uint64_t v4 = 0;
  return [a1 validate:a3 parseTo:&v4];
}

@end