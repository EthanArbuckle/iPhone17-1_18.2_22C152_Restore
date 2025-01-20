@interface UIImageView
- (NSString)imageBundleIdentifier;
- (void)setImageBundleIdentifier:(id)a3;
@end

@implementation UIImageView

- (void)setImageBundleIdentifier:(id)a3
{
  id v6 = a3;
  objc_setAssociatedObject(self, "imageBundleIdentifier", v6, (void *)3);
  if (v6)
  {
    v4 = +[UIScreen mainScreen];
    [v4 scale];
    v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
    [(UIImageView *)self setImage:v5];
  }
}

- (NSString)imageBundleIdentifier
{
  return (NSString *)objc_getAssociatedObject(self, "imageBundleIdentifier");
}

@end