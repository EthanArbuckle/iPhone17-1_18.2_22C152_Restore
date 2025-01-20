@interface CNContactsAppIntentDependencyManager
+ (void)setupAppIntentDependencies;
+ (void)setupAppIntentDependenciesWithActionPerformer:(id)a3;
- (CNContactsAppIntentDependencyManager)init;
@end

@implementation CNContactsAppIntentDependencyManager

+ (void)setupAppIntentDependencies
{
}

+ (void)setupAppIntentDependenciesWithActionPerformer:(id)a3
{
  swift_unknownObjectRetain();
  sub_20B76E36C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (CNContactsAppIntentDependencyManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactsAppIntentDependencyManager;
  return [(CNContactsAppIntentDependencyManager *)&v3 init];
}

@end