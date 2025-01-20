@interface NSDate(HMFoundation)
+ (NSString)shortDescription;
- (id)hmf_dateComponents;
- (id)hmf_dateComponentsUsingTimeZone:()HMFoundation;
- (id)hmf_localTimeDescription;
@end

@implementation NSDate(HMFoundation)

+ (NSString)shortDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)hmf_localTimeDescription
{
  if (qword_1EB4EEDC8 != -1) {
    dispatch_once(&qword_1EB4EEDC8, &__block_literal_global_40);
  }
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  os_unfair_lock_lock_with_options();
  v3 = [(id)qword_1EB4EEDC0 timeZone];
  char v4 = HMFEqualObjects(v3, v2);

  if ((v4 & 1) == 0) {
    [(id)qword_1EB4EEDC0 setTimeZone:v2];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_71);
  v5 = [(id)qword_1EB4EEDC0 stringFromDate:a1];

  return v5;
}

- (id)hmf_dateComponents
{
  v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v3 = objc_msgSend(a1, "hmf_dateComponentsUsingTimeZone:", v2);

  return v3;
}

- (id)hmf_dateComponentsUsingTimeZone:()HMFoundation
{
  char v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  v6 = [v4 currentCalendar];
  [v6 setTimeZone:v5];

  v7 = [v6 components:124 fromDate:a1];

  return v7;
}

@end