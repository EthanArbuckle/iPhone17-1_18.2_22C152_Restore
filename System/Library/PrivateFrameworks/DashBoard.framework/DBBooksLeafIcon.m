@interface DBBooksLeafIcon
+ (Class)dataSourceClass;
@end

@implementation DBBooksLeafIcon

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

@end