@interface BGSystemTaskResult
- (BGSystemTaskResult)initWithIdentifier:(id)a3 consumptionCount:(unint64_t)a4;
- (BGSystemTaskResult)initWithIdentifier:(id)a3 cumulativeProductionCount:(unint64_t)a4;
- (NSString)identifier;
- (id)asDASActivityResult;
- (id)description;
- (unint64_t)count;
@end

@implementation BGSystemTaskResult

- (BGSystemTaskResult)initWithIdentifier:(id)a3 cumulativeProductionCount:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResult;
  v8 = [(BGSystemTaskResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BGSystemTaskResult)initWithIdentifier:(id)a3 consumptionCount:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResult;
  v8 = [(BGSystemTaskResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (id)asDASActivityResult
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F5FA40]) initWithIdentifier:self->_identifier count:self->_count];
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<BGSystemTaskResult: %@: count: %ld>", self->_identifier, self->_count];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end