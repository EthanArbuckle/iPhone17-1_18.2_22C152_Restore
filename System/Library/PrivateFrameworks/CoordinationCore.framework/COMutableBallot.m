@interface COMutableBallot
- (BOOL)addDiscoveryRecord:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addCandidate:(id)a3;
- (void)clearInsignificantCandidates;
- (void)mergeBallot:(id)a3;
- (void)removeCandidate:(id)a3;
@end

@implementation COMutableBallot

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [COBallot alloc];
  return [(COBallot *)v4 initWithBallot:self];
}

- (void)addCandidate:(id)a3
{
  id v4 = a3;
  v5 = [(COBallot *)self candidates];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObject:v4];
  [v6 sortUsingComparator:&__block_literal_global_12];
  [(COBallot *)self setCandidates:v6];
}

uint64_t __32__COMutableBallot_addCandidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeCandidate:(id)a3
{
  id v4 = a3;
  v5 = [(COBallot *)self candidates];
  id v8 = (id)[v5 mutableCopy];

  [v8 removeObject:v4];
  [(COBallot *)self setCandidates:v8];
  id v6 = [(COBallot *)self discovery];
  v7 = (void *)[v6 mutableCopy];

  [v7 removeObjectForKey:v4];
  [(COBallot *)self setDiscovery:v7];
}

- (void)mergeBallot:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(COBallot *)self candidates];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [v4 candidates];
  [v6 unionOrderedSet:v7];

  [v6 sortUsingComparator:&__block_literal_global_59];
  v21 = v6;
  [(COBallot *)self setCandidates:v6];
  v23 = self;
  id v8 = [(COBallot *)self discovery];
  v9 = (void *)[v8 mutableCopy];

  v22 = v4;
  v10 = [v4 discovery];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v16 = [v10 objectForKey:v15];
        v17 = [(COBallot *)v23 discovery];
        v18 = [v17 objectForKey:v15];

        if (v18)
        {
          v19 = (void *)[v18 mutableCopy];
          [v19 addDestinationsFromDiscoveryRecord:v16];
          v20 = [[CODiscoveryRecord alloc] initWithDiscoveryRecord:v19];
        }
        else
        {
          v20 = v16;
        }
        [v9 setObject:v20 forKey:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
  [(COBallot *)v23 setDiscovery:v9];
}

uint64_t __31__COMutableBallot_mergeBallot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)addDiscoveryRecord:(id)a3
{
  id v4 = (CODiscoveryRecord *)a3;
  v5 = [(CODiscoveryRecord *)v4 constituent];
  id v6 = [(COBallot *)self discovery];
  v7 = (void *)[v6 mutableCopy];

  id v8 = [v7 objectForKey:v5];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  if (([v8 isEqualToDiscoveryRecord:v4] & 1) == 0)
  {
    uint64_t v11 = (void *)[v9 mutableCopy];
    [v11 addDestinationsFromDiscoveryRecord:v4];
    uint64_t v12 = [[CODiscoveryRecord alloc] initWithDiscoveryRecord:v11];

    id v4 = v12;
LABEL_5:
    [v7 setObject:v4 forKey:v5];
    [(COBallot *)self setDiscovery:v7];
    BOOL v10 = 1;
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (void)clearInsignificantCandidates
{
  v3 = [(COBallot *)self candidates];
  id v6 = [v3 firstObject];

  id v4 = v6;
  if (v6)
  {
    v5 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v6];
    [(COBallot *)self setCandidates:v5];

    id v4 = v6;
  }
}

@end