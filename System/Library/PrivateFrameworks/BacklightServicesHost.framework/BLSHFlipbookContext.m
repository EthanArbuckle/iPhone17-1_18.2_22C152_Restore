@interface BLSHFlipbookContext
- (BLSHFlipbookContext)initWithCAContext:(id)a3 wantsTransform:(BOOL)a4 inverted:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInverted;
- (BOOL)wantsTransform;
- (CAContext)caContext;
- (id)description;
- (unint64_t)hash;
@end

@implementation BLSHFlipbookContext

- (BLSHFlipbookContext)initWithCAContext:(id)a3 wantsTransform:(BOOL)a4 inverted:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHFlipbookContext;
  v10 = [(BLSHFlipbookContext *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_caContext, a3);
    v11->_wantsTransform = a4;
    v11->_inverted = a5;
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_caContext withName:@"context"];
  id v5 = (id)[v3 appendBool:self->_wantsTransform withName:@"wantsTransform" ifEqualTo:1];
  id v6 = (id)[v3 appendBool:self->_inverted withName:@"inverted" ifEqualTo:1];
  v7 = [v3 build];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendPointer:self->_caContext];
  id v5 = (id)[v3 appendBool:self->_wantsTransform];
  id v6 = (id)[v3 appendBool:self->_inverted];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  caContext = self->_caContext;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __31__BLSHFlipbookContext_isEqual___block_invoke;
  v20[3] = &unk_264532560;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendPointer:caContext counterpart:v20];
  BOOL wantsTransform = self->_wantsTransform;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __31__BLSHFlipbookContext_isEqual___block_invoke_2;
  v18[3] = &unk_264533BC0;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendBool:wantsTransform counterpart:v18];
  uint64_t inverted = self->_inverted;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __31__BLSHFlipbookContext_isEqual___block_invoke_3;
  v16[3] = &unk_264533BC0;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:inverted counterpart:v16];
  LOBYTE(inverted) = [v5 isEqual];

  return inverted;
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) caContext];
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) wantsTransform];
}

uint64_t __31__BLSHFlipbookContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInverted];
}

- (CAContext)caContext
{
  return self->_caContext;
}

- (BOOL)wantsTransform
{
  return self->_wantsTransform;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (void).cxx_destruct
{
}

@end