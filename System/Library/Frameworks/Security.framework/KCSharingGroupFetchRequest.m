@interface KCSharingGroupFetchRequest
+ (BOOL)supportsSecureCoding;
+ (id)all;
+ (id)groupName:(id)a3;
+ (id)pending;
+ (id)predicateMatchingAllGroups;
+ (id)predicateMatchingGroupsWithInviteStatus:(int64_t)a3;
+ (id)predicateMatchingGroupsWithName:(id)a3;
- (KCSharingGroupFetchRequest)init;
- (KCSharingGroupFetchRequest)initWithCoder:(id)a3;
- (KCSharingGroupFetchRequest)initWithPredicate:(id)a3;
- (NSPredicate)predicate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupFetchRequest

- (void).cxx_destruct
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingGroupFetchRequest *)self predicate];
  [v4 encodeObject:v5 forKey:@"predicate"];
}

- (KCSharingGroupFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupFetchRequest;
  id v5 = [(KCSharingGroupFetchRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v6;
  }
  return v5;
}

- (KCSharingGroupFetchRequest)initWithPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupFetchRequest;
  uint64_t v6 = [(KCSharingGroupFetchRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_predicate, a3);
  }

  return v7;
}

- (KCSharingGroupFetchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)KCSharingGroupFetchRequest;
  v2 = [(KCSharingGroupFetchRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    predicate = v2->_predicate;
    v2->_predicate = (NSPredicate *)v3;
  }
  return v2;
}

+ (id)predicateMatchingGroupsWithInviteStatus:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

+ (id)predicateMatchingGroupsWithName:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

+ (id)predicateMatchingAllGroups
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
}

+ (id)pending
{
  v2 = +[KCSharingGroupFetchRequest predicateMatchingGroupsWithInviteStatus:1];
  uint64_t v3 = [[KCSharingGroupFetchRequest alloc] initWithPredicate:v2];

  return v3;
}

+ (id)groupName:(id)a3
{
  uint64_t v3 = +[KCSharingGroupFetchRequest predicateMatchingGroupsWithName:a3];
  id v4 = [[KCSharingGroupFetchRequest alloc] initWithPredicate:v3];

  return v4;
}

+ (id)all
{
  v2 = objc_alloc_init(KCSharingGroupFetchRequest);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end