@interface HMHomeManagerConfiguration
+ (id)defaultConfiguration;
+ (id)defaultPrivateConfiguration;
+ (id)shortDescription;
- (BOOL)canUseCache;
- (BOOL)canWriteToCache;
- (BOOL)isAdaptive;
- (BOOL)isDiscretionary;
- (BOOL)shouldConnect;
- (HMFLocationAuthorization)locationAuthorization;
- (HMHomeManagerConfiguration)init;
- (HMHomeManagerConfiguration)initWithOptions:(unint64_t)a3 cachePolicy:(unint64_t)a4;
- (NSArray)attributeDescriptions;
- (NSOperationQueue)delegateQueue;
- (NSString)description;
- (NSString)shortDescription;
- (NSURL)cacheURL;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)cachePolicy;
- (unint64_t)inactiveUpdatingLevel;
- (unint64_t)options;
- (void)setAdaptive:(BOOL)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setInactiveUpdatingLevel:(unint64_t)a3;
- (void)setLocationAuthorization:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation HMHomeManagerConfiguration

- (HMFLocationAuthorization)locationAuthorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 48, 1);
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)inactiveUpdatingLevel
{
  return self->_inactiveUpdatingLevel;
}

- (NSOperationQueue)delegateQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (BOOL)shouldConnect
{
  return [(HMHomeManagerConfiguration *)self cachePolicy] != 2;
}

+ (id)defaultPrivateConfiguration
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:-1 cachePolicy:1];

  return v2;
}

- (HMHomeManagerConfiguration)initWithOptions:(unint64_t)a3 cachePolicy:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)HMHomeManagerConfiguration;
  v6 = [(HMHomeManagerConfiguration *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_cachePolicy = a4;
    v6->_options = a3;
    v6->_inactiveUpdatingLevel = 0;
    uint64_t v8 = [MEMORY[0x1E4F28F08] mainQueue];
    delegateQueue = v7->_delegateQueue;
    v7->_delegateQueue = (NSOperationQueue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F65468] sharedAuthorization];
    locationAuthorization = v7->_locationAuthorization;
    v7->_locationAuthorization = (HMFLocationAuthorization *)v10;

    if ([(HMHomeManagerConfiguration *)v7 canUseCache]
      || [(HMHomeManagerConfiguration *)v7 canWriteToCache])
    {
      v12 = HMCreateConfigurationsCacheDirectory();
      if (v12)
      {
        uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
        cacheURL = v7->_cacheURL;
        v7->_cacheURL = (NSURL *)v13;
      }
      else
      {
        v15 = (void *)MEMORY[0x19F3A64A0]();
        v16 = v7;
        v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v22 = v18;
          _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create the home configuration cache folder -- turning off the caching support", buf, 0xCu);
        }
        v7->_cachePolicy = 0;
      }
    }
  }
  return v7;
}

- (BOOL)canWriteToCache
{
  if ([(HMHomeManagerConfiguration *)self cachePolicy] == 3) {
    return 1;
  }

  return [(HMHomeManagerConfiguration *)self canUseCache];
}

- (BOOL)canUseCache
{
  return [(HMHomeManagerConfiguration *)self cachePolicy] - 1 < 2;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setInactiveUpdatingLevel:(unint64_t)a3
{
  self->_inactiveUpdatingLevel = a3;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)setLocationAuthorization:(id)a3
{
}

- (void)setAdaptive:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_locationAuthorization, 0);

  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (NSArray)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = HMHomeManagerOptionsToString([(HMHomeManagerConfiguration *)self options]);
  v24 = (void *)[v3 initWithName:@"Options" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v23 = HMHomeManagerCachePolicyToString([(HMHomeManagerConfiguration *)self cachePolicy]);
  v22 = (void *)[v4 initWithName:@"Cache Policy" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomeManagerConfiguration *)self isDiscretionary];
  v21 = HMFBooleanToString();
  v6 = (void *)[v5 initWithName:@"Discretionary" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = HMHomeManagerInactiveUpdatingLevelToString([(HMHomeManagerConfiguration *)self inactiveUpdatingLevel]);
  v9 = (void *)[v7 initWithName:@"Inactive Updating Level" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMHomeManagerConfiguration *)self delegateQueue];
  v12 = (void *)[v10 initWithName:@"Delegate Queue" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMHomeManagerConfiguration *)self locationAuthorization];
  v15 = (void *)[v13 initWithName:@"Location Authorization" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMHomeManagerConfiguration *)self shouldConnect];
  v17 = HMFBooleanToString();
  v18 = (void *)[v16 initWithName:@"Should Connect" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return (NSArray *)v19;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(HMHomeManagerConfiguration *)+[HMMutableHomeManagerConfiguration allocWithZone:a3] initWithOptions:[(HMHomeManagerConfiguration *)self options] cachePolicy:[(HMHomeManagerConfiguration *)self cachePolicy]];
  [(HMHomeManagerConfiguration *)v4 setDiscretionary:[(HMHomeManagerConfiguration *)self isDiscretionary]];
  [(HMHomeManagerConfiguration *)v4 setInactiveUpdatingLevel:[(HMHomeManagerConfiguration *)self inactiveUpdatingLevel]];
  id v5 = [(HMHomeManagerConfiguration *)self delegateQueue];
  [(HMHomeManagerConfiguration *)v4 setDelegateQueue:v5];

  v6 = [(HMHomeManagerConfiguration *)self locationAuthorization];
  [(HMHomeManagerConfiguration *)v4 setLocationAuthorization:v6];

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)defaultConfiguration
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:-16385 cachePolicy:0];

  return v2;
}

- (BOOL)isAdaptive
{
  return [(HMHomeManagerConfiguration *)self inactiveUpdatingLevel] != 0;
}

- (HMHomeManagerConfiguration)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end