@interface WFContactGroup
+ (Class)preferredConcreteSubclass;
+ (id)allContactGroups;
+ (id)contactGroupWithName:(id)a3;
- (BOOL)containsContact:(id)a3;
- (NSArray)contacts;
- (NSString)name;
@end

@implementation WFContactGroup

+ (id)contactGroupWithName:(id)a3
{
  id v4 = a3;
  v5 = [a1 allContactGroups];
  v6 = [v5 objectMatchingKey:@"name" value:v4];

  return v6;
}

+ (id)allContactGroups
{
  v2 = (void *)[a1 preferredConcreteSubclass];
  return (id)[v2 allContactGroups];
}

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

- (BOOL)containsContact:(id)a3
{
  return 0;
}

- (NSArray)contacts
{
  return 0;
}

- (NSString)name
{
  return 0;
}

@end