@interface ContainerUserDefaults
+ (id)getSharedUserDefaults:(id)a3 containerURL:(id)a4;
@end

@implementation ContainerUserDefaults

+ (id)getSharedUserDefaults:(id)a3 containerURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSUserDefaults) _initWithSuiteName:v6 container:v5];

  return v7;
}

@end