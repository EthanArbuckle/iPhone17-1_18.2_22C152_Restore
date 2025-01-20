@interface CUIKEditingContextGroup
- (BOOL)earlyCommitDecisionForGroupIsSet;
- (BOOL)isTestObserver;
- (BOOL)spanDecisionForGroupIsSet;
- (CUIKEditingContextGroup)initWithObjectGroup:(id)a3;
- (CUIKObjectGroup)objectGroup;
- (EKEventStore)eventStore;
- (NSMutableArray)additionalObjectGroups;
- (NSNumber)earlyCommitDecisionAsNumber;
- (NSNumber)spanDecisionAsNumber;
- (NSSet)openContexts;
- (id)activeEditingContexts;
- (id)activeEditingContextsExcludingContext:(id)a3;
- (id)newIdentifierForIdentifier:(id)a3;
- (id)objectsToCommit;
- (id)oldObject:(id)a3 didUpdateTo:(id)a4;
- (id)originalObjects;
- (id)trackedObjects;
- (unint64_t)earlyCommitDecisionForGroup;
- (unint64_t)spanDecisionForGroup;
- (void)addAdditionalObjects:(id)a3;
- (void)addContext:(id)a3;
- (void)removeContext:(id)a3;
- (void)setAdditionalObjectGroups:(id)a3;
- (void)setEarlyCommitDecisionAsNumber:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setObjectGroup:(id)a3;
- (void)setOpenContexts:(id)a3;
- (void)setSpanDecisionAsNumber:(id)a3;
- (void)specifyEarlyCommitDecisionForGroup:(unint64_t)a3;
- (void)specifySpanDecisionForGroup:(unint64_t)a3;
- (void)unspecifyEarlyCommitDecisionForGroup;
- (void)unspecifySpanDecisionForGroup;
@end

@implementation CUIKEditingContextGroup

- (CUIKEditingContextGroup)initWithObjectGroup:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKEditingContextGroup;
  v5 = [(CUIKEditingContextGroup *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(CUIKEditingContextGroup *)v5 setObjectGroup:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(CUIKEditingContextGroup *)v6 setAdditionalObjectGroups:v7];
  }
  return v6;
}

- (void)addContext:(id)a3
{
  id v4 = a3;
  v5 = [(CUIKEditingContextGroup *)self openContexts];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    [(CUIKEditingContextGroup *)self setOpenContexts:v6];
  }
  [v4 setGroup:self];
  [v4 _markAsOpen];
  v7 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContextGroup addContext:]();
  }

  v8 = [(CUIKEditingContextGroup *)self openContexts];
  [v8 addObject:v4];
}

- (void)removeContext:(id)a3
{
  id v4 = a3;
  [v4 _markAsClosed];
  v5 = +[CUIKLogSubsystem editingContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKEditingContextGroup removeContext:]();
  }

  v6 = [(CUIKEditingContextGroup *)self openContexts];
  [v6 removeObject:v4];
}

- (id)activeEditingContexts
{
  v2 = [(CUIKEditingContextGroup *)self openContexts];
  v3 = [v2 objectsPassingTest:&__block_literal_global_12];

  return v3;
}

uint64_t __48__CUIKEditingContextGroup_activeEditingContexts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (id)activeEditingContextsExcludingContext:(id)a3
{
  id v4 = a3;
  v5 = [(CUIKEditingContextGroup *)self openContexts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__CUIKEditingContextGroup_activeEditingContextsExcludingContext___block_invoke;
  v9[3] = &unk_1E636A878;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 objectsPassingTest:v9];

  return v7;
}

uint64_t __65__CUIKEditingContextGroup_activeEditingContextsExcludingContext___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return [a2 isActive];
  }
}

- (void)specifySpanDecisionForGroup:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(CUIKEditingContextGroup *)self setSpanDecisionAsNumber:v4];
}

- (void)unspecifySpanDecisionForGroup
{
}

- (BOOL)spanDecisionForGroupIsSet
{
  v2 = [(CUIKEditingContextGroup *)self spanDecisionAsNumber];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)spanDecisionForGroup
{
  v2 = [(CUIKEditingContextGroup *)self spanDecisionAsNumber];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)specifyEarlyCommitDecisionForGroup:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(CUIKEditingContextGroup *)self setEarlyCommitDecisionAsNumber:v4];
}

- (void)unspecifyEarlyCommitDecisionForGroup
{
}

- (BOOL)earlyCommitDecisionForGroupIsSet
{
  v2 = [(CUIKEditingContextGroup *)self earlyCommitDecisionAsNumber];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)earlyCommitDecisionForGroup
{
  v2 = [(CUIKEditingContextGroup *)self earlyCommitDecisionAsNumber];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (id)objectsToCommit
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(CUIKEditingContextGroup *)self objectGroup];
  v5 = [v4 objects];
  id v6 = [v3 setWithArray:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(CUIKEditingContextGroup *)self additionalObjectGroups];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)MEMORY[0x1E4F1CAD0];
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objects];
        v14 = [v12 setWithArray:v13];
        [v6 unionSet:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)trackedObjects
{
  v2 = [(CUIKEditingContextGroup *)self objectGroup];
  unint64_t v3 = [v2 objects];

  return v3;
}

- (id)originalObjects
{
  v2 = [(CUIKEditingContextGroup *)self objectGroup];
  unint64_t v3 = [v2 originalObjects];

  return v3;
}

- (void)addAdditionalObjects:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [[CUIKObjectGroup alloc] initWithObjects:v6];
    v5 = [(CUIKEditingContextGroup *)self additionalObjectGroups];
    [v5 addObject:v4];
  }
}

- (id)newIdentifierForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CUIKEditingContextGroup *)self objectGroup];
  id v6 = [v5 shiftedOccurrencePreviouslySpawnedByIdentifier:v4];

  return v6;
}

- (id)oldObject:(id)a3 didUpdateTo:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(CUIKEditingContextGroup *)self objectGroup];
    [v8 newObject:v6 spawnedFromObject:v7];
  }
  return 0;
}

- (BOOL)isTestObserver
{
  return 0;
}

- (CUIKObjectGroup)objectGroup
{
  return (CUIKObjectGroup *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectGroup:(id)a3
{
}

- (NSSet)openContexts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOpenContexts:(id)a3
{
}

- (EKEventStore)eventStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  return (EKEventStore *)WeakRetained;
}

- (void)setEventStore:(id)a3
{
}

- (NSMutableArray)additionalObjectGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalObjectGroups:(id)a3
{
}

- (NSNumber)spanDecisionAsNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSpanDecisionAsNumber:(id)a3
{
}

- (NSNumber)earlyCommitDecisionAsNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEarlyCommitDecisionAsNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earlyCommitDecisionAsNumber, 0);
  objc_storeStrong((id *)&self->_spanDecisionAsNumber, 0);
  objc_storeStrong((id *)&self->_additionalObjectGroups, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_openContexts, 0);

  objc_storeStrong((id *)&self->_objectGroup, 0);
}

- (void)addContext:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Adding context %@ to group %@");
}

- (void)removeContext:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4(&dword_1BDF08000, v0, v1, "Removing context %@ from group %@");
}

@end