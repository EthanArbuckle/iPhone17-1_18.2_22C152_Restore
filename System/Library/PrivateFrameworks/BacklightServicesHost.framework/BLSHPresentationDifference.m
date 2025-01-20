@interface BLSHPresentationDifference
- (BLSHPresentationDifference)initWithHasChanges:(BOOL)a3 insertedEnvironments:(id)a4 removedEnvironments:(id)a5;
- (BOOL)hasChanges;
- (NSArray)insertions;
- (NSArray)removals;
- (id)description;
@end

@implementation BLSHPresentationDifference

- (BLSHPresentationDifference)initWithHasChanges:(BOOL)a3 insertedEnvironments:(id)a4 removedEnvironments:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHPresentationDifference;
  v11 = [(BLSHPresentationDifference *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_hasChanges = a3;
    objc_storeStrong((id *)&v11->_insertions, a4);
    objc_storeStrong((id *)&v12->_removals, a5);
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_hasChanges withName:@"hasChanges"];
  v5 = [(NSArray *)self->_insertions bs_map:&__block_literal_global_149];
  [v3 appendArraySection:v5 withName:@"adds" skipIfEmpty:1];

  v6 = [(NSArray *)self->_removals bs_map:&__block_literal_global_154];
  [v3 appendArraySection:v6 withName:@"removes" skipIfEmpty:1];

  v7 = [v3 build];

  return v7;
}

id __41__BLSHPresentationDifference_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  v5 = [v2 stringWithFormat:@"<%p:%@>", v3, v4];

  return v5;
}

id __41__BLSHPresentationDifference_description__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  v5 = [v2 stringWithFormat:@"<%p:%@>", v3, v4];

  return v5;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (NSArray)insertions
{
  return self->_insertions;
}

- (NSArray)removals
{
  return self->_removals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);

  objc_storeStrong((id *)&self->_insertions, 0);
}

@end