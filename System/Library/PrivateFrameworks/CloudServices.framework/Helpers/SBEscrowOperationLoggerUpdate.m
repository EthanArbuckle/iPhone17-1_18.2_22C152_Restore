@interface SBEscrowOperationLoggerUpdate
- (BOOL)isComplete;
- (NSArray)activeActivities;
- (NSArray)activeOperations;
- (NSArray)completedOperations;
- (NSArray)failedOperations;
- (NSArray)reapedActivities;
- (NSArray)reapedOperations;
- (NSArray)successfulOperations;
- (NSArray)updatedActivities;
- (NSArray)updatedOperations;
- (SBEscrowOperationLoggerUpdate)initWithLog:(id)a3 event:(id)a4 context:(id)a5;
- (SecureBackupLog)updatedLog;
- (unint64_t)totalOperations;
@end

@implementation SBEscrowOperationLoggerUpdate

- (SBEscrowOperationLoggerUpdate)initWithLog:(id)a3 event:(id)a4 context:(id)a5
{
  id v59 = a3;
  id v63 = a4;
  id v62 = a5;
  v90.receiver = self;
  v90.super_class = (Class)SBEscrowOperationLoggerUpdate;
  v60 = [(SBEscrowOperationLoggerUpdate *)&v90 init];
  if (v60)
  {
    v8 = +[NSMutableArray array];
    v9 = +[NSMutableArray array];
    v10 = +[NSMutableArray array];
    v11 = +[NSMutableArray array];
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x2020000000;
    uint64_t v89 = 0;
    v12 = +[NSMutableArray array];
    v13 = +[NSMutableArray array];
    +[NSMutableArray array];
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    char v85 = 1;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_100035D94;
    v72[3] = &unk_100071C30;
    v80 = &v86;
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    id v73 = v51;
    id v58 = v8;
    id v74 = v58;
    v55 = v11;
    v75 = v55;
    v56 = v10;
    v76 = v56;
    v53 = v13;
    v77 = v53;
    v81 = &v82;
    v57 = v9;
    v78 = v57;
    v54 = v12;
    v79 = v54;
    v14 = objc_retainBlock(v72);
    if (v63)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v15 = [v59 activities];
      id v16 = [(ESAEscrowActivityUpdateResult *)v15 countByEnumeratingWithState:&v68 objects:v92 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v69;
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v69 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v68 + 1) + 8 * v18);
          v20 = objc_msgSend(v63, "activityId", v51);
          v21 = [v19 id];
          LOBYTE(v19) = [v20 isEqual:v21];

          if (v19) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [(ESAEscrowActivityUpdateResult *)v15 countByEnumeratingWithState:&v68 objects:v92 count:16];
            if (v16) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        v22 = [ESAEscrowActivityUpdateResult alloc];
        v15 = [(ESAEscrowActivityUpdateResult *)v22 initWithActivity:0 event:v63 context:v62 totalPreviousOperations:v87[3]];
        ((void (*)(void *, ESAEscrowActivityUpdateResult *))v14[2])(v14, v15);
      }
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v23 = objc_msgSend(v59, "activities", v51);
    id obj = [v23 reverseObjectEnumerator];

    id v24 = [obj countByEnumeratingWithState:&v64 objects:v91 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v65;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v28 = [v27 id];
          v29 = [v63 activityId];
          unsigned int v30 = [v28 isEqual:v29];

          v31 = [ESAEscrowActivityUpdateResult alloc];
          if (v30) {
            id v32 = v63;
          }
          else {
            id v32 = 0;
          }
          v33 = [(ESAEscrowActivityUpdateResult *)v31 initWithActivity:v27 event:v32 context:v62 totalPreviousOperations:v87[3]];
          ((void (*)(void *, ESAEscrowActivityUpdateResult *))v14[2])(v14, v33);
        }
        id v24 = [obj countByEnumeratingWithState:&v64 objects:v91 count:16];
      }
      while (v24);
    }

    v34 = [SecureBackupLog alloc];
    v35 = [(SecureBackupLog *)v34 initWithActivities:v58 allComplete:*((unsigned __int8 *)v83 + 24) totalOperations:v87[3]];
    updatedLog = v60->_updatedLog;
    v60->_updatedLog = v35;

    activeActivities = v60->_activeActivities;
    v60->_activeActivities = v57;
    v38 = v57;

    updatedActivities = v60->_updatedActivities;
    v60->_updatedActivities = v56;
    v40 = v56;

    reapedActivities = v60->_reapedActivities;
    v60->_reapedActivities = v55;
    v42 = v55;

    activeOperations = v60->_activeOperations;
    v60->_totalOperations = v87[3];
    v60->_activeOperations = v54;
    v44 = v54;

    updatedOperations = v60->_updatedOperations;
    v60->_updatedOperations = v53;
    v46 = v53;

    reapedOperations = v60->_reapedOperations;
    v60->_reapedOperations = v52;
    v48 = v52;

    v49 = v60;
    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v86, 8);
  }
  return v60;
}

- (SecureBackupLog)updatedLog
{
  return self->_updatedLog;
}

- (NSArray)activeActivities
{
  return self->_activeActivities;
}

- (NSArray)updatedActivities
{
  return self->_updatedActivities;
}

- (NSArray)reapedActivities
{
  return self->_reapedActivities;
}

- (unint64_t)totalOperations
{
  return self->_totalOperations;
}

- (NSArray)activeOperations
{
  return self->_activeOperations;
}

- (NSArray)updatedOperations
{
  return self->_updatedOperations;
}

- (NSArray)reapedOperations
{
  return self->_reapedOperations;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reapedOperations, 0);
  objc_storeStrong((id *)&self->_updatedOperations, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_reapedActivities, 0);
  objc_storeStrong((id *)&self->_updatedActivities, 0);
  objc_storeStrong((id *)&self->_activeActivities, 0);

  objc_storeStrong((id *)&self->_updatedLog, 0);
}

- (NSArray)completedOperations
{
  v3 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isComplete]) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)successfulOperations
{
  v3 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isComplete] && (objc_msgSend(v10, "didFail") & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSArray)failedOperations
{
  v3 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SBEscrowOperationLoggerUpdate *)self updatedOperations];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isComplete] && objc_msgSend(v10, "didFail")) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

@end