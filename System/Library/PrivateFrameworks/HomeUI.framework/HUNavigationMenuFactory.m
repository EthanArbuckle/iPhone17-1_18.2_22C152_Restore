@interface HUNavigationMenuFactory
+ (id)homeMenuForButton:(id)a3;
- (HUNavigationMenuFactory)init;
@end

@implementation HUNavigationMenuFactory

+ (id)homeMenuForButton:(id)a3
{
  swift_getObjCClassMetadata();
  v4 = (char *)a3;
  v5 = (void *)sub_1BE42D6F0(v4);

  return v5;
}

- (HUNavigationMenuFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationMenuFactory();
  return [(HUNavigationMenuFactory *)&v3 init];
}

@end