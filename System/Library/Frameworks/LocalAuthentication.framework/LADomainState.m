@interface LADomainState
- (LADomainState)initWithResult:(id)a3;
- (LADomainStateBiometry)biometry;
- (LADomainStateCompanion)companion;
- (NSData)stateHash;
- (id)description;
- (void)_resolveCombinedStateHash;
@end

@implementation LADomainState

- (LADomainState)initWithResult:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LADomainState;
  v5 = [(LADomainState *)&v11 init];
  if (v5)
  {
    v6 = [[LADomainStateBiometry alloc] initWithResult:v4];
    biometry = v5->_biometry;
    v5->_biometry = v6;

    v8 = [[LADomainStateCompanion alloc] initWithResult:v4];
    companion = v5->_companion;
    v5->_companion = v8;

    [(LADomainState *)v5 _resolveCombinedStateHash];
  }

  return v5;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void)_resolveCombinedStateHash
{
  uint64_t v3 = [(LADomainStateCompanion *)self->_companion stateHash];
  if (!v3
    || (id v4 = (void *)v3,
        [(LADomainStateBiometry *)self->_biometry stateHash],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    objc_super v11 = [(LADomainStateBiometry *)self->_biometry stateHash];
    if (v11)
    {
      v10 = v11;
      stateHash = self->_stateHash;
      id v13 = v10;
LABEL_13:
      self->_stateHash = v10;
      goto LABEL_14;
    }
    id v13 = 0;
    v10 = [(LADomainStateCompanion *)self->_companion stateHash];
LABEL_12:
    stateHash = self->_stateHash;
    goto LABEL_13;
  }
  id v13 = (id)objc_opt_new();
  v6 = [(LADomainStateBiometry *)self->_biometry stateHash];

  if (v6)
  {
    v7 = [(LADomainStateBiometry *)self->_biometry stateHash];
    [v13 appendData:v7];
  }
  v8 = [(LADomainStateCompanion *)self->_companion stateHash];

  if (v8)
  {
    v9 = [(LADomainStateCompanion *)self->_companion stateHash];
    [v13 appendData:v9];
  }
  if ([v13 length])
  {
    v10 = [MEMORY[0x1E4F72F50] createHashForDomainState:v13];
    goto LABEL_12;
  }
  stateHash = self->_stateHash;
  self->_stateHash = 0;
LABEL_14:
}

- (id)description
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  v5 = [(LADomainState *)self biometry];
  v6 = [v4 stringWithFormat:@"biometry: %@", v5];
  v18[0] = v6;
  v7 = NSString;
  v8 = [(LADomainState *)self companion];
  v9 = [v7 stringWithFormat:@"companion: %@", v8];
  v18[1] = v9;
  v10 = NSString;
  objc_super v11 = [(LADomainState *)self stateHash];
  v12 = [v10 stringWithFormat:@"stateHash: %@", v11];
  v18[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v14 = [v13 componentsJoinedByString:@"; "];
  v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return v15;
}

- (LADomainStateBiometry)biometry
{
  return self->_biometry;
}

- (LADomainStateCompanion)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_biometry, 0);

  objc_storeStrong((id *)&self->_stateHash, 0);
}

@end