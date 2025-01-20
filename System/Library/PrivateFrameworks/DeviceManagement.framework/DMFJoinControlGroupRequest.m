@interface DMFJoinControlGroupRequest
+ (BOOL)supportsSecureCoding;
- (DMFControlGroupIdentifier)groupIdentifier;
- (DMFJoinControlGroupRequest)initWithCoder:(id)a3;
- (NSArray)leaderIdentifiers;
- (NSDate)expirationDate;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setLeaderIdentifiers:(id)a3;
@end

@implementation DMFJoinControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFJoinControlGroupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFJoinControlGroupRequest;
  v5 = [(CATTaskRequest *)&v18 initWithCoder:v4];
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

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFJoinControlGroupRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFJoinControlGroupRequest *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];

  v6 = [(DMFJoinControlGroupRequest *)self leaderIdentifiers];
  [v4 encodeObject:v6 forKey:@"leaderIdentifiers"];

  uint64_t v7 = [(DMFJoinControlGroupRequest *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"expirationDate"];
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

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_leaderIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end