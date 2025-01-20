@interface CNWallpaperSyncFailedTimeDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNWallpaperSyncFailedTimeDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNWallpaperSyncFailedTimeDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 wallpaperSyncFailedTime];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49DC8];
  }
  return a3 != 0;
}

- (CNWallpaperSyncFailedTimeDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"wallpaperSyncFailedTime" readSelector:sel_wallpaperSyncFailedTime writeSelector:sel_setWallpaperSyncFailedTime_];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_wallpaperSyncFailedTime"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[88];
  v5[88] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end