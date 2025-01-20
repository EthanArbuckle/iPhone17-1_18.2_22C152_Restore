@interface ImageSaverRegistrator
- (ImageSaverRegistrator)init;
- (void)dealloc;
@end

@implementation ImageSaverRegistrator

- (void)dealloc
{
  if (self)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)ImageSaverRegistrator;
  [(ImageSaverRegistrator *)&v4 dealloc];
}

- (ImageSaverRegistrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ImageSaverRegistrator;
  v2 = [(ImageSaverRegistrator *)&v6 init];
  v3 = v2;
  if (v2) {
    objc_super v4 = v2;
  }

  return v3;
}

@end