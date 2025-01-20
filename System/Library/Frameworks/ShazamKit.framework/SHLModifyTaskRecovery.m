@interface SHLModifyTaskRecovery
- (NSArray)deletedIDs;
- (NSArray)recoverableTasks;
- (NSArray)savedGroups;
- (NSArray)savedTracks;
- (NSError)error;
- (SHLModifyTaskRecovery)initWithOriginalTask:(id)a3 savedGroups:(id)a4 savedTracks:(id)a5 deletedIDs:(id)a6 error:(id)a7;
- (SHLSyncSessionModifyTask)originalTask;
- (id)recoverTaskFromLimitExceededError;
- (id)recoverTaskFromPartialError;
- (void)setDeletedIDs:(id)a3;
- (void)setError:(id)a3;
- (void)setOriginalTask:(id)a3;
- (void)setSavedGroups:(id)a3;
- (void)setSavedTracks:(id)a3;
@end

@implementation SHLModifyTaskRecovery

- (SHLModifyTaskRecovery)initWithOriginalTask:(id)a3 savedGroups:(id)a4 savedTracks:(id)a5 deletedIDs:(id)a6 error:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SHLModifyTaskRecovery;
  v17 = [(SHLModifyTaskRecovery *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_originalTask, a3);
    objc_storeStrong((id *)&v18->_savedGroups, a4);
    objc_storeStrong((id *)&v18->_savedTracks, a5);
    objc_storeStrong((id *)&v18->_deletedIDs, a6);
    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

- (NSArray)recoverableTasks
{
  v3 = [(SHLModifyTaskRecovery *)self error];
  v4 = [v3 domain];
  unsigned __int8 v5 = [v4 isEqualToString:CKErrorDomain];

  if (v5)
  {
    v6 = [(SHLModifyTaskRecovery *)self error];
    id v7 = [v6 code];

    if (v7 == (id)27)
    {
      uint64_t v8 = [(SHLModifyTaskRecovery *)self recoverTaskFromLimitExceededError];
      goto LABEL_7;
    }
    if (v7 == (id)2)
    {
      uint64_t v8 = [(SHLModifyTaskRecovery *)self recoverTaskFromPartialError];
LABEL_7:
      v11 = (void *)v8;
      goto LABEL_10;
    }
    v9 = [(SHLModifyTaskRecovery *)self originalTask];
    id v13 = v9;
    v10 = &v13;
  }
  else
  {
    v9 = [(SHLModifyTaskRecovery *)self originalTask];
    id v14 = v9;
    v10 = &v14;
  }
  v11 = +[NSArray arrayWithObjects:v10 count:1];

LABEL_10:

  return (NSArray *)v11;
}

- (id)recoverTaskFromPartialError
{
  v3 = [(SHLModifyTaskRecovery *)self savedGroups];
  v4 = +[NSSet setWithArray:v3];

  unsigned __int8 v5 = [(SHLModifyTaskRecovery *)self deletedIDs];
  v6 = +[NSMutableSet setWithArray:v5];

  id v7 = [(SHLModifyTaskRecovery *)self originalTask];
  uint64_t v8 = [v7 groupsToModify];
  v9 = [v8 deletions];
  [v6 intersectSet:v9];

  v10 = [[SHLLibraryBatch alloc] initWithInsertions:v4 deletions:v6];
  v11 = [(SHLModifyTaskRecovery *)self savedTracks];
  v12 = +[NSSet setWithArray:v11];

  id v13 = [(SHLModifyTaskRecovery *)self deletedIDs];
  id v14 = +[NSMutableSet setWithArray:v13];

  id v15 = [(SHLModifyTaskRecovery *)self originalTask];
  id v16 = [v15 tracksToModify];
  v17 = [v16 deletions];
  [v14 intersectSet:v17];

  v18 = [[SHLLibraryBatch alloc] initWithInsertions:v12 deletions:v14];
  v19 = [(SHLModifyTaskRecovery *)self originalTask];
  id v20 = [v19 groupsToModify];
  objc_super v21 = [v20 differenceOfBatch:v10];

  v22 = [(SHLModifyTaskRecovery *)self originalTask];
  v23 = [v22 tracksToModify];
  v24 = [v23 differenceOfBatch:v18];

  v25 = [[SHLSyncSessionModifyTask alloc] initWithTracksToModify:v24 groupsToModify:v21];
  v28 = v25;
  v26 = +[NSArray arrayWithObjects:&v28 count:1];

  return v26;
}

- (id)recoverTaskFromLimitExceededError
{
  v2 = [(SHLModifyTaskRecovery *)self originalTask];
  v3 = [v2 subdivideTaskIntoBatchesOfSize:200];

  return v3;
}

- (SHLSyncSessionModifyTask)originalTask
{
  return self->_originalTask;
}

- (void)setOriginalTask:(id)a3
{
}

- (NSArray)savedGroups
{
  return self->_savedGroups;
}

- (void)setSavedGroups:(id)a3
{
}

- (NSArray)savedTracks
{
  return self->_savedTracks;
}

- (void)setSavedTracks:(id)a3
{
}

- (NSArray)deletedIDs
{
  return self->_deletedIDs;
}

- (void)setDeletedIDs:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deletedIDs, 0);
  objc_storeStrong((id *)&self->_savedTracks, 0);
  objc_storeStrong((id *)&self->_savedGroups, 0);

  objc_storeStrong((id *)&self->_originalTask, 0);
}

@end