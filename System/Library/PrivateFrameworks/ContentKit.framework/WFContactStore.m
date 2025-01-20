@interface WFContactStore
+ (Class)preferredConcreteSubclass;
+ (id)new;
- (BOOL)addContact:(id)a3 error:(id *)a4;
- (WFContactStore)init;
- (id)allContactsWithSortOrder:(int64_t)a3;
- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4;
- (id)contactWithIdentifier:(id)a3;
- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)contactsWithName:(id)a3;
- (id)firstContactWithEmailAddress:(id)a3;
- (id)firstContactWithPhoneNumber:(id)a3;
@end

@implementation WFContactStore

+ (id)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___WFContactStore;
  return objc_msgSendSuper2(&v3, "new");
}

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

- (BOOL)addContact:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)firstContactWithPhoneNumber:(id)a3
{
  return 0;
}

- (id)firstContactWithEmailAddress:(id)a3
{
  return 0;
}

- (id)contactWithIdentifier:(id)a3
{
  return 0;
}

- (id)contactsWithName:(id)a3
{
  return 0;
}

- (id)allContactsWithSortOrder:(int64_t)a3
{
  return 0;
}

- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4
{
  return 0;
}

- (WFContactStore)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = (WFContactStore *)objc_alloc_init(+[WFContactStore preferredConcreteSubclass]);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFContactStore;
    v4 = [(WFContactStore *)&v7 init];
    self = v4;
  }
  v5 = v4;

  return v5;
}

@end