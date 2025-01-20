@interface DBHomeKitCharacteristic
+ (id)chacteristicWithService:(id)a3 characteristic:(id)a4;
+ (id)characteristicFormat;
+ (id)characteristicFormats;
+ (id)registeredCharacteristicClasses;
+ (void)load;
+ (void)registerCharacteristicClass:(Class)a3;
- (BOOL)_lock_setError:(id)a3;
- (BOOL)current;
- (BOOL)hasError;
- (BOOL)hidden;
- (BOOL)notifies;
- (BOOL)pendingRead;
- (BOOL)pendingWrite;
- (BOOL)readable;
- (BOOL)usable;
- (BOOL)writable;
- (DBHome)home;
- (DBHomeKitCharacteristic)initWithService:(id)a3 characteristic:(id)a4;
- (DBHomeKitService)service;
- (HMCharacteristic)characteristic;
- (NSError)error;
- (NSString)description;
- (NSString)format;
- (NSString)name;
- (NSString)stateDescription;
- (NSUUID)uniqueIdentifier;
- (double)distance;
- (id)cachedValue;
- (id)pendingValue;
- (id)value;
- (os_unfair_lock_s)valueLock;
- (unint64_t)_locked_State;
- (unint64_t)state;
- (unint64_t)transactionId;
- (void)_didUpdate;
- (void)_readValueCompletionTransactionID:(unint64_t)a3 error:(id)a4;
- (void)setCachedValue:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFormatedValue:(id)a3;
- (void)setPendingValue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransactionId:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueLock:(os_unfair_lock_s)a3;
- (void)updateValueRequiringRead:(BOOL)a3;
@end

@implementation DBHomeKitCharacteristic

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[DBHomeKitCharacteristic registerCharacteristicClass:v3];
  }
}

+ (void)registerCharacteristicClass:(Class)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (registerCharacteristicClass__onceToken != -1) {
    dispatch_once(&registerCharacteristicClass__onceToken, &__block_literal_global_14);
  }
  id v4 = (id)_registeredCharacteristicClasses;
  objc_sync_enter(v4);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(objc_class *)a3 characteristicFormats];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [(id)_registeredCharacteristicClasses setObject:a3 forKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

uint64_t __55__DBHomeKitCharacteristic_registerCharacteristicClass___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _registeredCharacteristicClasses;
  _registeredCharacteristicClasses = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)registeredCharacteristicClasses
{
  id v2 = (id)_registeredCharacteristicClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredCharacteristicClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (id)chacteristicWithService:(id)a3 characteristic:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[DBHomeKitCharacteristicTypes characteristicNameByType];
  v8 = [v5 characteristicType];
  long long v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    long long v9 = [v5 characteristicType];
  }
  long long v10 = +[DBHomeKitCharacteristic registeredCharacteristicClasses];
  long long v11 = (objc_class *)[v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    long long v12 = +[DBHomeKitCharacteristic registeredCharacteristicClasses];
    v13 = [v5 metadata];
    uint64_t v14 = [v13 format];
    long long v11 = (objc_class *)[v12 objectForKeyedSubscript:v14];

    if (!v11) {
      long long v11 = (objc_class *)objc_opt_class();
    }
  }
  v15 = (void *)[[v11 alloc] initWithService:v6 characteristic:v5];

  return v15;
}

- (DBHomeKitCharacteristic)initWithService:(id)a3 characteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DBHomeKitCharacteristic;
  v8 = [(DBHomeKitCharacteristic *)&v11 init];
  long long v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_characteristic, a4);
    v9->_state = 5;
    [(DBHomeKitCharacteristic *)v9 updateValueRequiringRead:1];
  }

  return v9;
}

