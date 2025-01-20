@interface IRCandidatesContainerDO
+ (BOOL)supportsSecureCoding;
+ (IRCandidatesContainerDO)candidatesContainerDOWithCandidates:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCandidatesContainerDO:(id)a3;
- (IRCandidatesContainerDO)initWithCandidates:(id)a3;
- (IRCandidatesContainerDO)initWithCoder:(id)a3;
- (NSSet)candidates;
- (id)airplayOrUnknownCandidates;
- (id)candidateForCandidateIdentifier:(id)a3;
- (id)candidateNameForCandidateIdentifier:(id)a3;
- (id)copyWithReplacementCandidates:(id)a3;
- (id)description;
- (id)exportAsDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRCandidatesContainerDO

- (id)airplayOrUnknownCandidates
{
  v2 = [(IRCandidatesContainerDO *)self candidates];
  v3 = [v2 allWhere:&__block_literal_global_23];

  return v3;
}

- (NSSet)candidates
{
  return self->_candidates;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_candidates hash];
}

- (id)exportAsDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(IRCandidatesContainerDO *)self candidates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 exportAsDictionary];
        v11 = [v9 candidateIdentifier];
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)candidateNameForCandidateIdentifier:(id)a3
{
  id v3 = [(IRCandidatesContainerDO *)self candidateForCandidateIdentifier:a3];
  v4 = [v3 name];

  return v4;
}

- (id)candidateForCandidateIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IRCandidatesContainerDO *)self candidates];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__IRCandidatesContainerDO_Extension__candidateForCandidateIdentifier___block_invoke;
  v9[3] = &unk_26539F7C8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 firstWhere:v9];

  return v7;
}

uint64_t __70__IRCandidatesContainerDO_Extension__candidateForCandidateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 candidateIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __64__IRCandidatesContainerDO_Extension__airplayOrUnknownCandidates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAirPlayOrUnknownAVODTarget];
}

- (IRCandidatesContainerDO)initWithCandidates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidatesContainerDO;
  id v6 = [(IRCandidatesContainerDO *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_candidates, a3);
  }

  return v7;
}

+ (IRCandidatesContainerDO)candidatesContainerDOWithCandidates:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCandidates:v4];

  return (IRCandidatesContainerDO *)v5;
}

- (id)copyWithReplacementCandidates:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCandidates:v3];

  return v4;
}

- (BOOL)isEqualToCandidatesContainerDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (int v6 = self->_candidates != 0,
        [v4 candidates],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    char v11 = 0;
  }
  else
  {
    candidates = self->_candidates;
    if (candidates)
    {
      id v10 = [v5 candidates];
      char v11 = [(NSSet *)candidates isEqual:v10];
    }
    else
    {
      char v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRCandidatesContainerDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRCandidatesContainerDO *)self isEqualToCandidatesContainerDO:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRCandidatesContainerDO)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  int v8 = [v4 decodeObjectOfClasses:v7 forKey:@"candidates"];

  if (v8 || ([v4 error], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    self = [(IRCandidatesContainerDO *)self initWithCandidates:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  candidates = self->_candidates;
  if (candidates) {
    [a3 encodeObject:candidates forKey:@"candidates"];
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRCandidatesContainerDO | candidates:%@>", self->_candidates];

  return v2;
}

- (void).cxx_destruct
{
}

@end