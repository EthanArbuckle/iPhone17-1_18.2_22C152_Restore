@interface FileConfigRegistrator
- (FileConfigRegistrator)init;
- (void)dealloc;
@end

@implementation FileConfigRegistrator

- (void)dealloc
{
  if (self)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    sub_1BA84CB40(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)FileConfigRegistrator;
  [(FileConfigRegistrator *)&v5 dealloc];
}

- (FileConfigRegistrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)FileConfigRegistrator;
  v2 = [(FileConfigRegistrator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    sub_1BA84D160(v2);
    v4 = v3;
  }

  return v3;
}

@end