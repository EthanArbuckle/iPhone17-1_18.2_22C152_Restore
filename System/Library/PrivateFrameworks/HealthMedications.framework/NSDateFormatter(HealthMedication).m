@interface NSDateFormatter(HealthMedication)
+ (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:;
- (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:;
@end

@implementation NSDateFormatter(HealthMedication)

- (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 dateFormat];
  [a1 setLocalizedDateFormatFromTemplate:@"j"];
  v9 = [a1 stringFromDate:v7];
  v10 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v11 = [v10 invertedSet];
  v12 = [v9 componentsSeparatedByCharactersInSet:v11];
  v13 = [v12 componentsJoinedByString:&stru_1F1710980];

  id v14 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v15 = [v14 numberFromString:v13];

  if (v15)
  {
    uint64_t v16 = [v15 integerValue];
  }
  else
  {
    v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v16 = [v17 component:32 fromDate:v7];
  }
  [a1 setDateFormat:v8];
  if (v16 == 1)
  {
    id v18 = [v6 stringByAppendingString:@"_SINGULAR"];
  }
  else
  {
    id v18 = v6;
  }
  v19 = v18;

  return v19;
}

+ (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:
{
  v5 = (objc_class *)MEMORY[0x1E4F28C10];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = objc_msgSend(v8, "hm_localizableTimeStringKeyWithPrefix:date:", v7, v6);

  return v9;
}

@end