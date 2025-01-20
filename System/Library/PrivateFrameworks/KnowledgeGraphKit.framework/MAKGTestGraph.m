@interface MAKGTestGraph
+ (Class)concreteGraphClass;
@end

@implementation MAKGTestGraph

+ (Class)concreteGraphClass
{
  return (Class)objc_opt_class();
}

@end