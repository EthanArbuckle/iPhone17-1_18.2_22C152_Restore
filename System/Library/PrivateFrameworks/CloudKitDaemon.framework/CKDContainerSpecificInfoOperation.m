@interface CKDContainerSpecificInfoOperation
- (BOOL)requireUserIDs;
- (BOOL)shouldCheckAppVersion;
- (CKDContainerServerInfo)containerServerInfo;
- (CKDContainerSpecificInfoOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (OS_dispatch_group)infoFetchedGroup;
- (id)activityCreate;
- (void)main;
- (void)setCompletionBlock:(id)a3;
- (void)setContainerServerInfo:(id)a3;
- (void)setRequireUserIDs:(BOOL)a3;
@end

@implementation CKDContainerSpecificInfoOperation

- (CKDContainerSpecificInfoOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKDContainerSpecificInfoOperation;
  id v4 = [(CKDOperation *)&v8 initWithOperationInfo:a3 container:a4];
  if (v4)
  {
    dispatch_group_t v5 = dispatch_group_create();
    v6 = (void *)*((void *)v4 + 58);
    *((void *)v4 + 58) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v4 + 58));
  }
  return (CKDContainerSpecificInfoOperation *)v4;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/container-specific-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4FE7094;
  aBlock[3] = &unk_1E64F1A88;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)CKDContainerSpecificInfoOperation;
  [(CKDOperation *)&v7 setCompletionBlock:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)main
{
  v3 = [CKDContainerSpecificInfoURLRequest alloc];
  v6 = objc_msgSend_container(self, v4, v5);
  id v9 = objc_msgSend_containerID(v6, v7, v8);
  v12 = objc_msgSend_containerIdentifier(v9, v10, v11);
  v14 = objc_msgSend_initWithOperation_containerIdentifier_(v3, v13, (uint64_t)self, v12);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v14);
  uint64_t v17 = objc_msgSend_requireUserIDs(self, v15, v16);
  objc_msgSend_setRequireUserIDs_(v14, v18, v17);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = sub_1C4FE72B0;
  v28 = &unk_1E64F0170;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  objc_msgSend_setCompletionBlock_(v14, v19, (uint64_t)&v25);
  objc_msgSend_setRequest_(self, v20, (uint64_t)v14, v25, v26, v27, v28);
  v23 = objc_msgSend_container(self, v21, v22);
  objc_msgSend_performRequest_(v23, v24, (uint64_t)v14);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (BOOL)requireUserIDs
{
  return self->_requireUserIDs;
}

- (void)setRequireUserIDs:(BOOL)a3
{
  self->_requireUserIDs = a3;
}

- (CKDContainerServerInfo)containerServerInfo
{
  return self->_containerServerInfo;
}

- (void)setContainerServerInfo:(id)a3
{
}

- (OS_dispatch_group)infoFetchedGroup
{
  return self->_infoFetchedGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoFetchedGroup, 0);
  objc_storeStrong((id *)&self->_containerServerInfo, 0);
}

@end