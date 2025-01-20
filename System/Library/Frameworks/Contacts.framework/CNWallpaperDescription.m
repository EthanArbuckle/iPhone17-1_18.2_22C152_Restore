@interface CNWallpaperDescription
+ (id)os_log;
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (CNWallpaperDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNWallpaperDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 wallpaper];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49DC0];
  }
  return a3 != 0;
}

- (CNWallpaperDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"wallpaper" readSelector:sel_wallpaper writeSelector:sel_setWallpaper_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 wallpaper];
  if (!v8)
  {
    v4 = [v7 wallpaper];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 wallpaper];
  v10 = [v7 wallpaper];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_wallpaper"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[81];
  v5[81] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = +[CNiOSABConversions dataFromABBytes:a3 length:a4];
  v5 = [[CNWallpaper alloc] initWithDataRepresentationForPersistence:v4];

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_6 != -1) {
    dispatch_once(&os_log_cn_once_token_6, &__block_literal_global_160);
  }
  v2 = (void *)os_log_cn_once_object_6;

  return v2;
}

uint64_t __39__CNWallpaperDescription_iOSAB__os_log__block_invoke()
{
  os_log_cn_once_object_6 = (uint64_t)os_log_create("com.apple.contacts", "CNContactPropertyDescriptions+iOSAB");

  return MEMORY[0x1F41817F8]();
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 dataRepresentationForPersistence];

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  id v3 = (CNWallpaper *)a3;
  if (a3)
  {
    CFTypeID v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      id v3 = [[CNWallpaper alloc] initWithDataRepresentationForPersistence:v5];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

@end