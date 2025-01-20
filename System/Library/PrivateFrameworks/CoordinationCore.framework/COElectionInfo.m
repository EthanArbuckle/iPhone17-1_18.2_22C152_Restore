@interface COElectionInfo
- (BOOL)hasGreaterGenerationThan:(id)a3;
- (BOOL)hasSameGenerationAndLeader:(id)a3;
- (BOOL)isEqual:(id)a3;
- (COBallot)ballot;
- (COElectionInfo)initWithCommand:(id)a3;
- (COElectionInfo)initWithGeneration:(unint64_t)a3 ballot:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)leader;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)setBallot:(id)a3;
- (void)setGeneration:(unint64_t)a3;
@end

@implementation COElectionInfo

- (COElectionInfo)initWithGeneration:(unint64_t)a3 ballot:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COElectionInfo;
  v7 = [(COElectionInfo *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_generation = a3;
    uint64_t v9 = [v6 copy];
    ballot = v8->_ballot;
    v8->_ballot = (COBallot *)v9;
  }
  return v8;
}

- (COElectionInfo)initWithCommand:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COElectionInfo;
  v5 = [(COElectionInfo *)&v9 init];
  if (v5)
  {
    v5->_generation = [v4 generation];
    uint64_t v6 = [v4 ballot];
    ballot = v5->_ballot;
    v5->_ballot = (COBallot *)v6;
  }
  return v5;
}

- (void)setBallot:(id)a3
{
  id v7 = a3;
  if ([MEMORY[0x263F33F80] isSlimBallotsEnabled])
  {
    id v4 = (COBallot *)[v7 mutableCopy];
    [(COBallot *)v4 clearInsignificantCandidates];
    ballot = self->_ballot;
    self->_ballot = v4;
  }
  else
  {
    uint64_t v6 = (COBallot *)v7;
    ballot = self->_ballot;
    self->_ballot = v6;
  }
}

- (id)leader
{
  v2 = [(COElectionInfo *)self ballot];
  v3 = [v2 candidates];
  id v4 = [v3 firstObject];

  return v4;
}

- (BOOL)hasGreaterGenerationThan:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COElectionInfo *)self generation];
  unint64_t v6 = [v4 generation];

  return v5 > v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [COElectionInfo alloc];
  unint64_t v5 = [(COElectionInfo *)self generation];
  unint64_t v6 = [(COElectionInfo *)self ballot];
  id v7 = [(COElectionInfo *)v4 initWithGeneration:v5 ballot:v6];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(COElectionInfo *)self generation];
  id v4 = [(COElectionInfo *)self ballot];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COElectionInfo *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v5 = [(COElectionInfo *)self generation], v5 == [(COElectionInfo *)v4 generation]))
    {
      unint64_t v6 = [(COElectionInfo *)self ballot];
      id v7 = [(COElectionInfo *)v4 ballot];
      char v8 = [v6 isEqualToBallot:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasSameGenerationAndLeader:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(COElectionInfo *)self generation];
  if (v5 == [v4 generation])
  {
    unint64_t v6 = [(COElectionInfo *)self leader];
    id v7 = [v4 leader];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (COBallot)ballot
{
  return self->_ballot;
}

- (void).cxx_destruct
{
}

@end