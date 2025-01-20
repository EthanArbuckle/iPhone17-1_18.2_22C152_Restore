@interface BMStreamBuiltinPruningTrigger
- (BMStreamBuiltinPruningTrigger)initWithIdentifier:(id)a3 platforms:(unint64_t)a4 triggerCondition:(id)a5 pruningPredicate:(id)a6;
- (BMStreamBuiltinPruningTrigger)initWithIdentifier:(id)a3 predicate:(id)a4;
- (NSPredicate)pruningPredicate;
- (NSPredicate)triggerCondition;
- (NSString)identifier;
- (id)description;
- (unint64_t)platforms;
@end

@implementation BMStreamBuiltinPruningTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruningPredicate, 0);
  objc_storeStrong((id *)&self->_triggerCondition, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BMStreamBuiltinPruningTrigger)initWithIdentifier:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMStreamBuiltinPruningTrigger;
  v9 = [(BMStreamBuiltinPruningTrigger *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_pruningPredicate, a4);
    v10->_platforms = 510;
  }

  return v10;
}

- (BMStreamBuiltinPruningTrigger)initWithIdentifier:(id)a3 platforms:(unint64_t)a4 triggerCondition:(id)a5 pruningPredicate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMStreamBuiltinPruningTrigger;
  v14 = [(BMStreamBuiltinPruningTrigger *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_platforms = a4;
    objc_storeStrong((id *)&v15->_triggerCondition, a5);
    objc_storeStrong((id *)&v15->_pruningPredicate, a6);
  }

  return v15;
}

- (id)description
{
  v3 = BMDevicePlatformOptionsToString();
  v4 = (void *)[[NSString alloc] initWithFormat:@"BMStreamBuiltinPruningTrigger { id: %@, platforms: {%@}, trigger: %@, predicate: %@ }", self->_identifier, v3, self->_triggerCondition, self->_pruningPredicate];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)platforms
{
  return self->_platforms;
}

- (NSPredicate)triggerCondition
{
  return self->_triggerCondition;
}

- (NSPredicate)pruningPredicate
{
  return self->_pruningPredicate;
}

@end