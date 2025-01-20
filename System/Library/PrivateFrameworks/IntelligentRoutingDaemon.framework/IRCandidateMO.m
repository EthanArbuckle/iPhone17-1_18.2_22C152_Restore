@interface IRCandidateMO
+ (id)MOCandidate:(id)a3 candidatesContainerMO:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (void)setPropertiesOfCandidateMO:(id)a3 withCandidate:(id)a4 managedObjectContext:(id)a5;
- (id)convert;
@end

@implementation IRCandidateMO

+ (id)MOCandidate:(id)a3 candidatesContainerMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRCandidateMO alloc] initWithContext:v7];
  [(IRCandidateMO *)v10 setCandidatesContainer:v8];

  +[IRCandidateMO setPropertiesOfCandidateMO:v10 withCandidate:v9 managedObjectContext:v7];

  return v10;
}

+ (void)setPropertiesOfCandidateMO:(id)a3 withCandidate:(id)a4 managedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 lastSeenDate];
  [v7 setLastSeenDate:v10];

  v11 = [v9 lastUsedDate];
  [v7 setLastUsedDate:v11];

  v12 = [v9 firstSeenDate];
  [v7 setFirstSeenDate:v12];

  v13 = [v9 candidateIdentifier];
  [v7 setCandidateIdentifier:v13];

  v14 = [v7 nodes];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke;
  v23[3] = &unk_2653A0108;
  id v15 = v8;
  id v24 = v15;
  [v14 enumerateObjectsUsingBlock:v23];

  v16 = [v7 nodes];
  [v7 removeNodes:v16];

  v17 = [v9 nodes];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke_2;
  v20[3] = &unk_26539FED8;
  id v21 = v7;
  id v22 = v15;
  id v18 = v15;
  id v19 = v7;
  [v17 enumerateObjectsUsingBlock:v20];
}

uint64_t __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

void __79__IRCandidateMO_setPropertiesOfCandidateMO_withCandidate_managedObjectContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRNodeMO nodeMOFromNodeDO:a2 forCandidate:v2 inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 addNodesObject:v3];
}

- (id)convert
{
  id v3 = objc_opt_new();
  v4 = [(IRCandidateMO *)self nodes];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __24__IRCandidateMO_convert__block_invoke;
  v12[3] = &unk_2653A0108;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v12];

  v6 = [(IRCandidateMO *)self lastSeenDate];
  id v7 = [(IRCandidateMO *)self lastUsedDate];
  id v8 = [(IRCandidateMO *)self firstSeenDate];
  id v9 = [(IRCandidateMO *)self candidateIdentifier];
  v10 = +[IRCandidateDO candidateDOWithLastSeenDate:v6 lastUsedDate:v7 firstSeenDate:v8 candidateIdentifier:v9 nodes:v5];

  return v10;
}

void __24__IRCandidateMO_convert__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 convert];
  [v2 addObject:v3];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRCandidateMO"];
}

@end