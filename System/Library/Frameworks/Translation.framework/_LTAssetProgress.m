@interface _LTAssetProgress
+ (BOOL)supportsSecureCoding;
+ (id)discreteProgressWithIdentifier:(id)a3 offlineState:(int64_t)a4;
+ (id)discreteProgressWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4;
- (BOOL)addComponent:(id)a3;
- (BOOL)hasComponents;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinished;
- (BOOL)removeComponent:(id)a3;
- (BOOL)updatePercentComplete:(double)a3;
- (BOOL)updateTotalUnitCount:(int64_t)a3 completedUnitCount:(int64_t)a4;
- (NSString)componentFilter;
- (NSString)identifier;
- (_LTAssetProgress)initWithCoder:(id)a3;
- (_LTAssetProgress)initWithIdentifier:(id)a3 offlineState:(int64_t)a4;
- (_LTAssetProgress)initWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4 completedUnitCount:(int64_t)a5;
- (double)fractionCompleted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)identifierPrefix;
- (int64_t)completedUnitCount;
- (int64_t)offlineState;
- (int64_t)totalUnitCount;
- (unint64_t)hash;
- (void)_fastReadTotal:(int64_t *)a3 completed:(int64_t *)a4;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllComponents;
- (void)setComponentFilter:(id)a3;
- (void)setGreaterThanOrEqualToOfflineState:(int64_t)a3;
- (void)setOfflineState:(int64_t)a3;
@end

@implementation _LTAssetProgress

- (_LTAssetProgress)initWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4 completedUnitCount:(int64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTAssetProgress;
  v9 = [(_LTAssetProgress *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    if ([v8 length])
    {
      v11 = (NSString *)v8;
      identifier = v10->_identifier;
      v10->_identifier = v11;
    }
    else
    {
      identifier = [MEMORY[0x263F08C38] UUID];
      uint64_t v13 = [identifier UUIDString];
      v14 = v10->_identifier;
      v10->_identifier = (NSString *)v13;
    }
    v10->_totalUnitCount = a4;
    v10->_completedUnitCount = a5;
    v15 = v10;
  }

  return v10;
}

- (_LTAssetProgress)initWithIdentifier:(id)a3 offlineState:(int64_t)a4
{
  v5 = [(_LTAssetProgress *)self initWithIdentifier:a3 totalUnitCount:100 completedUnitCount:0];
  [(_LTAssetProgress *)v5 setOfflineState:a4];
  return v5;
}

+ (id)discreteProgressWithIdentifier:(id)a3 totalUnitCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  if (a4 <= 100) {
    int64_t v8 = 100;
  }
  else {
    int64_t v8 = a4;
  }
  v9 = (void *)[v7 initWithIdentifier:v6 totalUnitCount:v8 completedUnitCount:0];

  return v9;
}

+ (id)discreteProgressWithIdentifier:(id)a3 offlineState:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v6 offlineState:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  id v4 = a3;
  [(_LTAssetProgress *)self _fastReadTotal:&v6 completed:&v5];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeInteger:v6 forKey:@"totalUnitCount"];
  [v4 encodeInteger:v5 forKey:@"completedUnitCount"];
  [v4 encodeObject:self->_componentFilter forKey:@"componentFilter"];
}

- (_LTAssetProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LTAssetProgress *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_totalUnitCount = [v4 decodeIntegerForKey:@"totalUnitCount"];
    v6->_completedUnitCount = [v4 decodeIntegerForKey:@"completedUnitCount"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"componentFilter"];
    componentFilter = v6->_componentFilter;
    v6->_componentFilter = (NSString *)v9;

    v11 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)totalUnitCount
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  [(_LTAssetProgress *)self _fastReadTotal:&v4 completed:&v3];
  return v4;
}

- (int64_t)completedUnitCount
{
  int64_t v3 = 0;
  uint64_t v4 = 0;
  [(_LTAssetProgress *)self _fastReadTotal:&v4 completed:&v3];
  return v3;
}

