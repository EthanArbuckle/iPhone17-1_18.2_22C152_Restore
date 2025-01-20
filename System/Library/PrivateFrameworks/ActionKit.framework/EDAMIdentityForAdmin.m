@interface EDAMIdentityForAdmin
+ (id)structFields;
+ (id)structName;
- (EDAMIdentity)identity;
- (NSNumber)state;
- (NSNumber)stateChanged;
- (void)setIdentity:(id)a3;
- (void)setState:(id)a3;
- (void)setStateChanged:(id)a3;
@end

@implementation EDAMIdentityForAdmin

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1245;
  if (!structFields_structFields_1245)
  {
    v3 = +[FATField fieldWithIndex:1 type:12 optional:1 name:@"identity" structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"state", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"stateChanged"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1245;
    structFields_structFields_1245 = v6;

    v2 = (void *)structFields_structFields_1245;
  }
  return v2;
}

+ (id)structName
{
  return @"IdentityForAdmin";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChanged, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)setStateChanged:(id)a3
{
}

- (NSNumber)stateChanged
{
  return self->_stateChanged;
}

- (void)setState:(id)a3
{
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setIdentity:(id)a3
{
}

- (EDAMIdentity)identity
{
  return self->_identity;
}

@end