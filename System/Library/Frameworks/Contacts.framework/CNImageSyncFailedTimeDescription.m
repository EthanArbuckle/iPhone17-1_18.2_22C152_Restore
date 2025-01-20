@interface CNImageSyncFailedTimeDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNImageSyncFailedTimeDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNImageSyncFailedTimeDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 imageSyncFailedTime];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49B30];
  }
  return a3 != 0;
}

- (CNImageSyncFailedTimeDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"imageSyncFailedTime" readSelector:sel_imageSyncFailedTime writeSelector:sel_setImageSyncFailedTime_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_imageSyncFailedTime"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[87];
  v5[87] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end