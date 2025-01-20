@interface HMDBackgroundOperationManagerDataSource
+ (NSString)name;
- (HMDBackgroundOperationManager)owner;
- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3;
- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4;
- (NSDictionary)values;
- (NSNotificationCenter)notificationCenter;
- (void)notifyDataSourceChanged;
@end

@implementation HMDBackgroundOperationManagerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_owner);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 16, 1);
}

- (HMDBackgroundOperationManager)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (HMDBackgroundOperationManager *)WeakRetained;
}

- (void)notifyDataSourceChanged
{
  id v3 = [(HMDBackgroundOperationManagerDataSource *)self owner];
  [v3 dataSourceHasUpdate:self];
}

- (NSDictionary)values
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3 notificationCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDBackgroundOperationManagerDataSource;
  v8 = [(HMDBackgroundOperationManagerDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationCenter, a4);
    objc_storeWeak((id *)&v9->_owner, v6);
  }

  return v9;
}

- (HMDBackgroundOperationManagerDataSource)initWithOperationManager:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  id v7 = [(HMDBackgroundOperationManagerDataSource *)self initWithOperationManager:v5 notificationCenter:v6];

  return v7;
}

+ (NSString)name
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end