- (id)value
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  if ([(DBHomeKitCharacteristic *)self state] > 2) {
    [(DBHomeKitCharacteristic *)self pendingValue];
  }
  else {
  id v4 = [(DBHomeKitCharacteristic *)self cachedValue];
  }
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  if ([(DBHomeKitCharacteristic *)self writable])
  {
    id v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DBHomeKitCharacteristic setValue:]();
    }

    os_unfair_lock_lock(&self->_valueLock);
    [(DBHomeKitCharacteristic *)self setState:4];
    [(DBHomeKitCharacteristic *)self setPendingValue:v4];
    [(DBHomeKitCharacteristic *)self setTransactionId:[(DBHomeKitCharacteristic *)self transactionId] + 1];
    os_unfair_lock_unlock(&self->_valueLock);
    [(DBHomeKitCharacteristic *)self _didUpdate];
    objc_initWeak(&location, self);
    id v6 = [(DBHomeKitCharacteristic *)self home];
    id v7 = [(DBHomeKitCharacteristic *)self characteristic];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__DBHomeKitCharacteristic_setValue___block_invoke;
    v8[3] = &unk_2649B56E8;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v6 _setValue:v9 forCharacteristic:v7 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __36__DBHomeKitCharacteristic_setValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setError:v3];
  id v5 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543874;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_debug_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ setValue completion: %{public}@ error=<%{public}@>", (uint8_t *)&v7, 0x20u);
  }

  [WeakRetained updateValueRequiringRead:0];
}

- (void)_didUpdate
{
  id v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__DBHomeKitCharacteristic__didUpdate__block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(v3, block);
}

void __37__DBHomeKitCharacteristic__didUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) service];
  [v2 _characteristicDidUpdate:*(void *)(a1 + 32)];
}

- (DBHome)home
{
  id v2 = [(DBHomeKitCharacteristic *)self service];
  id v3 = [v2 home];

  return (DBHome *)v3;
}

- (BOOL)current
{
  return [(DBHomeKitCharacteristic *)self _locked_State] == 2;
}

- (BOOL)pendingWrite
{
  return [(DBHomeKitCharacteristic *)self _locked_State] == 4;
}

- (BOOL)pendingRead
{
  return [(DBHomeKitCharacteristic *)self _locked_State] == 3;
}

- (unint64_t)_locked_State
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v4 = [(DBHomeKitCharacteristic *)self state];
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (BOOL)hasError
{
  id v2 = [(DBHomeKitCharacteristic *)self error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSError)error
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v4 = (void *)[(NSError *)self->_error copy];
  os_unfair_lock_unlock(p_valueLock);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  p_valueLock = &self->_valueLock;
  id v5 = a3;
  os_unfair_lock_lock(p_valueLock);
  [(DBHomeKitCharacteristic *)self _lock_setError:v5];

  os_unfair_lock_unlock(p_valueLock);
}

- (BOOL)_lock_setError:(id)a3
{
  id v5 = a3;
  p_error = &self->_error;
  char v7 = BSEqualObjects();
  if ((v7 & 1) == 0) {
    objc_storeStrong((id *)p_error, a3);
  }

  return v7 ^ 1;
}

- (void)updateValueRequiringRead:(BOOL)a3
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  if (!a3 && !self->_error)
  {
    id v12 = [(DBHomeKitCharacteristic *)self characteristic];
    uint64_t v13 = [v12 value];

    if (v13)
    {
      uint64_t v14 = [(DBHomeKitCharacteristic *)self characteristic];
      v15 = [v14 value];
      [(DBHomeKitCharacteristic *)self setCachedValue:v15];

      [(DBHomeKitCharacteristic *)self setPendingValue:0];
      [(DBHomeKitCharacteristic *)self setState:2];
      os_unfair_lock_unlock(p_valueLock);
      [(DBHomeKitCharacteristic *)self _didUpdate];
      goto LABEL_14;
    }
  }
  if ([(DBHomeKitCharacteristic *)self state] == 3)
  {
    os_unfair_lock_unlock(p_valueLock);
LABEL_14:
    v16 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[DBHomeKitCharacteristic updateValueRequiringRead:]();
    }

    return;
  }
  unint64_t v6 = [(DBHomeKitCharacteristic *)self state];
  if (v6 <= 2)
  {
    char v7 = [(DBHomeKitCharacteristic *)self characteristic];
    id v8 = [v7 value];
    [(DBHomeKitCharacteristic *)self setPendingValue:v8];

    [(DBHomeKitCharacteristic *)self setState:3];
  }
  __int16 v9 = (void *)([(DBHomeKitCharacteristic *)self transactionId] + 1);
  [(DBHomeKitCharacteristic *)self setTransactionId:v9];
  os_unfair_lock_unlock(p_valueLock);
  if (v6 < 3) {
    [(DBHomeKitCharacteristic *)self _didUpdate];
  }
  uint64_t v10 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DBHomeKitCharacteristic updateValueRequiringRead:]();
  }

  objc_initWeak(&location, self);
  __int16 v11 = [(DBHomeKitCharacteristic *)self characteristic];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__DBHomeKitCharacteristic_updateValueRequiringRead___block_invoke;
  v17[3] = &unk_2649B5710;
  objc_copyWeak(v18, &location);
  v18[1] = v9;
  [v11 readValueWithCompletionHandler:v17];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __52__DBHomeKitCharacteristic_updateValueRequiringRead___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _readValueCompletionTransactionID:*(void *)(a1 + 40) error:v4];
}

