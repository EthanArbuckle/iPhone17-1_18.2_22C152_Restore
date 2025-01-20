@interface HDDiscardWorkoutOperation
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDDiscardWorkoutOperation)initWithBuilderIdentifier:(id)a3;
- (NSUUID)builderIdentifier;
@end

@implementation HDDiscardWorkoutOperation

- (HDDiscardWorkoutOperation)initWithBuilderIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDiscardWorkoutOperation;
  v5 = [(HDDiscardWorkoutOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    builderIdentifier = v5->_builderIdentifier;
    v5->_builderIdentifier = (NSUUID *)v6;
  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  builderIdentifier = self->_builderIdentifier;
  id v7 = a3;
  v8 = HDPredicateForWorkoutBuilderWithIdentifier((uint64_t)builderIdentifier);
  objc_super v9 = objc_opt_class();
  v10 = [v7 database];

  LOBYTE(a5) = [v9 deleteEntitiesWithPredicate:v8 healthDatabase:v10 error:a5];
  return (char)a5;
}

- (NSUUID)builderIdentifier
{
  return self->_builderIdentifier;
}

- (void).cxx_destruct
{
}

@end