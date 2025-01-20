@interface IKAppUserDefaults
+ (id)sharedUserDefaults;
- (id)dataForKey:(id)a3;
- (void)removeDataForKey:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
@end

@implementation IKAppUserDefaults

+ (id)sharedUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__IKAppUserDefaults_sharedUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUserDefaults_onceToken != -1) {
    dispatch_once(&sharedUserDefaults_onceToken, block);
  }
  v2 = (void *)sharedUserDefaults_userDefaults;
  return v2;
}

uint64_t __39__IKAppUserDefaults_sharedUserDefaults__block_invoke()
{
  objc_opt_class();
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedUserDefaults_userDefaults;
  sharedUserDefaults_userDefaults = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)dataForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 standardUserDefaults];
  [v8 setObject:v7 forKey:v6];
}

- (void)removeDataForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 removeObjectForKey:v4];
}

@end