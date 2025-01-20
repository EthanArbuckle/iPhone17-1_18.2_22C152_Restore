@interface DMFLeaveControlGroupRequest
+ (BOOL)supportsSecureCoding;
- (DMFControlGroupIdentifier)groupIdentifier;
- (DMFLeaveControlGroupRequest)initWithCoder:(id)a3;
- (NSArray)leaderIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setLeaderIdentifiers:(id)a3;
@end

@implementation DMFLeaveControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFLeaveControlGroupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFLeaveControlGroupRequest;
  v5 = [(CATTaskRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"leaderIdentifiers"];
    leaderIdentifiers = v5->_leaderIdentifiers;
    v5->_leaderIdentifiers = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFLeaveControlGroupRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFLeaveControlGroupRequest *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];

  v6 = [(DMFLeaveControlGroupRequest *)self leaderIdentifiers];
  [v4 encodeObject:v6 forKey:@"leaderIdentifiers"];
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSArray)leaderIdentifiers
{
  return self->_leaderIdentifiers;
}

- (void)setLeaderIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end