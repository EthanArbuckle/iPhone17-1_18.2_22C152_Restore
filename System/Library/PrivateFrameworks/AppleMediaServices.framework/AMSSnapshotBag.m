@interface AMSSnapshotBag
+ (BOOL)supportsSecureCoding;
- (AMSBagFrozenDataSource)dataSource;
- (AMSSnapshotBag)init;
- (AMSSnapshotBag)initWithCoder:(id)a3;
- (AMSSnapshotBag)initWithData:(id)a3;
- (BOOL)isExpired;
- (BOOL)isLoaded;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)_initWithDataSource:(id)a3;
- (id)_initWithSnapshotBag:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)compile;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation AMSSnapshotBag

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:3];

  return v7;
}

- (NSString)profileVersion
{
  v2 = [(AMSSnapshotBag *)self dataSource];
  v3 = [v2 profileVersion];

  return (NSString *)v3;
}

- (NSString)profile
{
  v2 = [(AMSSnapshotBag *)self dataSource];
  v3 = [v2 profile];

  return (NSString *)v3;
}

- (BOOL)isExpired
{
  v2 = [(AMSSnapshotBag *)self expirationDate];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v3 compare:v2] == 1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (NSDate)expirationDate
{
  v2 = [(AMSSnapshotBag *)self dataSource];
  v3 = [v2 expirationDate];

  return (NSDate *)v3;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:5];

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:2];

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:6];

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:4];

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:0];

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = [AMSBagValue alloc];
  v6 = [(AMSSnapshotBag *)self dataSource];
  v7 = [(AMSBagValue *)v5 initWithDataSource:v6 key:v4 valueType:1];

  return v7;
}

- (AMSBagFrozenDataSource)dataSource
{
  return self->_dataSource;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __47__AMSSnapshotBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [AMSBagFrozenDataSourceBuilder alloc];
  v3 = [*(id *)(a1 + 32) dataSource];
  v7 = [(AMSBagFrozenDataSourceBuilder *)v2 initWithFrozenDataSource:v3];

  id v4 = [AMSSnapshotBag alloc];
  v5 = [(AMSBagFrozenDataSourceBuilder *)v7 createFrozenDataSource];
  id v6 = [(AMSSnapshotBag *)v4 _initWithDataSource:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSSnapshotBag;
  id v6 = [(AMSSnapshotBag *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AMSSnapshotBag)initWithData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v6 = v11;
  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedBagConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchived snapshot bag. Error: %{public}@", buf, 0x16u);
    }

    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (AMSSnapshotBag)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSnapshotBag;
  id v5 = [(AMSSnapshotBag *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationData"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataSource"];
    dataSource = v5->_dataSource;
    v5->_dataSource = (AMSBagFrozenDataSource *)v8;
  }
  return v5;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__AMSSnapshotBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E559F6A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (AMSSnapshotBag)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedBagConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = objc_opt_class();
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: The default initializer is deprecated and should not be used", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)AMSSnapshotBag;
  return [(AMSSnapshotBag *)&v6 init];
}

- (id)_initWithSnapshotBag:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSnapshotBag;
  id v5 = [(AMSSnapshotBag *)&v13 init];
  if (v5)
  {
    objc_super v6 = [v4 dataSource];
    uint64_t v7 = [v6 copy];
    dataSource = v5->_dataSource;
    v5->_dataSource = (AMSBagFrozenDataSource *)v7;

    uint64_t v9 = [v4 creationDate];
    uint64_t v10 = [v9 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;
  }
  return v5;
}

- (BOOL)isLoaded
{
  v2 = [(AMSSnapshotBag *)self dataSource];
  char v3 = [v2 isLoaded];

  return v3;
}

- (id)compile
{
  char v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = [(AMSSnapshotBag *)self dataSource];

  if (v4)
  {
    if ([(AMSSnapshotBag *)self isMemberOfClass:objc_opt_class()])
    {
      [(AMSMutablePromise *)v3 finishWithResult:self];
      goto LABEL_7;
    }
    id v7 = [[AMSSnapshotBag alloc] _initWithSnapshotBag:self];
    [(AMSMutablePromise *)v3 finishWithResult:v7];
  }
  else
  {
    id v5 = [(AMSSnapshotBag *)self profile];
    objc_super v6 = [(AMSSnapshotBag *)self profileVersion];
    id v7 = +[AMSBag bagForProfile:v5 profileVersion:v6];

    uint64_t v8 = [(AMSPromise *)v3 completionHandlerAdapter];
    [v7 createSnapshotWithCompletion:v8];
  }
LABEL_7:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__AMSSnapshotBag_compile__block_invoke;
  v11[3] = &unk_1E55A65D8;
  v11[4] = self;
  uint64_t v9 = [(AMSMutablePromise *)v3 thenWithBlock:v11];

  return v9;
}

AMSMutablePromise *__25__AMSSnapshotBag_compile__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v9];
  id v3 = v9;
  if (v3)
  {
    id v4 = +[AMSLogConfig sharedBagConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive snapshot bag. Error: %{public}@", buf, 0x16u);
    }

    id v7 = +[AMSPromise promiseWithError:v3];
  }
  else
  {
    id v7 = objc_alloc_init(AMSMutablePromise);
    [(AMSMutablePromise *)v7 finishWithResult:v2 error:0];
  }

  return v7;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [AMSBagValue alloc];
  id v9 = [(AMSSnapshotBag *)self dataSource];
  uint64_t v10 = [(AMSBagValue *)v8 initWithDataSource:v9 key:v6 valueType:5 account:v7];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AMSSnapshotBag *)self creationDate];
  [v6 encodeObject:v4 forKey:@"creationData"];

  id v5 = [(AMSSnapshotBag *)self dataSource];
  [v6 encodeObject:v5 forKey:@"dataSource"];
}

- (void)setDataSource:(id)a3
{
}

@end