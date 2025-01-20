@interface SHLSyncSessionModifyTask
+ (BOOL)supportsSecureCoding;
- (NSArray)allItemIdentifiers;
- (NSProgress)progress;
- (NSString)identifier;
- (NSString)syncStartCondition;
- (SHLLibraryBatch)groupsToModify;
- (SHLLibraryBatch)tracksToModify;
- (SHLSyncSession)session;
- (SHLSyncSessionModifyTask)initWithCoder:(id)a3;
- (SHLSyncSessionModifyTask)initWithTracksToModify:(id)a3 groupsToModify:(id)a4;
- (SHLSyncSessionModifyTaskDelegate)delegate;
- (id)_init;
- (id)subdivideTaskIntoBatchesOfSize:(int64_t)a3;
- (int64_t)retryCount;
- (int64_t)size;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroupsToModify:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSyncStartCondition:(id)a3;
- (void)setTracksToModify:(id)a3;
- (void)updateProgress;
@end

@implementation SHLSyncSessionModifyTask

- (SHLSyncSessionModifyTask)initWithTracksToModify:(id)a3 groupsToModify:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SHLSyncSessionModifyTask;
  v9 = [(SHLSyncSessionModifyTask *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracksToModify, a3);
    objc_storeStrong((id *)&v10->_groupsToModify, a4);
    v11 = +[NSUUID UUID];
    uint64_t v12 = [v11 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    v10->_retryCount = 0;
    v14 = [v7 insertions];
    v15 = (char *)[v14 count];
    v16 = [v8 insertions];
    v17 = &v15[(void)[v16 count]];

    uint64_t v18 = +[NSProgress progressWithTotalUnitCount:v17];
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v18;
  }
  return v10;
}

- (id)_init
{
  v3 = [SHLLibraryBatch alloc];
  v4 = +[NSSet set];
  v5 = +[NSSet set];
  v6 = [(SHLLibraryBatch *)v3 initWithInsertions:v4 deletions:v5];

  id v7 = [SHLLibraryBatch alloc];
  id v8 = +[NSSet set];
  v9 = +[NSSet set];
  v10 = [(SHLLibraryBatch *)v7 initWithInsertions:v8 deletions:v9];

  v11 = [(SHLSyncSessionModifyTask *)self initWithTracksToModify:v6 groupsToModify:v10];
  return v11;
}

- (id)subdivideTaskIntoBatchesOfSize:(int64_t)a3
{
  v5 = +[NSMutableArray array];
  v6 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  id v7 = [v6 subdivideIntoBatchesOfSize:a3];
  id v8 = [v7 mutableCopy];

  [v8 sortUsingComparator:&stru_100076028];
  v9 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  v10 = [v9 subdivideIntoBatchesOfSize:a3];
  id v11 = [v10 mutableCopy];

  [v11 sortUsingComparator:&stru_100076048];
LABEL_2:
  if ([v8 count] || objc_msgSend(v11, "count"))
  {
    id v12 = [[SHLSyncSessionModifyTask alloc] _init];
    v13 = [(SHLSyncSessionModifyTask *)self syncStartCondition];
    [v12 setSyncStartCondition:v13];

    BOOL v14 = 1;
    while (![v8 count])
    {
      if ([v11 count])
      {
        v15 = [v11 firstObject];
        v19 = (char *)[v12 size];
        v20 = &v19[(void)[v15 numberOfItems]];
        BOOL v14 = (uint64_t)v20 <= a3;
        if ((uint64_t)v20 <= a3)
        {
          [v12 setTracksToModify:v15];
          uint64_t v18 = v11;
LABEL_11:
          [v18 removeObjectAtIndex:0];
          BOOL v14 = 1;
        }
LABEL_12:

        char v21 = 0;
        goto LABEL_13;
      }
      char v21 = 1;
LABEL_13:
      id v22 = [v12 size];
      if ((v21 & 1) != 0 || (uint64_t)v22 >= a3 || !v14)
      {
        [v12 updateProgress];
        [v5 addObject:v12];

        goto LABEL_2;
      }
    }
    v15 = [v8 firstObject];
    v16 = (char *)[v12 size];
    v17 = &v16[(void)[v15 numberOfItems]];
    BOOL v14 = (uint64_t)v17 <= a3;
    if ((uint64_t)v17 <= a3)
    {
      [v12 setGroupsToModify:v15];
      uint64_t v18 = v8;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v23 = [v5 copy];

  return v23;
}

- (int64_t)type
{
  return 0;
}

- (int64_t)size
{
  v3 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  v4 = (char *)[v3 numberOfItems];
  v5 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  v6 = &v4[(void)[v5 numberOfItems]];

  return (int64_t)v6;
}

- (NSArray)allItemIdentifiers
{
  v3 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  v4 = (char *)[v3 numberOfItems];
  v5 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  v6 = &v4[(void)[v5 numberOfItems]];

  id v7 = +[NSMutableArray arrayWithCapacity:v6];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v8 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  v9 = [v8 insertions];

  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) identifier];
        id v15 = [v14 copy];
        [v7 addObject:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  v16 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  v17 = [v16 deletions];
  uint64_t v18 = [v17 allObjects];
  [v7 addObjectsFromArray:v18];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v19 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  v20 = [v19 insertions];

  id v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) identifier];
        id v26 = [v25 copy];
        [v7 addObject:v26];
      }
      id v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  v27 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  v28 = [v27 deletions];
  v29 = [v28 allObjects];
  [v7 addObjectsFromArray:v29];

  return (NSArray *)v7;
}

- (SHLSyncSessionModifyTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SHLSyncSessionModifyTask;
  v5 = [(SHLSyncSessionModifyTask *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SHLSyncSessionModifyTaskTracksToModify"];
    tracksToModify = v5->_tracksToModify;
    v5->_tracksToModify = (SHLLibraryBatch *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"SHLSyncSessionModifyTaskGroupsToModify"];
    groupsToModify = v5->_groupsToModify;
    v5->_groupsToModify = (SHLLibraryBatch *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLSyncSessionModifyTaskIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    uint64_t v15 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", [v4 decodeInt64ForKey:@"SHLSyncSessionModifyTaskProgress"]);
    progress = v5->_progress;
    v5->_progress = (NSProgress *)v15;

    v5->_retryCount = (int64_t)[v4 decodeIntegerForKey:@"SHLSyncSessionModifyTaskRetryCount"];
    v5->_syncStartCondition = (NSString *)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLSyncSessionModifyTaskSyncTrigger"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tracksToModify = self->_tracksToModify;
  id v5 = a3;
  [v5 encodeObject:tracksToModify forKey:@"SHLSyncSessionModifyTaskTracksToModify"];
  [v5 encodeObject:self->_groupsToModify forKey:@"SHLSyncSessionModifyTaskGroupsToModify"];
  [v5 encodeObject:self->_identifier forKey:@"SHLSyncSessionModifyTaskIdentifier"];
  objc_msgSend(v5, "encodeInt64:forKey:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"), @"SHLSyncSessionModifyTaskProgress");
  [v5 encodeInteger:self->_retryCount forKey:@"SHLSyncSessionModifyTaskRetryCount"];
  [v5 encodeObject:self->_syncStartCondition forKey:@"SHLSyncSessionModifyTaskSyncTrigger"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateProgress
{
  v3 = [(SHLSyncSessionModifyTask *)self tracksToModify];
  id v4 = [v3 insertions];
  id v5 = (char *)[v4 count];
  uint64_t v6 = [(SHLSyncSessionModifyTask *)self groupsToModify];
  uint64_t v7 = [v6 insertions];
  id v8 = &v5[(void)[v7 count]];

  id v9 = [(SHLSyncSessionModifyTask *)self progress];
  [v9 setTotalUnitCount:v8];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (SHLSyncSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->session);

  return (SHLSyncSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSString)syncStartCondition
{
  return self->_syncStartCondition;
}

- (void)setSyncStartCondition:(id)a3
{
  self->_syncStartCondition = (NSString *)a3;
}

- (SHLSyncSessionModifyTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHLSyncSessionModifyTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHLLibraryBatch)tracksToModify
{
  return self->_tracksToModify;
}

- (void)setTracksToModify:(id)a3
{
}

- (SHLLibraryBatch)groupsToModify
{
  return self->_groupsToModify;
}

- (void)setGroupsToModify:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsToModify, 0);
  objc_storeStrong((id *)&self->_tracksToModify, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->session);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

@end