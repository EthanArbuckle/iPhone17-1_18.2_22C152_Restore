@interface FBSSceneDefinition
+ (id)definition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (FBSSceneClientIdentity)clientIdentity;
- (FBSSceneIdentity)identity;
- (FBSSceneSpecification)specification;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setClientIdentity:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setSpecification:(id)a3;
@end

@implementation FBSSceneDefinition

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (FBSSceneClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[FBSMutableSceneDefinition allocWithZone:a3] init];
  [(FBSSceneDefinition *)v4 setIdentity:self->_identity];
  [(FBSSceneDefinition *)v4 setClientIdentity:self->_clientIdentity];
  [(FBSSceneDefinition *)v4 setSpecification:self->_specification];
  return v4;
}

+ (id)definition
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)setIdentity:(id)a3
{
}

- (void)setSpecification:(id)a3
{
}

- (void)setClientIdentity:(id)a3
{
}

- (BOOL)isValid
{
  if (![(FBSSceneIdentity *)self->_identity isValid]
    || ![(FBSSceneClientIdentity *)self->_clientIdentity isValid])
  {
    return 0;
  }
  specification = self->_specification;

  return [(FBSSceneSpecification *)specification isValid];
}

- (NSString)description
{
  return (NSString *)[(FBSSceneDefinition *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBSSceneDefinition *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = [(FBSSceneDefinition *)self identity];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __30__FBSSceneDefinition_isEqual___block_invoke;
    v20[3] = &unk_1E58F5760;
    v7 = v4;
    v21 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v20];

    v9 = [(FBSSceneDefinition *)self clientIdentity];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__FBSSceneDefinition_isEqual___block_invoke_2;
    v18[3] = &unk_1E58F5760;
    v10 = v7;
    v19 = v10;
    id v11 = (id)[v5 appendObject:v9 counterpart:v18];

    v12 = [(FBSSceneDefinition *)self specification];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__FBSSceneDefinition_isEqual___block_invoke_3;
    v16[3] = &unk_1E58F5760;
    v17 = v10;
    id v13 = (id)[v5 appendObject:v12 counterpart:v16];

    char v14 = [v5 isEqual];
  }

  return v14;
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identity];
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientIdentity];
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) specification];
}

- (unint64_t)hash
{
  v3 = [off_1E58F4508 builder];
  v4 = [(FBSSceneDefinition *)self identity];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (id)succinctDescription
{
  id v2 = [(FBSSceneDefinition *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  v4 = [(FBSSceneIdentity *)self->_identity identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSSceneDefinition *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneDefinition *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FBSSceneDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __60__FBSSceneDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identity];
  id v4 = (id)[v2 appendObject:v3 withName:@"identity"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) clientIdentity];
  id v7 = (id)[v5 appendObject:v6 withName:@"clientIdentity"];

  id v8 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) specification];
  id v9 = (id)[v8 appendObject:v10 withName:@"specification"];
}

@end