- (id)identifierPrefix
{
  identifierPrefix = self->_identifierPrefix;
  if (!identifierPrefix)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_identifierPrefix)
    {
      uint64_t v4 = [(NSString *)self->_identifier componentsSeparatedByString:@"-"];
      uint64_t v5 = [v4 firstObject];
      uint64_t v6 = self->_identifierPrefix;
      self->_identifierPrefix = v5;
    }
    os_unfair_lock_unlock(&self->_lock);
    identifierPrefix = self->_identifierPrefix;
  }

  return identifierPrefix;
}

- (void)_fastReadTotal:(int64_t *)a3 completed:(int64_t *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_components count])
  {
    componentFilter = self->_componentFilter;
    if (componentFilter)
    {
      uint64_t v9 = (void *)MEMORY[0x263EFFA08];
      v10 = [(NSString *)componentFilter componentsSeparatedByString:@"|"];
      v24 = [v9 setWithArray:v10];
    }
    else
    {
      v24 = 0;
    }
    v23 = p_lock;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = [(NSMutableDictionary *)self->_components allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v11);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (self->_componentFilter)
          {
            v19 = [*(id *)(*((void *)&v27 + 1) + 8 * i) identifierPrefix];
            int v20 = [v24 containsObject:v19];

            if (!v20) {
              continue;
            }
          }
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          [v18 _fastReadTotal:&v26 completed:&v25];
          v15 += v26;
          v14 += v25;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }

    void *v21 = v15;
    void *v22 = v14;

    p_lock = v23;
  }
  else
  {
    *a3 = self->_totalUnitCount;
    *a4 = self->_completedUnitCount;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)offlineState
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(_LTAssetProgress *)self _fastReadTotal:&v5 completed:&v4];
  int64_t v2 = 1;
  if (v4 == v5) {
    int64_t v2 = 2;
  }
  if (v4) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)setOfflineState:(int64_t)a3
{
  if ([(_LTAssetProgress *)self hasComponents])
  {
    uint64_t v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress setOfflineState:]();
    }
    return;
  }
  os_unfair_lock_lock(&self->_lock);
  if (a3)
  {
    if (a3 == 1)
    {
      int64_t completedUnitCount = self->_completedUnitCount;
      if (completedUnitCount && completedUnitCount != self->_totalUnitCount) {
        goto LABEL_14;
      }
      int64_t totalUnitCount = 1;
      goto LABEL_13;
    }
    if (a3 == 2)
    {
      int64_t totalUnitCount = self->_totalUnitCount;
LABEL_13:
      self->_int64_t completedUnitCount = totalUnitCount;
    }
  }
  else
  {
    self->_int64_t completedUnitCount = 0;
  }
LABEL_14:

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setGreaterThanOrEqualToOfflineState:(int64_t)a3
{
  if ([(_LTAssetProgress *)self offlineState] < a3)
  {
    [(_LTAssetProgress *)self removeAllComponents];
    [(_LTAssetProgress *)self setOfflineState:a3];
  }
}

- (void)removeAllComponents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_components removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasComponents
{
  int64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableDictionary *)v2->_components count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)addComponent:(id)a3
{
  uint64_t v4 = (_LTAssetProgress *)a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress addComponent:]();
    }
    goto LABEL_10;
  }
  if (self == v4)
  {
    uint64_t v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress addComponent:]();
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  components = self->_components;
  if (!components)
  {
    int64_t v8 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v9 = self->_components;
    self->_components = v8;

    components = self->_components;
  }
  v10 = [(_LTAssetProgress *)v5 identifier];
  [(NSMutableDictionary *)components setObject:v5 forKeyedSubscript:v10];

  os_unfair_lock_unlock(p_lock);
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)removeComponent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    components = self->_components;
    uint64_t v7 = [v4 identifier];
    [(NSMutableDictionary *)components removeObjectForKey:v7];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int64_t v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress removeComponent:]();
    }
  }

  return v4 != 0;
}

- (BOOL)updateTotalUnitCount:(int64_t)a3 completedUnitCount:(int64_t)a4
{
  if ([(_LTAssetProgress *)self hasComponents])
  {
    uint64_t v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:]();
    }
    return 0;
  }
  if (a3 <= 0)
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:]();
    }
    return 0;
  }
  if (a4 < 0 || a4 > a3)
  {
    BOOL v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_LTAssetProgress updateTotalUnitCount:completedUnitCount:]();
    }
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  int64_t totalUnitCount = self->_totalUnitCount;
  BOOL v9 = totalUnitCount != a3;
  if (totalUnitCount != a3) {
    self->_int64_t totalUnitCount = a3;
  }
  if (self->_completedUnitCount != a4)
  {
    self->_int64_t completedUnitCount = a4;
    BOOL v9 = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v9;
}

