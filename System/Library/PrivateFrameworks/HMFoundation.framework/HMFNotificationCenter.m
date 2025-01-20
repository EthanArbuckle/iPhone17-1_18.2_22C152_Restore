@interface HMFNotificationCenter
+ (id)defaultCenter;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
- (void)postNotification:(id)a3;
- (void)postNotificationName:(id)a3 object:(id)a4;
- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5;
@end

@implementation HMFNotificationCenter

- (void)postNotificationName:(id)a3 object:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultCenter];
  [v8 postNotificationName:v7 object:v6];
}

+ (id)defaultCenter
{
  if (qword_1EB4EEDB0 != -1) {
    dispatch_once(&qword_1EB4EEDB0, &__block_literal_global_39);
  }
  v2 = (void *)_MergedGlobals_70;
  return v2;
}

uint64_t __38__HMFNotificationCenter_defaultCenter__block_invoke()
{
  _MergedGlobals_70 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F28EB8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v9 defaultCenter];
  [v13 addObserver:v12 selector:a4 name:v11 object:v10];
}

- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F28EB8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 defaultCenter];
  [v11 removeObserver:v10 name:v9 object:v8];
}

- (void)removeObserver:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];
}

- (void)postNotification:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotification:v4];
}

- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F28EB8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 defaultCenter];
  [v11 postNotificationName:v10 object:v9 userInfo:v8];
}

@end