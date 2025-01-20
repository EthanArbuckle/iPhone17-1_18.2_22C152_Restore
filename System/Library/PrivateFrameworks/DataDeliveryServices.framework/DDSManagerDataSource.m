@interface DDSManagerDataSource
- (NSDate)date;
- (id)dateForPreferenceKey:(id)a3;
- (void)setDate:(id)a3 forPreferenceKey:(id)a4;
@end

@implementation DDSManagerDataSource

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] date];
}

- (id)dateForPreferenceKey:(id)a3
{
  v3 = DDSGetPreferenceObjectForKey((__CFString *)a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)setDate:(id)a3 forPreferenceKey:(id)a4
{
}

@end