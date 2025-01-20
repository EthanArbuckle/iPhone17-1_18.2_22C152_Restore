@interface HMDBackingStoreFetchArchiveOperation
- (HMDBackingStoreFetchArchiveOperation)initWithFetchResult:(id)a3;
- (NSString)identifier;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HMDBackingStoreFetchArchiveOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_fetchResult, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setFetchResult:(id)a3
{
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (id)mainReturningError
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  char v5 = [v4 _selectArchiveWithIdentifier:@"homedata" archive:&v18 controllerUserName:&v17 error:&v16];
  id v6 = v18;
  id v7 = v17;
  id v8 = v16;

  if ((v5 & 1) == 0 && !v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not select archive", buf, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  }
  v13 = [(HMDBackingStoreFetchArchiveOperation *)self fetchResult];
  ((void (**)(void, id, id, id))v13)[2](v13, v6, v7, v8);

  id v14 = v8;
  return v14;
}

- (HMDBackingStoreFetchArchiveOperation)initWithFetchResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackingStoreFetchArchiveOperation;
  char v5 = [(HMDBackingStoreOperation *)&v9 init];
  if (v5)
  {
    id v6 = _Block_copy(v4);
    id fetchResult = v5->_fetchResult;
    v5->_id fetchResult = v6;
  }
  return v5;
}

@end