- (BOOL)updatePercentComplete:(double)a3
{
  if ([(_LTAssetProgress *)self hasComponents])
  {
    uint64_t v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_LTAssetProgress updatePercentComplete:]();
    }
    return 0;
  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    uint64_t v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_LTAssetProgress updatePercentComplete:](v7, a3);
    }
    return 0;
  }
  uint64_t v9 = [(_LTAssetProgress *)self totalUnitCount];
  if (a3 <= 0.0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    double v10 = (double)v9 * a3;
    if (v10 < 1.0) {
      double v10 = 1.0;
    }
    uint64_t v11 = (uint64_t)v10;
  }

  return [(_LTAssetProgress *)self updateTotalUnitCount:v9 completedUnitCount:v11];
}

- (double)fractionCompleted
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  [(_LTAssetProgress *)self _fastReadTotal:&v4 completed:&v3];
  if (v4) {
    return round((double)v3 / (double)v4 * 1000.0) / 1000.0;
  }
  else {
    return 0.0;
  }
}

- (BOOL)isFinished
{
  return [(_LTAssetProgress *)self offlineState] == 2;
}

- (BOOL)isCancelled
{
  return [(_LTAssetProgress *)self offlineState] == 0;
}

- (void)cancel
{
}

- (unint64_t)hash
{
  int64_t v2 = [(_LTAssetProgress *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_LTAssetProgress *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(_LTAssetProgress *)self identifier];
      uint64_t v7 = [(_LTAssetProgress *)v5 identifier];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        [(_LTAssetProgress *)self _fastReadTotal:&v15 completed:&v14];
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        [(_LTAssetProgress *)v5 _fastReadTotal:&v13 completed:&v12];
        BOOL v10 = v14 == v12 && v15 == v13;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:totalUnitCount:completedUnitCount:", self->_identifier, self->_totalUnitCount, self->_completedUnitCount);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_components allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addComponent:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)debugDescription
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  [(_LTAssetProgress *)self _fastReadTotal:&v12 completed:&v11];
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_components count])
  {
    unint64_t v3 = [(NSMutableDictionary *)self->_components debugDescription];
  }
  else
  {
    unint64_t v3 = &stru_26FAADE68;
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)v6;
  if (v12) {
    double v8 = (double)v11 / (double)v12;
  }
  else {
    double v8 = 0.0;
  }
  objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; %@ [%zd / %zd : %.02f] %@>",
    v6,
    self,
    self->_identifier,
    v11,
    v12,
    *(void *)&v8,
  uint64_t v9 = v3);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)componentFilter
{
  return self->_componentFilter;
}

- (void)setComponentFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierPrefix, 0);
  objc_storeStrong((id *)&self->_componentFilter, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOfflineState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance with components cannot have offline state updated directly %{public}@", v2, v3, v4, v5, v6);
}

- (void)addComponent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance cannot set nil components %{public}@", v2, v3, v4, v5, v6);
}

- (void)addComponent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance cannot set itself as a component %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeComponent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance cannot remove nil components %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance with components cannot have total unit count updated directly %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_24639B000, v0, OS_LOG_TYPE_ERROR, "Total count cannot be 0: %zd", v1, 0xCu);
}

- (void)updateTotalUnitCount:completedUnitCount:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_24639B000, v1, OS_LOG_TYPE_ERROR, "Completed count outside of range 0...%zd: %zd", v2, 0x16u);
}

- (void)updatePercentComplete:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24639B000, v0, v1, "Progress instance with components cannot have percent completion updated directly %{public}@", v2, v3, v4, v5, v6);
}

- (void)updatePercentComplete:(os_log_t)log .cold.2(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Percent completion outside of range 0.0...1.0: %f", (uint8_t *)&v2, 0xCu);
}

@end