@interface LNMutualExclusionGroupRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNMutualExclusionGroupRelevantContext)initWithCoder:(id)a3;
- (LNMutualExclusionGroupRelevantContext)initWithGroupIdentifier:(id)a3;
- (NSString)groupIdentifier;
- (id)analyticsDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNMutualExclusionGroupRelevantContext

- (void).cxx_destruct
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (id)analyticsDescription
{
  return @".group()";
}

- (id)description
{
  v2 = NSString;
  v3 = [(LNMutualExclusionGroupRelevantContext *)self groupIdentifier];
  v4 = [v2 stringWithFormat:@"<mutual exclusion group: %@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNMutualExclusionGroupRelevantContext *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(LNMutualExclusionGroupRelevantContext *)v4 groupIdentifier];
      v6 = [(LNMutualExclusionGroupRelevantContext *)self groupIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(LNMutualExclusionGroupRelevantContext *)self groupIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNMutualExclusionGroupRelevantContext *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];
}

- (LNMutualExclusionGroupRelevantContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];

  v6 = [(LNMutualExclusionGroupRelevantContext *)self initWithGroupIdentifier:v5];
  return v6;
}

- (LNMutualExclusionGroupRelevantContext)initWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNMutualExclusionGroupRelevantContext;
  id v5 = [(LNRelevantContext *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end