- (void)_readValueCompletionTransactionID:(unint64_t)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v7 = [(DBHomeKitCharacteristic *)self transactionId];
  if (v7 == a3)
  {
    id v8 = [(DBHomeKitCharacteristic *)self characteristic];
    __int16 v9 = [v8 value];
    [(DBHomeKitCharacteristic *)self setCachedValue:v9];

    [(DBHomeKitCharacteristic *)self setPendingValue:0];
    [(DBHomeKitCharacteristic *)self setState:2];
    os_unfair_lock_unlock(&self->_valueLock);
    uint64_t v10 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[DBHomeKitCharacteristic _readValueCompletionTransactionID:error:]();
    }

    [(DBHomeKitCharacteristic *)self _didUpdate];
  }
  else
  {
    unint64_t v11 = v7;
    os_unfair_lock_unlock(&self->_valueLock);
    id v12 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138543874;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = v11;
      _os_log_debug_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: transactionID %lu != %lu", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (NSString)format
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() characteristicFormat];
  id v5 = [(DBHomeKitCharacteristic *)self characteristic];
  id v6 = [v5 metadata];
  unint64_t v7 = [v6 format];
  id v8 = [v3 stringWithFormat:@"%@-%@", v4, v7];

  return (NSString *)v8;
}

- (BOOL)notifies
{
  id v2 = [(DBHomeKitCharacteristic *)self characteristic];
  BOOL v3 = [v2 properties];
  char v4 = [v3 containsObject:*MEMORY[0x263F0BEE8]];

  return v4;
}

- (BOOL)readable
{
  id v2 = [(DBHomeKitCharacteristic *)self characteristic];
  BOOL v3 = [v2 properties];
  char v4 = [v3 containsObject:*MEMORY[0x263F0BED8]];

  return v4;
}

- (BOOL)writable
{
  id v2 = [(DBHomeKitCharacteristic *)self characteristic];
  BOOL v3 = [v2 properties];
  char v4 = [v3 containsObject:*MEMORY[0x263F0BEF0]];

  return v4;
}

- (BOOL)hidden
{
  id v2 = [(DBHomeKitCharacteristic *)self characteristic];
  BOOL v3 = [v2 properties];
  char v4 = [v3 containsObject:*MEMORY[0x263F0BED0]];

  return v4;
}

