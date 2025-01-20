@interface ECFlagChangeMessageActionResults
- (ECFlagChangeMessageActionResults)initWithBuilder:(id)a3;
- (NSIndexSet)completedUIDs;
@end

@implementation ECFlagChangeMessageActionResults

- (ECFlagChangeMessageActionResults)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECFlagChangeMessageActionResultsBuilder *))a3;
  v11.receiver = self;
  v11.super_class = (Class)ECFlagChangeMessageActionResults;
  v5 = [(ECFlagChangeMessageActionResults *)&v11 init];
  if (v5)
  {
    v6 = objc_alloc_init(ECFlagChangeMessageActionResultsBuilder);
    v4[2](v4, v6);
    v7 = [(ECFlagChangeMessageActionResultsBuilder *)v6 completedUIDs];
    v8 = (void *)[v7 copy];
    v9 = v8;
    if (!v8)
    {
      v9 = [MEMORY[0x1E4F28D60] indexSet];
    }
    objc_storeStrong((id *)&v5->_completedUIDs, v9);
    if (!v8) {
  }
    }
  return v5;
}

- (NSIndexSet)completedUIDs
{
  return self->_completedUIDs;
}

- (void).cxx_destruct
{
}

@end