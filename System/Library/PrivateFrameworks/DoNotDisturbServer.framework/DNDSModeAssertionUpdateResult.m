@interface DNDSModeAssertionUpdateResult
+ (id)emptyResult;
- (DNDSModeAssertionUpdateResult)initWithAssertions:(id)a3 invalidations:(id)a4;
- (NSArray)assertions;
- (NSArray)invalidations;
- (id)description;
- (id)resultCombiningWithResult:(id)a3;
@end

@implementation DNDSModeAssertionUpdateResult

+ (id)emptyResult
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithAssertions:MEMORY[0x1E4F1CBF0] invalidations:MEMORY[0x1E4F1CBF0]];
  return v3;
}

- (DNDSModeAssertionUpdateResult)initWithAssertions:(id)a3 invalidations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSModeAssertionUpdateResult;
  v8 = [(DNDSModeAssertionUpdateResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    assertions = v8->_assertions;
    v8->_assertions = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    invalidations = v8->_invalidations;
    v8->_invalidations = (NSArray *)v11;
  }
  return v8;
}

- (id)resultCombiningWithResult:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSModeAssertionUpdateResult *)self assertions];
  id v6 = [v4 assertions];
  id v7 = [v5 arrayByAddingObjectsFromArray:v6];

  v8 = [(DNDSModeAssertionUpdateResult *)self invalidations];
  uint64_t v9 = [v4 invalidations];

  v10 = [v8 arrayByAddingObjectsFromArray:v9];

  uint64_t v11 = [[DNDSModeAssertionUpdateResult alloc] initWithAssertions:v7 invalidations:v10];
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSModeAssertionUpdateResult *)self assertions];
  id v6 = [(DNDSModeAssertionUpdateResult *)self invalidations];
  id v7 = [v3 stringWithFormat:@"<%@: %p; assertions: %@; invalidations: %@>", v4, self, v5, v6];

  return v7;
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end