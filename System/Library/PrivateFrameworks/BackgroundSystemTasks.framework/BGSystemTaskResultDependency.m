@interface BGSystemTaskResultDependency
- (BGSystemTaskResultDependency)initWithIdentifier:(id)a3 batchSize:(unint64_t)a4;
- (NSString)description;
- (NSString)identifier;
- (id)asDictionary;
- (unint64_t)batchSize;
@end

@implementation BGSystemTaskResultDependency

- (BGSystemTaskResultDependency)initWithIdentifier:(id)a3 batchSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResultDependency;
  v8 = [(BGSystemTaskResultDependency *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (id)asDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"DependencyTypeResult" forKeyedSubscript:@"DependencyType"];
  [v3 setObject:self->_identifier forKeyedSubscript:@"DependencyIdentifier"];
  v4 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  [v3 setObject:v4 forKeyedSubscript:@"ResultDependencyBatchSize"];

  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %@: count: %ld>", objc_opt_class(), self->_identifier, self->_batchSize];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void).cxx_destruct
{
}

@end