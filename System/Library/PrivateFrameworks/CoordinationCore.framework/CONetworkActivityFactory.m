@interface CONetworkActivityFactory
+ (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4;
- (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4;
@end

@implementation CONetworkActivityFactory

+ (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  id v4 = a4;
  v5 = (void *)nw_activity_create();
  if (v4) {
    nw_activity_set_parent_activity();
  }

  return v5;
}

- (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = [(id)objc_opt_class() activityWithLabel:v4 parentActivity:v5];

  return v6;
}

@end