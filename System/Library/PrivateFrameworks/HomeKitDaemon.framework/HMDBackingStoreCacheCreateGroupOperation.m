@interface HMDBackingStoreCacheCreateGroupOperation
- (HMDBackingStoreCacheCreateGroupOperation)initWithZone:(id)a3 owner:(id)a4 rootRecord:(id)a5 subscriptionName:(id)a6 subscription:(id)a7 creationBlock:(id)a8;
- (HMDBackingStoreCacheGroup)record;
- (id)creationBlock;
- (id)mainReturningError;
- (void)setCreationBlock:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation HMDBackingStoreCacheCreateGroupOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (void)setCreationBlock:(id)a3
{
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (void)setRecord:(id)a3
{
}

- (HMDBackingStoreCacheGroup)record
{
  return self->_record;
}

- (id)mainReturningError
{
  v3 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
  v4 = [v3 zone];

  v5 = [(HMDBackingStoreOperation *)self store];
  v6 = [v5 local];
  v25 = v4;
  uint64_t v7 = [v4 zoneID];
  v8 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
  v9 = [v8 rootRecordName];
  v10 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
  v11 = [v10 owner];
  v12 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
  v13 = [v12 subscriptionName];
  id v26 = 0;
  uint64_t v24 = [v6 _insertGroupWithZoneID:v7 root:v9 owner:v11 subscription:v13 error:&v26];
  id v14 = v26;

  if (v14)
  {
    id v15 = v14;
    v16 = v25;
  }
  else
  {
    v17 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
    [v17 setGroupID:v24];

    v16 = v25;
    v18 = [v25 actualGroups];
    v19 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
    [v18 addObject:v19];

    v20 = [(HMDBackingStoreCacheCreateGroupOperation *)self creationBlock];

    if (v20)
    {
      v21 = [(HMDBackingStoreCacheCreateGroupOperation *)self creationBlock];
      v22 = [(HMDBackingStoreCacheCreateGroupOperation *)self record];
      ((void (**)(void, void *, void))v21)[2](v21, v22, 0);
    }
  }

  return v14;
}

- (HMDBackingStoreCacheCreateGroupOperation)initWithZone:(id)a3 owner:(id)a4 rootRecord:(id)a5 subscriptionName:(id)a6 subscription:(id)a7 creationBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDBackingStoreCacheCreateGroupOperation;
  v20 = [(HMDBackingStoreOperation *)&v27 init];
  if (v20)
  {
    v21 = [[HMDBackingStoreCacheGroup alloc] initWithGroupID:0 zone:v14 rootRecord:v16 serverChangeToken:0 subscriptionName:v17 owner:v15 subscription:v18];
    record = v20->_record;
    v20->_record = v21;

    v23 = _Block_copy(v19);
    id creationBlock = v20->_creationBlock;
    v20->_id creationBlock = v23;

    v25 = v20;
  }

  return v20;
}

@end