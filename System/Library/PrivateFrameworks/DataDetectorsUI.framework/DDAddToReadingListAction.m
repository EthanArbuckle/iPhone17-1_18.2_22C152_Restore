@interface DDAddToReadingListAction
+ (BOOL)isAvailable;
- (id)iconName;
- (id)localizedName;
- (void)performFromView:(id)a3;
@end

@implementation DDAddToReadingListAction

+ (BOOL)isAvailable
{
  id v2 = objc_alloc(MEMORY[0x1E4F22408]);
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
  v4 = (void *)[v2 initWithURL:v3 error:0];
  v5 = [v4 bundleRecord];
  v6 = [v5 bundleIdentifier];

  if (v6) {
    char v7 = [v6 isEqualToString:@"com.apple.mobilesafari"];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)localizedName
{
  return DDLocalizedString(@"Add to Reading List");
}

- (id)iconName
{
  return @"eyeglasses";
}

- (void)performFromView:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F3AED0], "defaultReadingList", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addReadingListItemWithURL:self->super._url title:0 previewText:0 error:0];
}

@end