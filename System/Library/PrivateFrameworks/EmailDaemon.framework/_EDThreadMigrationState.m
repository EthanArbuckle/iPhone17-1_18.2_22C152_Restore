@interface _EDThreadMigrationState
- (BOOL)_verifyIsMigratingGeneration:(unint64_t)a3 stateVerifier:(id)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7;
- (BOOL)isEmpty;
- (BOOL)isFullyMigrated;
- (BOOL)isInProgress;
- (BOOL)isRecentlyMigrated:(id)a3;
- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7;
- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 orState:(unint64_t)a5 logIdentifier:(id)a6 logAction:(id)a7 logCount:(unint64_t)a8;
- (EFCancelable)migrationCancelable;
- (_EDThreadMigrationState)init;
- (id)nextBatch;
- (unint64_t)generation;
- (unint64_t)state;
- (unint64_t)unmigratedCount;
- (void)_removeAllObjectIDs;
- (void)addDeletedObjectIDs:(id)a3;
- (void)addObjectIDs:(id)a3;
- (void)cancel;
- (void)fail;
- (void)removeDeletedObjectIDs:(id)a3;
- (void)removeMigratedObjectIDs:(id)a3;
- (void)removeObjectIDs:(id)a3;
- (void)reset;
- (void)setMigrationCancelable:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation _EDThreadMigrationState

- (_EDThreadMigrationState)init
{
  v10.receiver = self;
  v10.super_class = (Class)_EDThreadMigrationState;
  v2 = [(_EDThreadMigrationState *)&v10 init];
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    objectIDsToMigrate = v2->_objectIDsToMigrate;
    v2->_objectIDsToMigrate = v3;

    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    recentlyMigratedObjectIDs = v2->_recentlyMigratedObjectIDs;
    v2->_recentlyMigratedObjectIDs = v5;

    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    recentlyDeletedObjectIDs = v2->_recentlyDeletedObjectIDs;
    v2->_recentlyDeletedObjectIDs = v7;

    [(_EDThreadMigrationState *)v2 setState:0];
  }
  return v2;
}

- (unint64_t)unmigratedCount
{
  return [(NSCountedSet *)self->_objectIDsToMigrate count];
}

- (BOOL)isEmpty
{
  return [(_EDThreadMigrationState *)self unmigratedCount] == 0;
}

- (BOOL)isFullyMigrated
{
  BOOL v3 = [(_EDThreadMigrationState *)self isEmpty];
  if (v3)
  {
    if ([(NSCountedSet *)self->_recentlyMigratedObjectIDs count]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = [(NSCountedSet *)self->_recentlyDeletedObjectIDs count] == 0;
    }
  }
  return v3;
}

- (BOOL)isInProgress
{
  unint64_t v3 = [(_EDThreadMigrationState *)self state];
  if (v3 != 1) {
    LOBYTE(v3) = [(_EDThreadMigrationState *)self state] == 2;
  }
  return v3;
}

- (void)reset
{
}

- (void)fail
{
  [(_EDThreadMigrationState *)self setState:4];

  [(_EDThreadMigrationState *)self _removeAllObjectIDs];
}

- (void)cancel
{
  [(_EDThreadMigrationState *)self setState:5];

  [(_EDThreadMigrationState *)self _removeAllObjectIDs];
}

- (void)_removeAllObjectIDs
{
  [(NSCountedSet *)self->_objectIDsToMigrate removeAllObjects];
  [(NSCountedSet *)self->_recentlyMigratedObjectIDs removeAllObjects];
  recentlyDeletedObjectIDs = self->_recentlyDeletedObjectIDs;

  [(NSCountedSet *)recentlyDeletedObjectIDs removeAllObjects];
}

- (BOOL)isRecentlyMigrated:(id)a3
{
  return [(NSCountedSet *)self->_recentlyMigratedObjectIDs containsObject:a3];
}

- (id)nextBatch
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSCountedSet *)self->_objectIDsToMigrate count])
  {
    while ((unint64_t)[v3 count] <= 0x1F3
         && [(NSCountedSet *)self->_objectIDsToMigrate count])
    {
      v4 = [(NSCountedSet *)self->_objectIDsToMigrate anyObject];
      [v3 addObject:v4];
      [(NSCountedSet *)self->_objectIDsToMigrate removeObject:v4];
      [(NSCountedSet *)self->_recentlyMigratedObjectIDs addObject:v4];
    }
  }

  return v3;
}

- (void)addObjectIDs:(id)a3
{
}

- (void)removeObjectIDs:(id)a3
{
}

- (void)removeMigratedObjectIDs:(id)a3
{
}

- (void)addDeletedObjectIDs:(id)a3
{
}

- (void)removeDeletedObjectIDs:(id)a3
{
}

- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_logIdentifier_logAction_logCount___block_invoke;
  v8[3] = &unk_1E6C06980;
  v8[4] = self;
  v8[5] = a4;
  return [(_EDThreadMigrationState *)self _verifyIsMigratingGeneration:a3 stateVerifier:v8 logIdentifier:a5 logAction:a6 logCount:a7];
}

- (BOOL)verifyIsMigratingGeneration:(unint64_t)a3 andIsInState:(unint64_t)a4 orState:(unint64_t)a5 logIdentifier:(id)a6 logAction:(id)a7 logCount:(unint64_t)a8
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109___EDThreadMigrationState_verifyIsMigratingGeneration_andIsInState_orState_logIdentifier_logAction_logCount___block_invoke;
  v9[3] = &unk_1E6C069A8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  return [(_EDThreadMigrationState *)self _verifyIsMigratingGeneration:a3 stateVerifier:v9 logIdentifier:a6 logAction:a7 logCount:a8];
}

- (BOOL)_verifyIsMigratingGeneration:(unint64_t)a3 stateVerifier:(id)a4 logIdentifier:(id)a5 logAction:(id)a6 logCount:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v12 = (uint64_t (**)(void))a4;
  id v13 = a5;
  id v14 = a6;
  if ([(_EDThreadMigrationState *)self generation] != a3)
  {
    v16 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134219010;
      id v21 = v13;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2048;
      unint64_t v27 = a7;
      __int16 v28 = 2048;
      unint64_t v29 = [(_EDThreadMigrationState *)self generation];
      _os_log_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_DEFAULT, "%p[%lu]: %{public}@ for %lu threads due to generation change (to %lu)", (uint8_t *)&v20, 0x34u);
    }
    goto LABEL_7;
  }
  if ((v12[2](v12) & 1) == 0)
  {
    v16 = +[EDThreadMigrator log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = [(_EDThreadMigrationState *)self state];
      if (v18 - 1 > 4) {
        v19 = @"Not Started";
      }
      else {
        v19 = off_1E6C069C8[v18 - 1];
      }
      int v20 = 134219010;
      id v21 = v13;
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2048;
      unint64_t v27 = a7;
      __int16 v28 = 2114;
      unint64_t v29 = (unint64_t)v19;
      _os_log_error_impl(&dword_1DB39C000, v16, OS_LOG_TYPE_ERROR, "%p[%lu]: %{public}@ for %lu threads due to wrong state: %{public}@", (uint8_t *)&v20, 0x34u);
    }
LABEL_7:

    BOOL v15 = 0;
    goto LABEL_8;
  }
  BOOL v15 = 1;
LABEL_8:

  return v15;
}

- (EFCancelable)migrationCancelable
{
  return self->_migrationCancelable;
}

- (void)setMigrationCancelable:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationCancelable, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_recentlyMigratedObjectIDs, 0);

  objc_storeStrong((id *)&self->_objectIDsToMigrate, 0);
}

@end