@interface AAUISpecifieriCloudStorage
+ (int64_t)cellStyle;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUISpecifieriCloudStorage

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISpecifieriCloudStorage;
  [(AAUISpecifieriCloudStorage *)&v7 refreshCellContentsWithSpecifier:a3];
  v4 = [(AAUISpecifieriCloudStorage *)self imageView];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = +[UIImage imageNamed:@"iCloudStorageSpecifier" inBundle:v5];
  [v4 setImage:v6];

  [(AAUISpecifieriCloudStorage *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)AAUISpecifieriCloudStorage;
  [(AAUISpecifieriCloudStorage *)&v2 layoutSubviews];
}

@end