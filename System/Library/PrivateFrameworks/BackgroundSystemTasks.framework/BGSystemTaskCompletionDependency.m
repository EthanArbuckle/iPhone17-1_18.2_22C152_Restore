@interface BGSystemTaskCompletionDependency
- (BGSystemTaskCompletionDependency)initWithIdentifier:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (id)asDictionary;
@end

@implementation BGSystemTaskCompletionDependency

- (BGSystemTaskCompletionDependency)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGSystemTaskCompletionDependency;
  v6 = [(BGSystemTaskCompletionDependency *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)asDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"DependencyTypeCompletion" forKeyedSubscript:@"DependencyType"];
  [v3 setObject:self->_identifier forKeyedSubscript:@"DependencyIdentifier"];
  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %@>", objc_opt_class(), self->_identifier];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end