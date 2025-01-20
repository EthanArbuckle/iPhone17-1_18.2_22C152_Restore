@interface FBSProcessWatchdogPolicy
+ (FBSProcessWatchdogPolicy)policyWithName:(id)a3 forProvisions:(id)a4;
+ (FBSProcessWatchdogPolicy)policyWithProvisions:(id)a3;
- (NSArray)provisions;
- (NSString)description;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setName:(id)a3;
- (void)setProvisions:(id)a3;
@end

@implementation FBSProcessWatchdogPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisions, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSProcessWatchdogPolicy *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(FBSProcessWatchdogPolicy *)self succinctDescriptionBuilder];
  v6 = self;
  objc_sync_enter(v6);
  if ([(NSArray *)v6->_provisions count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__FBSProcessWatchdogPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E58F4AB0;
    id v9 = v5;
    v10 = v6;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }
  objc_sync_exit(v6);

  return v5;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  [v3 appendString:self->_name withName:@"name" skipIfEmpty:1];

  return v3;
}

- (NSArray)provisions
{
  return self->_provisions;
}

- (NSString)description
{
  return (NSString *)[(FBSProcessWatchdogPolicy *)self descriptionWithMultilinePrefix:0];
}

+ (FBSProcessWatchdogPolicy)policyWithProvisions:(id)a3
{
  return (FBSProcessWatchdogPolicy *)[a1 policyWithName:0 forProvisions:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setProvisions:self->_provisions];
  return v4;
}

+ (FBSProcessWatchdogPolicy)policyWithName:(id)a3 forProvisions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setName:v7];

  [v8 setProvisions:v6];

  return (FBSProcessWatchdogPolicy *)v8;
}

- (void)setProvisions:(id)a3
{
  if (self->_provisions != a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = (NSArray *)[[v4 alloc] initWithArray:v5 copyItems:1];

    provisions = self->_provisions;
    self->_provisions = v6;
  }
}

- (void)setName:(id)a3
{
}

uint64_t __66__FBSProcessWatchdogPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"provisions" skipIfEmpty:1];
}

- (id)succinctDescription
{
  v2 = [(FBSProcessWatchdogPolicy *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

@end