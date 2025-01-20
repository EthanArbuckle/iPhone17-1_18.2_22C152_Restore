@interface ECFlagChangeMessageActionResultsBuilder
- (ECFlagChangeMessageActionResultsBuilder)init;
- (NSError)error;
- (NSMutableIndexSet)completedUIDs;
- (void)setError:(id)a3;
@end

@implementation ECFlagChangeMessageActionResultsBuilder

- (ECFlagChangeMessageActionResultsBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)ECFlagChangeMessageActionResultsBuilder;
  v2 = [(ECFlagChangeMessageActionResultsBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
    completedUIDs = v2->_completedUIDs;
    v2->_completedUIDs = (NSMutableIndexSet *)v3;
  }
  return v2;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableIndexSet)completedUIDs
{
  return self->_completedUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedUIDs, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end