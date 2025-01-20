@interface COClusterMemberRoleSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)snapshotWithParticipantRoleForMember:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSnapshot:(id)a3;
- (BOOL)isStale;
- (COClusterMember)member;
- (COClusterMemberRoleSnapshot)initWithCoder:(id)a3;
- (COClusterMemberRoleSnapshot)initWithMember:(id)a3 role:(id)a4;
- (COClusterRole)role;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStale:(BOOL)a3;
@end

@implementation COClusterMemberRoleSnapshot

- (COClusterMemberRoleSnapshot)initWithMember:(id)a3 role:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterMemberRoleSnapshot;
  v9 = [(COClusterMemberRoleSnapshot *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_member, a3);
    objc_storeStrong((id *)&v10->_role, a4);
    v10->_stale = 0;
  }

  return v10;
}

+ (id)snapshotWithParticipantRoleForMember:(id)a3
{
  id v3 = a3;
  v4 = [COClusterMemberRoleSnapshot alloc];
  v5 = +[COClusterRole roleForParticipant];
  v6 = [(COClusterMemberRoleSnapshot *)v4 initWithMember:v3 role:v5];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(COClusterMemberRoleSnapshot *)self isStale];
  id v7 = [(COClusterMemberRoleSnapshot *)self member];
  id v8 = [(COClusterMemberRoleSnapshot *)self role];
  uint64_t v9 = 78;
  if (v6) {
    uint64_t v9 = 89;
  }
  v10 = [v3 stringWithFormat:@"<%@: %p, stale = %c member = %@ role = %@>", v5, self, v9, v7, v8];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (COClusterMemberRoleSnapshot *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(COClusterMemberRoleSnapshot *)self isEqualToSnapshot:v4];
  }

  return v5;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  id v4 = a3;
  int v5 = [(COClusterMemberRoleSnapshot *)self isStale];
  if (v5 == [v4 isStale])
  {
    id v7 = [(COClusterMemberRoleSnapshot *)self member];
    id v8 = [v4 member];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(COClusterMemberRoleSnapshot *)self role];
      v10 = [v4 role];
      char v6 = [v9 isEqual:v10];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(COClusterMemberRoleSnapshot *)self member];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COClusterMemberRoleSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"member"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  char v7 = [v4 decodeBoolForKey:@"stale"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {

    uint64_t v9 = 0;
  }
  else
  {
    v10 = [(COClusterMemberRoleSnapshot *)self initWithMember:v5 role:v6];
    uint64_t v9 = v10;
    if (v10) {
      v10->_stale = v7;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(COClusterMemberRoleSnapshot *)self member];
  [v6 encodeObject:v4 forKey:@"member"];

  int v5 = [(COClusterMemberRoleSnapshot *)self role];
  [v6 encodeObject:v5 forKey:@"role"];

  objc_msgSend(v6, "encodeBool:forKey:", -[COClusterMemberRoleSnapshot isStale](self, "isStale"), @"stale");
}

- (COClusterMember)member
{
  return self->_member;
}

- (COClusterRole)role
{
  return self->_role;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_member, 0);
}

@end