- (NSString)description
{
  v67[3] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v49 = [(DBHomeKitCharacteristic *)self state];
  unint64_t v51 = [(DBHomeKitCharacteristic *)self transactionId];
  char v4 = NSString;
  id v5 = [(DBHomeKitCharacteristic *)self characteristic];
  id v6 = [v5 value];
  unint64_t v7 = [v4 stringWithFormat:@"V:%@", v6];
  v67[0] = v7;
  id v8 = NSString;
  __int16 v9 = [(DBHomeKitCharacteristic *)self cachedValue];
  uint64_t v10 = [v8 stringWithFormat:@"C:%@", v9];
  v67[1] = v10;
  unint64_t v11 = NSString;
  id v12 = [(DBHomeKitCharacteristic *)self pendingValue];
  int v13 = [v11 stringWithFormat:@"P:%@", v12];
  v67[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
  v65 = v3;
  [v3 addObjectsFromArray:v14];

  v64 = (void *)[(NSError *)self->_error copy];
  os_unfair_lock_unlock(&self->_valueLock);
  os_unfair_lock_t lock = [(DBHomeKitCharacteristic *)self name];
  v66[0] = lock;
  __int16 v15 = NSString;
  v62 = [(DBHomeKitCharacteristic *)self uniqueIdentifier];
  v61 = [v15 stringWithFormat:@"uniqueIdentifier=%@", v62];
  v66[1] = v61;
  unint64_t v16 = NSString;
  uint64_t v17 = [(DBHomeKitCharacteristic *)self service];
  v59 = [(DBHomeKitCharacteristic *)self service];
  v58 = [v59 uniqueIdentifier];
  v60 = (void *)v17;
  v57 = [v16 stringWithFormat:@"service=(%p)%@", v17, v58];
  v66[2] = v57;
  unint64_t v18 = NSString;
  uint64_t v19 = [(DBHomeKitCharacteristic *)self home];
  v55 = [(DBHomeKitCharacteristic *)self home];
  v54 = [v55 uniqueIdentifier];
  v56 = (void *)v19;
  v53 = [v18 stringWithFormat:@"home=(%p)%@", v19, v54];
  v66[3] = v53;
  if (v49 - 1 > 5) {
    v20 = @"Initialization";
  }
  else {
    v20 = off_2649B5730[v49 - 1];
  }
  v52 = [NSString stringWithFormat:@"state=%@(%lu)", v20, v51];
  v66[4] = v52;
  v21 = NSString;
  v50 = [(DBHomeKitCharacteristic *)self formatedValue];
  v48 = [v21 stringWithFormat:@"formatedValue=\"%@\"", v50];
  v66[5] = v48;
  v22 = NSString;
  v47 = [v65 componentsJoinedByString:@" "];
  v46 = [v22 stringWithFormat:@"value=[%@]", v47];
  v66[6] = v46;
  v23 = NSString;
  v24 = [(DBHomeKitCharacteristic *)self format];
  v25 = [v23 stringWithFormat:@"format=%@", v24];
  v66[7] = v25;
  v26 = NSString;
  if ([(DBHomeKitCharacteristic *)self notifies]) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  v28 = [v26 stringWithFormat:@"notifies=%@", v27];
  v66[8] = v28;
  v29 = NSString;
  if ([(DBHomeKitCharacteristic *)self readable]) {
    v30 = @"YES";
  }
  else {
    v30 = @"NO";
  }
  v31 = [v29 stringWithFormat:@"readable=%@", v30];
  v66[9] = v31;
  v32 = NSString;
  if ([(DBHomeKitCharacteristic *)self writable]) {
    v33 = @"YES";
  }
  else {
    v33 = @"NO";
  }
  v34 = [v32 stringWithFormat:@"writable=%@", v33];
  v66[10] = v34;
  v35 = NSString;
  if ([(DBHomeKitCharacteristic *)self hidden]) {
    v36 = @"YES";
  }
  else {
    v36 = @"NO";
  }
  v37 = [v35 stringWithFormat:@"hidden=%@", v36];
  v66[11] = v37;
  v38 = [NSString stringWithFormat:@"error=%@", v64];
  v66[12] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:13];

  v40 = NSString;
  uint64_t v41 = objc_opt_class();
  v42 = [(DBHomeKitCharacteristic *)self characteristic];
  v43 = [v39 componentsJoinedByString:@" "];
  v44 = [v40 stringWithFormat:@"<%@: %p(%p) %@>", v41, self, v42, v43];

  return (NSString *)v44;
}

+ (id)characteristicFormat
{
  return @"generic";
}

