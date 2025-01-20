@interface LACSharedModeDataSourceNullAdapter
- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4;
@end

@implementation LACSharedModeDataSourceNullAdapter

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *))a4;
  v6 = LACLogSharedMode();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", (uint8_t *)&v9, 0xCu);
  }

  v7 = +[LACSharedMode defaultSharedMode];
  v8 = LACLogSharedMode();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ feature not supported in this platform %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v5[2](v5, v7);
}

@end