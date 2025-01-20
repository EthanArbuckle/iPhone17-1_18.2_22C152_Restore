@interface NSCoder(BMBookmark)
+ (id)bm_allowedClassesForSecureCodingBMBookmark;
+ (void)bm_allowClassesForSecureCodingBMBookmark:()BMBookmark;
@end

@implementation NSCoder(BMBookmark)

+ (id)bm_allowedClassesForSecureCodingBMBookmark
{
  v0 = +[BMBookmarkClasses sharedInstance];
  v1 = [v0 allowedClassesForSecureCodingBMBookmark];

  return v1;
}

+ (void)bm_allowClassesForSecureCodingBMBookmark:()BMBookmark
{
  id v3 = a3;
  id v4 = +[BMBookmarkClasses sharedInstance];
  [v4 allowClassesForSecureCodingBMBookmark:v3];
}

@end