+ (id)characteristicFormats
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [a1 characteristicFormat];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  id v2 = [(DBHomeKitCharacteristic *)self characteristic];
  BOOL v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)name
{
  BOOL v3 = +[DBHomeKitCharacteristicTypes characteristicNameByType];
  char v4 = [(DBHomeKitCharacteristic *)self characteristic];
  id v5 = [v4 characteristicType];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(DBHomeKitCharacteristic *)self characteristic];
    id v7 = [v8 characteristicType];
  }
  return (NSString *)v7;
}

- (BOOL)usable
{
  if ([(DBHomeKitCharacteristic *)self hidden]) {
    return 0;
  }
  char v4 = +[DBHomeKitCharacteristicTypes characteristicNameByType];
  id v5 = [(DBHomeKitCharacteristic *)self characteristic];
  id v6 = [v5 characteristicType];
  id v7 = [v4 objectForKeyedSubscript:v6];
  BOOL v3 = v7 != 0;

  return v3;
}

- (NSString)stateDescription
{
  v26[3] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v23 = [(DBHomeKitCharacteristic *)self state];
  unint64_t v24 = [(DBHomeKitCharacteristic *)self transactionId];
  char v4 = NSString;
  id v5 = [(DBHomeKitCharacteristic *)self characteristic];
  id v6 = [v5 value];
  id v7 = [v4 stringWithFormat:@"V:%@", v6];
  v26[0] = v7;
  id v8 = NSString;
  __int16 v9 = [(DBHomeKitCharacteristic *)self cachedValue];
  uint64_t v10 = [v8 stringWithFormat:@"C:%@", v9];
  v26[1] = v10;
  unint64_t v11 = NSString;
  id v12 = [(DBHomeKitCharacteristic *)self pendingValue];
  int v13 = [v11 stringWithFormat:@"P:%@", v12];
  v26[2] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  v25 = v3;
  [v3 addObjectsFromArray:v14];

  __int16 v15 = (void *)[(NSError *)self->_error copy];
  os_unfair_lock_unlock(&self->_valueLock);
  unint64_t v16 = NSString;
  uint64_t v17 = [(DBHomeKitCharacteristic *)self name];
  unint64_t v18 = [(DBHomeKitCharacteristic *)self formatedValue];
  if (v23 - 1 > 5) {
    uint64_t v19 = @"Initialization";
  }
  else {
    uint64_t v19 = off_2649B5730[v23 - 1];
  }
  v20 = [v25 componentsJoinedByString:@" "];
  v21 = [v16 stringWithFormat:@"%@=%@ (%@ transactionID=%lu error=%@ values=[%@])", v17, v18, v19, v24, v15, v20];

  return (NSString *)v21;
}

- (double)distance
{
  id v2 = [(DBHomeKitCharacteristic *)self home];
  [v2 distance];
  double v4 = v3;

  return v4;
}

- (void)setFormatedValue:(id)a3
{
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (DBHomeKitService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (DBHomeKitService *)WeakRetained;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
}

- (os_unfair_lock_s)valueLock
{
  return self->_valueLock;
}

- (void)setValueLock:(os_unfair_lock_s)a3
{
  self->_valueLock = a3;
}

- (id)cachedValue
{
  return self->_cachedValue;
}

- (void)setCachedValue:(id)a3
{
}

- (id)pendingValue
{
  return self->_pendingValue;
}

- (void)setPendingValue:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(unint64_t)a3
{
  self->_transactionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingValue, 0);
  objc_storeStrong(&self->_cachedValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong(&self->_formatedValue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)setValue:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ setValue: %{public}@");
}

- (void)updateValueRequiringRead:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ (requireRead=%@) skipping");
}

- (void)updateValueRequiringRead:.cold.2()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "%{public}@ (requireRead=%@) readValue");
}

- (void)_readValueCompletionTransactionID:error:.cold.1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_1();
  uint64_t v4 = 0;
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_22D6F0000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: value=%{public}@ error=<%{public}@>", v3, 0x20u);
}

@end