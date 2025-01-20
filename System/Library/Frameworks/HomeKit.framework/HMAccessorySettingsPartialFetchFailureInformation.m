@interface HMAccessorySettingsPartialFetchFailureInformation
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySettingsPartialFetchFailureInformation)init;
- (HMAccessorySettingsPartialFetchFailureInformation)initWithFailureTypes:(id)a3;
- (NSArray)attributeDescriptions;
- (NSDictionary)failureTypes;
- (NSString)description;
- (NSString)shortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)failedKeyPaths;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)payloadCopy;
- (int64_t)fetchFailureTypeForKeyPath:(id)a3;
- (unint64_t)hash;
- (void)setFetchFailureType:(int64_t)a3 forKeyPath:(id)a4;
@end

@implementation HMAccessorySettingsPartialFetchFailureInformation

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAccessorySettingsPartialFetchFailureInformation *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
      v8 = [(HMAccessorySettingsPartialFetchFailureInformation *)v6 failureTypes];
      uint64_t v9 = [v7 count];
      if (v9 == [v8 count])
      {
        v10 = [v7 allKeys];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __61__HMAccessorySettingsPartialFetchFailureInformation_isEqual___block_invoke;
        v13[3] = &unk_1E5942BE8;
        id v14 = v8;
        id v15 = v7;
        char v11 = objc_msgSend(v10, "na_allObjectsPassTest:", v13);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

uint64_t __61__HMAccessorySettingsPartialFetchFailureInformation_isEqual___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectForKey:v4];
  v6 = [*(id *)(a1 + 40) objectForKey:v4];

  uint64_t v7 = [v5 isEqualToNumber:v6];
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableAccessorySettingsPartialFetchFailureInformation alloc];
  v5 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  v6 = [(HMAccessorySettingsPartialFetchFailureInformation *)v4 initWithFailureTypes:v5];

  return v6;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMAccessorySettingsPartialFetchFailureInformation alloc];
  v5 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  v6 = [(HMAccessorySettingsPartialFetchFailureInformation *)v4 initWithFailureTypes:v5];

  return v6;
}

- (id)payloadCopy
{
  v2 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  unint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  v5 = (void *)[v3 initWithName:@"failureTypes" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (NSDictionary)failureTypes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_mutableFailureTypes copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (void)setFetchFailureType:(int64_t)a3 forKeyPath:(id)a4
{
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  mutableFailureTypes = self->_mutableFailureTypes;
  v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)mutableFailureTypes setObject:v8 forKey:v9];

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)fetchFailureTypeForKeyPath:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_mutableFailureTypes objectForKey:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    int64_t v8 = [v6 integerValue];

    os_unfair_lock_unlock(p_lock);
    return v8;
  }
  else
  {
    int64_t result = _HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (id)failedKeyPaths
{
  v2 = [(HMAccessorySettingsPartialFetchFailureInformation *)self failureTypes];
  id v3 = [v2 allKeys];

  return v3;
}

- (HMAccessorySettingsPartialFetchFailureInformation)initWithFailureTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessorySettingsPartialFetchFailureInformation;
  v5 = [(HMAccessorySettingsPartialFetchFailureInformation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableFailureTypes = v5->_mutableFailureTypes;
    v5->_mutableFailureTypes = (NSMutableDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (HMAccessorySettingsPartialFetchFailureInformation)init
{
  return [(HMAccessorySettingsPartialFetchFailureInformation *)self initWithFailureTypes:MEMORY[0x1E4F1CC08]];
}

@end