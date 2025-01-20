@interface ESAEscrowActivityUpdateResult
- (BOOL)didChange;
- (BOOL)isComplete;
- (BOOL)shouldReap;
- (ESAEscrowActivityUpdateResult)initWithActivity:(id)a3 event:(id)a4 context:(id)a5 totalPreviousOperations:(unint64_t)a6;
- (NSArray)activeOperations;
- (NSArray)reapedOperations;
- (NSArray)updatedOperations;
- (SecureBackupEscrowActivity)activity;
@end

@implementation ESAEscrowActivityUpdateResult

- (ESAEscrowActivityUpdateResult)initWithActivity:(id)a3 event:(id)a4 context:(id)a5 totalPreviousOperations:(unint64_t)a6
{
  id v56 = a3;
  id v57 = a4;
  id v51 = a5;
  v75.receiver = self;
  v75.super_class = (Class)ESAEscrowActivityUpdateResult;
  v54 = [(ESAEscrowActivityUpdateResult *)&v75 init];
  if (v54)
  {
    if (v56) {
      v52 = (SecureBackupEscrowActivity *)[v56 copy];
    }
    else {
      v52 = [[SecureBackupEscrowActivity alloc] initWithInitialEvent:v57 context:v51];
    }
    v10 = [v56 operations];
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v10 count] + 1);

    v12 = +[NSMutableArray array];
    v13 = +[NSMutableArray array];
    v14 = +[NSMutableArray array];
    *(_WORD *)&v54->_didChange = 256;
    v54->_shouldReap = 1;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    v74[3] = a6;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100035454;
    v66[3] = &unk_100071C08;
    v53 = v54;
    v67 = v53;
    id v47 = v13;
    id v68 = v47;
    id v55 = v51;
    id v69 = v55;
    v73 = v74;
    id v50 = v14;
    id v70 = v50;
    id v48 = v12;
    id v71 = v48;
    id v49 = v11;
    id v72 = v49;
    v15 = objc_retainBlock(v66);
    if (v57)
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v16 = [v56 operations];
      id v17 = [(SecureBackupEscrowOperation *)v16 countByEnumeratingWithState:&v62 objects:v77 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v63;
LABEL_8:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v63 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
          v21 = [v57 operationId];
          v22 = [v20 id];
          unsigned __int8 v23 = [v21 isEqual:v22];

          if (v23) {
            break;
          }
          if (v17 == (id)++v19)
          {
            id v17 = [(SecureBackupEscrowOperation *)v16 countByEnumeratingWithState:&v62 objects:v77 count:16];
            if (v17) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_14:

        v16 = [[SecureBackupEscrowOperation alloc] initWithEvent:v57 parentActivity:v56 context:v55];
        ((void (*)(void *, void, SecureBackupEscrowOperation *))v15[2])(v15, 0, v16);
      }
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v24 = [v56 operations];
    v25 = [v24 reverseObjectEnumerator];

    id v26 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v59;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v59 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if (v57
            && ([*(id *)(*((void *)&v58 + 1) + 8 * i) id],
                v30 = objc_claimAutoreleasedReturnValue(),
                [v57 operationId],
                v31 = objc_claimAutoreleasedReturnValue(),
                unsigned int v32 = [v30 isEqual:v31],
                v31,
                v30,
                v32))
          {
            uint64_t v33 = [v29 updatedOperationWithAdditionalEvent:v57 parentActivity:v56 context:v55];
          }
          else
          {
            uint64_t v33 = [v29 updatedOperationWithParentActivity:v56 context:v55];
          }
          v34 = (void *)v33;
          ((void (*)(void *, void *, uint64_t))v15[2])(v15, v29, v33);
        }
        id v26 = [v25 countByEnumeratingWithState:&v58 objects:v76 count:16];
      }
      while (v26);
    }

    if ([v49 count])
    {
      id v35 = [v49 copy];
      [(SecureBackupEscrowActivity *)v52 setOperations:v35];
    }
    else
    {
      id v36 = [v50 copy];
      [(SecureBackupEscrowActivity *)v52 setOperations:v36];

      v54->_shouldReap = 1;
    }
    v37 = (NSArray *)[v48 copy];
    activeOperations = v53->_activeOperations;
    v53->_activeOperations = v37;

    v39 = (NSArray *)[v47 copy];
    updatedOperations = v53->_updatedOperations;
    v53->_updatedOperations = v39;

    v41 = (NSArray *)[v50 copy];
    reapedOperations = v53->_reapedOperations;
    v53->_reapedOperations = v41;

    [(SecureBackupEscrowActivity *)v52 setAllOperationsComplete:v54->_isComplete];
    -[SecureBackupEscrowActivity setSomeOperationsReaped:](v52, "setSomeOperationsReaped:", [v50 count] != 0);
    activity = v53->_activity;
    v53->_activity = v52;
    v44 = v52;

    v45 = v53;
    _Block_object_dispose(v74, 8);
  }
  return v54;
}

- (SecureBackupEscrowActivity)activity
{
  return self->_activity;
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (BOOL)shouldReap
{
  return self->_shouldReap;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reapedOperations, 0);
  objc_storeStrong((id *)&self->_updatedOperations, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end