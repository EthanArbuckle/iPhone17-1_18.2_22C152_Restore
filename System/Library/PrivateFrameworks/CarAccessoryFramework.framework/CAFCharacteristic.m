@interface CAFCharacteristic
+ (id)characteristicFormats;
+ (id)characteristicWithService:(id)a3 config:(id)a4;
+ (id)observerProtocol;
+ (id)primaryCharacteristicFormat;
+ (id)registeredCharacteristicClasses;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
+ (void)registerCharacteristicClass:(Class)a3;
- (BOOL)_lock_setError:(id)a3;
- (BOOL)hasError;
- (BOOL)hasErrorState;
- (BOOL)hasInitialValue;
- (BOOL)hasLargePayload;
- (BOOL)hidden;
- (BOOL)initializationFinished;
- (BOOL)isCurrent;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitializing;
- (BOOL)isInvalid;
- (BOOL)isMutable;
- (BOOL)isNotificationEnabled;
- (BOOL)isRestricted;
- (BOOL)readable;
- (BOOL)setCachedValueIfAvailableForGroupUpdate:(BOOL)a3;
- (BOOL)shouldInitialize;
- (BOOL)supportsDisable;
- (BOOL)supportsError;
- (BOOL)supportsInvalid;
- (BOOL)supportsNotifier;
- (BOOL)supportsRestricted;
- (BOOL)supportsStates;
- (BOOL)usable;
- (BOOL)writable;
- (CAFAccessory)accessory;
- (CAFCachedDescription)cachedDescription;
- (CAFCar)car;
- (CAFCharacteristic)initWithService:(id)a3 config:(id)a4;
- (CAFCharacteristicMetadata)metaData;
- (CAFCharacteristicValue)characteristicValue;
- (CAFService)service;
- (CARObserverHashTable)observers;
- (Class)baseCAFClass;
- (NSArray)comparisonKeys;
- (NSError)error;
- (NSNumber)disabledInstanceID;
- (NSNumber)errorInstanceID;
- (NSNumber)instanceID;
- (NSNumber)notifierInstanceID;
- (NSNumber)notifierValue;
- (NSNumber)priority;
- (NSNumber)restrictedInstanceID;
- (NSString)baseFormat;
- (NSString)characteristicType;
- (NSString)description;
- (NSString)format;
- (NSString)formattedValue;
- (NSString)fullDescription;
- (NSString)typeName;
- (NSUUID)uniqueIdentifier;
- (id)allInstanceIDs;
- (id)cachedValue;
- (id)currentDescriptionForCache:(id)a3;
- (id)decodeValue:(id)a3 error:(id *)a4;
- (id)descriptionExtras;
- (id)encodeValue:(id)a3 error:(id *)a4;
- (id)pendingValue;
- (id)pluginID;
- (id)propertiesDescription;
- (id)readInstanceIDs;
- (id)registrationInstanceIDs;
- (id)value;
- (int64_t)compare:(id)a3;
- (os_unfair_lock_s)valueLock;
- (unint64_t)hash;
- (unint64_t)lastState;
- (unint64_t)lockState;
- (unint64_t)state;
- (unint64_t)transactionId;
- (void)_didUpdateFromGroupUpdate:(BOOL)a3;
- (void)_readValueCompletionTransactionID:(unint64_t)a3 error:(id)a4;
- (void)_updateStateIfNeeded;
- (void)dealloc;
- (void)groupInitializationRequested;
- (void)handleError:(id)a3 value:(id)a4;
- (void)handleRegistrationWithInstanceID:(id)a3 registered:(BOOL)a4;
- (void)handleRegistrationWithInstanceID:(id)a3 value:(id)a4 registered:(BOOL)a5;
- (void)handleUpdateWithInstanceID:(id)a3 value:(id)a4;
- (void)handleValueAndError:(id)a3 value:(id)a4;
- (void)handleWrite:(id)a3 value:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setCachedDescription:(id)a3;
- (void)setCachedValue:(id)a3;
- (void)setCharacteristicValue:(id)a3;
- (void)setError:(id)a3;
- (void)setHasErrorState:(BOOL)a3;
- (void)setInitializationFinished:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsNotificationEnabled:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setLastState:(unint64_t)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setNotifierValue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPendingValue:(id)a3;
- (void)setTransactionId:(unint64_t)a3;
- (void)setTypeName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueLock:(os_unfair_lock_s)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateValueRequiringRead:(BOOL)a3;
@end

@implementation CAFCharacteristic

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[CAFCharacteristic registerCharacteristicClass:v3];
  }
}

+ (void)registerCharacteristicClass:(Class)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (registerCharacteristicClass__onceToken != -1) {
    dispatch_once(&registerCharacteristicClass__onceToken, &__block_literal_global_16);
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

uint64_t __49__CAFCharacteristic_registerCharacteristicClass___block_invoke()
{
  _registeredCharacteristicClasses = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)registeredCharacteristicClasses
{
  id v2 = (id)_registeredCharacteristicClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredCharacteristicClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (id)characteristicWithService:(id)a3 config:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[CAFCarConfiguration getType:v5];
  v8 = +[CAFCharacteristic registeredCharacteristicClasses];
  long long v9 = (objc_class *)[v8 objectForKeyedSubscript:v7];

  if (!v9)
  {
    long long v10 = [v5 objectForKeyedSubscript:@"format"];
    long long v11 = NSStringFromCharacteristicMetadataFormat((int)[v10 intValue]);

    if (!v11
      || (+[CAFCharacteristic registeredCharacteristicClasses](CAFCharacteristic, "registeredCharacteristicClasses"), v12 = objc_claimAutoreleasedReturnValue(), long long v9 = (objc_class *)[v12 objectForKeyedSubscript:v11], v12, v11, !v9))
    {
      long long v9 = (objc_class *)objc_opt_class();
    }
  }
  v13 = (void *)[[v9 alloc] initWithService:v6 config:v5];

  return v13;
}

- (CAFCharacteristic)initWithService:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)CAFCharacteristic;
  v8 = [(CAFCharacteristic *)&v58 init];
  long long v9 = v8;
  if (!v8) {
    goto LABEL_52;
  }
  v8->_valueLock._os_unfair_lock_opaque = 0;
  objc_storeWeak((id *)&v8->_service, v6);
  objc_opt_class();
  id v10 = [v7 objectForKeyedSubscript:@"iid"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    long long v11 = (NSNumber *)v10;
  }
  else {
    long long v11 = 0;
  }

  instanceID = v9->_instanceID;
  v9->_instanceID = v11;

  objc_opt_class();
  id v13 = [v7 objectForKeyedSubscript:@"iidError"];
  if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v14 = (NSNumber *)v13;
  }
  else {
    uint64_t v14 = 0;
  }

  errorInstanceID = v9->_errorInstanceID;
  v9->_errorInstanceID = v14;

  objc_opt_class();
  id v16 = [v7 objectForKeyedSubscript:@"iidDisabled"];
  if (v16 && (objc_opt_isKindOfClass() & 1) != 0) {
    v17 = (NSNumber *)v16;
  }
  else {
    v17 = 0;
  }

  disabledInstanceID = v9->_disabledInstanceID;
  v9->_disabledInstanceID = v17;

  objc_opt_class();
  id v19 = [v7 objectForKeyedSubscript:@"iidNotifier"];
  if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
    v20 = (NSNumber *)v19;
  }
  else {
    v20 = 0;
  }

  notifierInstanceID = v9->_notifierInstanceID;
  v9->_notifierInstanceID = v20;

  objc_opt_class();
  id v22 = [v7 objectForKeyedSubscript:@"iidRestricted"];
  if (v22 && (objc_opt_isKindOfClass() & 1) != 0) {
    v23 = (NSNumber *)v22;
  }
  else {
    v23 = 0;
  }

  restrictedInstanceID = v9->_restrictedInstanceID;
  v9->_restrictedInstanceID = v23;

  if (!v9->_instanceID)
  {
    v37 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CAFCharacteristic initWithService:config:](v6);
    }
    goto LABEL_31;
  }
  uint64_t v25 = +[CAFCarConfiguration getType:v7];
  characteristicType = v9->_characteristicType;
  v9->_characteristicType = (NSString *)v25;

  if (!v9->_characteristicType)
  {
    v37 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CAFCharacteristic initWithService:config:](v6);
    }
LABEL_31:

    goto LABEL_32;
  }
  v27 = [v6 pluginID];
  uint64_t v28 = +[CAFCarConfiguration getUUID:v27 instanceID:v9->_instanceID];
  uniqueIdentifier = v9->_uniqueIdentifier;
  v9->_uniqueIdentifier = (NSUUID *)v28;

  uint64_t v30 = +[CAFCharacteristicTypes characteristicNameForType:v9->_characteristicType];
  typeName = v9->_typeName;
  v9->_typeName = (NSString *)v30;

  v32 = [v7 objectForKeyedSubscript:@"initialValue"];
  if (v32)
  {
    v9->_hasInitialValue = 1;
    v33 = [MEMORY[0x263EFF9D0] null];
    int v34 = [v32 isEqual:v33];

    v35 = [CAFCharacteristicValue alloc];
    if (v34) {
      v36 = 0;
    }
    else {
      v36 = v32;
    }
    uint64_t v39 = [(CAFCharacteristicValue *)v35 initWithValue:v36 error:0];
    characteristicValue = v9->_characteristicValue;
    v9->_characteristicValue = (CAFCharacteristicValue *)v39;
  }
  v41 = [[CAFCharacteristicMetadata alloc] initWithConfig:v7];
  metaData = v9->_metaData;
  v9->_metaData = v41;

  if (v9->_metaData)
  {
    v9->_writable = +[CAFCarConfiguration getBoolean:v7 key:@"writable"];
    v9->_isMutable = +[CAFCarConfiguration getBoolean:v7 key:@"mutable"];
    objc_opt_class();
    id v43 = [v7 objectForKeyedSubscript:@"priority"];
    if (v43 && (objc_opt_isKindOfClass() & 1) != 0) {
      v44 = (NSNumber *)v43;
    }
    else {
      v44 = 0;
    }

    priority = v9->_priority;
    v9->_priority = v44;

    v9->_hasLargePayload = +[CAFCarConfiguration getBoolean:v7 key:@"largePayload"];
    v9->_supportsInvalid = +[CAFCarConfiguration getBoolean:v7 key:@"supportsInvalid"];
    v9->_isNotificationEnabled = 0;
    v46 = [(CAFCharacteristic *)v9 car];
    v47 = [v46 carManager];
    v9->_shouldInitialize = [v47 shouldInitializeCharacteristic:v9];

    id v48 = objc_alloc(MEMORY[0x263F30E18]);
    v49 = [(id)objc_opt_class() observerProtocol];
    uint64_t v50 = [v48 initWithProtocol:v49];
    observers = v9->_observers;
    v9->_observers = (CARObserverHashTable *)v50;

    v52 = [[CAFCachedDescription alloc] initWithCacheable:v9];
    cachedDescription = v9->_cachedDescription;
    v9->_cachedDescription = v52;

    [(CAFCharacteristic *)v9 setCachedValueIfAvailableForGroupUpdate:0];
    if (v9->_shouldInitialize)
    {
      if (![(CAFCharacteristic *)v9 shouldDeferInitialization])
      {
LABEL_51:

LABEL_52:
        v38 = v9;
        goto LABEL_53;
      }
      v54 = CAFCharacteristicLogging();
      uint64_t v55 = 2;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        -[CAFCharacteristic initWithService:config:].cold.5();
        uint64_t v55 = 2;
      }
    }
    else
    {
      v54 = CAFCharacteristicLogging();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
        -[CAFCharacteristic initWithService:config:].cold.4();
      }
      uint64_t v55 = 1;
    }

    os_unfair_lock_lock(&v9->_valueLock);
    [(CAFCharacteristic *)v9 setLockState:v55];
    os_unfair_lock_unlock(&v9->_valueLock);
    [(CAFCharacteristic *)v9 _didUpdateFromGroupUpdate:0];
    goto LABEL_51;
  }
  v56 = CAFCharacteristicLogging();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    -[CAFCharacteristic initWithService:config:](v6);
  }

LABEL_32:
  v38 = 0;
LABEL_53:

  return v38;
}

- (void)dealloc
{
  uint64_t v3 = [(CAFCharacteristic *)self car];
  [v3 enableNotificationForCharacteristic:self enable:0 response:0];

  v4.receiver = self;
  v4.super_class = (Class)CAFCharacteristic;
  [(CAFCharacteristic *)&v4 dealloc];
}

- (unint64_t)hash
{
  id v2 = [(CAFCharacteristic *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (CAFCharacteristic *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CAFCharacteristic *)v4 uniqueIdentifier];
      id v6 = [(CAFCharacteristic *)self uniqueIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (CAFCar)car
{
  id v2 = [(CAFCharacteristic *)self accessory];
  unint64_t v3 = [v2 car];

  return (CAFCar *)v3;
}

- (CAFAccessory)accessory
{
  id v2 = [(CAFCharacteristic *)self service];
  unint64_t v3 = [v2 accessory];

  return (CAFAccessory *)v3;
}

- (BOOL)isCurrent
{
  id v2 = self;
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  LOBYTE(v2) = CAFCharacteristicStateIsCurrent([(CAFCharacteristic *)v2 lockState]);
  os_unfair_lock_unlock(p_valueLock);
  return (char)v2;
}

- (BOOL)isInitializing
{
  if ([(CAFCharacteristic *)self initializationFinished]) {
    return 0;
  }
  os_unfair_lock_lock(&self->_valueLock);
  char IsInitializing = CAFCharacteristicStateIsInitializing([(CAFCharacteristic *)self lockState]);
  if ((IsInitializing & 1) == 0) {
    [(CAFCharacteristic *)self setInitializationFinished:1];
  }
  os_unfair_lock_unlock(&self->_valueLock);
  return IsInitializing;
}

- (id)value
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  if ([(CAFCharacteristic *)self lockState] > 3) {
    [(CAFCharacteristic *)self pendingValue];
  }
  else {
  objc_super v4 = [(CAFCharacteristic *)self cachedValue];
  }
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)setValue:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CAFCharacteristic *)self writable])
  {
    if ([(CAFCharacteristic *)self isDisabled])
    {
      id v5 = CAFCharacteristicLogging();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CAFCharacteristic setValue:]();
      }
      goto LABEL_19;
    }
    BOOL v7 = [(CAFCharacteristic *)self isInitializing];
    id v5 = CAFCharacteristicLogging();
    BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v8) {
        -[CAFCharacteristic setValue:]();
      }
      goto LABEL_19;
    }
    if (v8) {
      -[CAFCharacteristic setValue:]();
    }

    long long v9 = CARSignpostLogForCategory();
    if (self)
    {
      id v10 = CARSignpostLogForCategory();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_18:

        os_unfair_lock_lock(&self->_valueLock);
        [(CAFCharacteristic *)self setLockState:5];
        id v19 = 0;
        id v5 = [(CAFCharacteristic *)self encodeValue:v4 error:&v19];
        id v15 = v19;
        [(CAFCharacteristic *)self _lock_setError:v15];
        [(CAFCharacteristic *)self setPendingValue:v4];
        [(CAFCharacteristic *)self setTransactionId:[(CAFCharacteristic *)self transactionId] + 1];
        os_unfair_lock_unlock(&self->_valueLock);
        [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
        objc_initWeak((id *)buf, self);
        id v16 = [(CAFCharacteristic *)self car];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __30__CAFCharacteristic_setValue___block_invoke;
        v17[3] = &unk_265264B10;
        objc_copyWeak(&v18, (id *)buf);
        [v16 writeCharacteristic:self value:v5 response:v17];

        objc_destroyWeak(&v18);
        objc_destroyWeak((id *)buf);

        goto LABEL_19;
      }
    }
    else
    {
      os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v9))
    {
      long long v12 = [(CAFCharacteristic *)self name];
      id v13 = [(CAFCharacteristic *)self pluginID];
      uint64_t v14 = [(CAFCharacteristic *)self instanceID];
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      __int16 v22 = 2114;
      v23 = v13;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_249710000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Set", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  id v6 = objc_msgSend(MEMORY[0x263F087E8], "CAF_writeToReadonlyError");
  [(CAFCharacteristic *)self setError:v6];

  id v5 = CAFCharacteristicLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CAFCharacteristic setValue:].cold.4();
  }
LABEL_19:
}

void __30__CAFCharacteristic_setValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained instanceID];
  [WeakRetained handleWrite:v5 value:v3];

  id v6 = CARSignpostLogForCategory();
  if (WeakRetained)
  {
    BOOL v7 = CARSignpostLogForCategory();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, WeakRetained);

    if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)long long v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_249710000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Set", (const char *)&unk_2497DFEC6, v9, 2u);
  }
LABEL_7:
}

- (void)groupInitializationRequested
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ groupInitializationRequested", v2, v3, v4, v5, v6);
}

- (BOOL)setCachedValueIfAvailableForGroupUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(CAFCharacteristic *)self characteristicValue];

  if (v5)
  {
    uint8_t v6 = [(CAFCharacteristic *)self characteristicValue];
    if (v6)
    {
      BOOL v7 = [(CAFCharacteristic *)self characteristicValue];
      os_signpost_id_t v8 = [v7 value];
      id v14 = 0;
      long long v9 = [(CAFCharacteristic *)self decodeValue:v8 error:&v14];
      id v10 = v14;
    }
    else
    {
      long long v9 = 0;
      id v10 = 0;
    }

    os_signpost_id_t v11 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"YES";
      *(_DWORD *)buf = 138543874;
      id v16 = self;
      __int16 v17 = 2112;
      if (!v9) {
        id v13 = @"NO";
      }
      id v18 = v13;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_249710000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ value set %@ decodeError=%@", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_valueLock);
    [(CAFCharacteristic *)self setCachedValue:v9];
    [(CAFCharacteristic *)self setPendingValue:0];
    [(CAFCharacteristic *)self setLockState:3];
    [(CAFCharacteristic *)self _lock_setError:v10];
    [(CAFCharacteristic *)self setTransactionId:[(CAFCharacteristic *)self transactionId] + 1];
    os_unfair_lock_unlock(&self->_valueLock);
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:v3];
  }
  else
  {
    id v10 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CAFCharacteristic setCachedValueIfAvailableForGroupUpdate:]();
    }
  }

  return v5 != 0;
}

- (NSString)formattedValue
{
  uint64_t v2 = [(CAFCharacteristic *)self value];
  BOOL v3 = [v2 description];
  uint64_t v4 = v3;
  if (!v3) {
    BOOL v3 = @"(null)";
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)isInvalid
{
  uint64_t v2 = [(CAFCharacteristic *)self cachedValue];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)hasError
{
  uint64_t v2 = [(CAFCharacteristic *)self error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSError)error
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  uint64_t v4 = (void *)[(NSError *)self->_error copy];
  os_unfair_lock_unlock(p_valueLock);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  p_valueLock = &self->_valueLock;
  id v5 = a3;
  os_unfair_lock_lock(p_valueLock);
  BOOL v6 = [(CAFCharacteristic *)self _lock_setError:v5];

  os_unfair_lock_unlock(p_valueLock);
  if (v6)
  {
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
  }
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
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = CARSignpostLogForCategory();
  os_signpost_id_t v6 = 0xEEEEB0B5B2B2EEEELL;
  os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (CARSignpostLogForCategory(),
        os_signpost_id_t v8 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, self),
        v8,
        v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v5))
    {
      long long v9 = [(CAFCharacteristic *)self name];
      id v10 = [(CAFCharacteristic *)self pluginID];
      os_signpost_id_t v11 = [(CAFCharacteristic *)self instanceID];
      *(_DWORD *)buf = 138543874;
      v32 = v9;
      __int16 v33 = 2114;
      int v34 = v10;
      __int16 v35 = 2114;
      v36 = v11;
      _os_signpost_emit_with_name_impl(&dword_249710000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Get", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", buf, 0x20u);
    }
  }

  os_unfair_lock_lock(&self->_valueLock);
  if (![(CAFCharacteristic *)self readable]) {
    goto LABEL_9;
  }
  if (!a3)
  {
    long long v12 = [(CAFCharacteristic *)self characteristicValue];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      id v14 = [(CAFCharacteristic *)self characteristicValue];
      id v15 = [v14 value];
      id v30 = 0;
      id v16 = [(CAFCharacteristic *)self decodeValue:v15 error:&v30];
      id v17 = v30;

      [(CAFCharacteristic *)self _lock_setError:v17];
      [(CAFCharacteristic *)self setCachedValue:v16];
      [(CAFCharacteristic *)self setPendingValue:0];
      [(CAFCharacteristic *)self setLockState:3];

LABEL_9:
      os_unfair_lock_unlock(&self->_valueLock);
      [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
LABEL_12:
      id v18 = CAFCharacteristicLogging();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CAFCharacteristic updateValueRequiringRead:](self);
      }

      __int16 v19 = CARSignpostLogForCategory();
      if (!self
        || (CARSignpostLogForCategory(),
            v20 = objc_claimAutoreleasedReturnValue(),
            os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v20, self),
            v20,
            v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_249710000, v19, OS_SIGNPOST_INTERVAL_END, v6, "Get", "Bailed", buf, 2u);
        }
      }

      return;
    }
  }
  if ([(CAFCharacteristic *)self lockState] == 4)
  {
    os_unfair_lock_unlock(&self->_valueLock);
    goto LABEL_12;
  }
  if ([(CAFCharacteristic *)self lockState] > 3)
  {
    [(CAFCharacteristic *)self setTransactionId:[(CAFCharacteristic *)self transactionId] + 1];
    os_unfair_lock_unlock(&self->_valueLock);
  }
  else
  {
    uint64_t v21 = [(CAFCharacteristic *)self characteristicValue];
    __int16 v22 = [v21 value];
    id v29 = 0;
    v23 = [(CAFCharacteristic *)self decodeValue:v22 error:&v29];
    id v24 = v29;
    [(CAFCharacteristic *)self setPendingValue:v23];

    [(CAFCharacteristic *)self _lock_setError:v24];
    [(CAFCharacteristic *)self setLockState:4];
    [(CAFCharacteristic *)self setTransactionId:[(CAFCharacteristic *)self transactionId] + 1];
    os_unfair_lock_unlock(&self->_valueLock);
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
  }
  uint64_t v25 = CAFCharacteristicLogging();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[CAFCharacteristic updateValueRequiringRead:](self);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v26 = [(CAFCharacteristic *)self car];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__CAFCharacteristic_updateValueRequiringRead___block_invoke;
  v27[3] = &unk_265264B10;
  objc_copyWeak(&v28, (id *)buf);
  [v26 readCharacteristic:self response:v27];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __46__CAFCharacteristic_updateValueRequiringRead___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained instanceID];
  [WeakRetained handleRead:v5 value:v3];

  os_signpost_id_t v6 = CARSignpostLogForCategory();
  if (WeakRetained)
  {
    os_signpost_id_t v7 = CARSignpostLogForCategory();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, WeakRetained);

    if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)long long v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_249710000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Get", (const char *)&unk_2497DFEC6, v9, 2u);
  }
LABEL_7:
}

- (void)_readValueCompletionTransactionID:(unint64_t)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v7 = [(CAFCharacteristic *)self transactionId];
  if (v7 == a3)
  {
    os_signpost_id_t v8 = [(CAFCharacteristic *)self characteristicValue];
    long long v9 = [v8 value];
    id v17 = 0;
    id v10 = [(CAFCharacteristic *)self decodeValue:v9 error:&v17];
    id v11 = v17;

    if (v6) {
      id v12 = v6;
    }
    else {
      id v12 = v11;
    }
    [(CAFCharacteristic *)self _lock_setError:v12];
    [(CAFCharacteristic *)self setCachedValue:v10];

    [(CAFCharacteristic *)self setPendingValue:0];
    [(CAFCharacteristic *)self setLockState:3];
    os_unfair_lock_unlock(&self->_valueLock);
    id v15 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(CAFCharacteristic *)self fullDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      unint64_t v21 = (unint64_t)v10;
      __int16 v22 = 2114;
      unint64_t v23 = (unint64_t)v6;
      _os_log_debug_impl(&dword_249710000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: value=%{public}@ error=<%{public}@>", buf, 0x20u);
    }
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
  }
  else
  {
    unint64_t v13 = v7;
    os_unfair_lock_unlock(&self->_valueLock);
    id v10 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [(CAFCharacteristic *)self fullDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v19 = v14;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      unint64_t v23 = v13;
      _os_log_debug_impl(&dword_249710000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: transactionID %lu != %lu", buf, 0x20u);
    }
  }
}

- (NSString)format
{
  uint64_t v2 = objc_opt_class();
  return (NSString *)[v2 primaryCharacteristicFormat];
}

- (NSString)baseFormat
{
  uint64_t v2 = [(CAFCharacteristic *)self metaData];
  id v3 = [v2 formatString];

  return (NSString *)v3;
}

- (BOOL)readable
{
  return 1;
}

- (BOOL)hidden
{
  return 0;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCharacteristic *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFCharacteristic *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSString)description
{
  uint64_t v2 = [(CAFCharacteristic *)self cachedDescription];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (unint64_t)state
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  unint64_t v4 = [(CAFCharacteristic *)self lockState];
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)_updateStateIfNeeded
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = NSStringFromCharacteristicState([v1 lastState]);
  long long v9 = NSStringFromCharacteristicState(v0);
  OUTLINED_FUNCTION_1_0(&dword_249710000, v3, v4, "%{public}@ lastState=%{public}@ state=%{public}@", v5, v6, v7, v8, 2u);
}

- (void)_didUpdateFromGroupUpdate:(BOOL)a3
{
  uint64_t v5 = dispatch_get_global_queue(33, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CAFCharacteristic__didUpdateFromGroupUpdate___block_invoke;
  v6[3] = &unk_265264B38;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __47__CAFCharacteristic__didUpdateFromGroupUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStateIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) service];
  [v2 _characteristicDidUpdate:*(void *)(a1 + 32) fromGroupUpdate:*(unsigned __int8 *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 characteristicDidUpdate:*(void *)(a1 + 32) fromGroupUpdate:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)supportsStates
{
  if ([(CAFCharacteristic *)self supportsInvalid]
    || [(CAFCharacteristic *)self supportsError])
  {
    return 1;
  }
  return [(CAFCharacteristic *)self supportsDisable];
}

- (BOOL)supportsError
{
  uint64_t v2 = [(CAFCharacteristic *)self errorInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsDisable
{
  uint64_t v2 = [(CAFCharacteristic *)self disabledInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsRestricted
{
  uint64_t v2 = [(CAFCharacteristic *)self restrictedInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsNotifier
{
  uint64_t v2 = [(CAFCharacteristic *)self notifierInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)propertiesDescription
{
  BOOL v3 = &stru_26FD46EB0;
  if ([(CAFCharacteristic *)self notifies])
  {
    BOOL v4 = [(CAFCharacteristic *)self isNotificationEnabled];
    uint64_t v5 = @"n";
    if (v4) {
      uint64_t v5 = @"N";
    }
    BOOL v3 = v5;
  }
  uint64_t v6 = NSString;
  if ([(CAFCharacteristic *)self readable]) {
    BOOL v7 = @"R";
  }
  else {
    BOOL v7 = &stru_26FD46EB0;
  }
  if ([(CAFCharacteristic *)self writable]) {
    uint64_t v8 = @"W";
  }
  else {
    uint64_t v8 = &stru_26FD46EB0;
  }
  if ([(CAFCharacteristic *)self isMutable]) {
    long long v9 = @"M";
  }
  else {
    long long v9 = &stru_26FD46EB0;
  }
  if ([(CAFCharacteristic *)self hasInitialValue]) {
    id v10 = @"I";
  }
  else {
    id v10 = &stru_26FD46EB0;
  }
  if ([(CAFCharacteristic *)self hasLargePayload]) {
    id v11 = @"L";
  }
  else {
    id v11 = &stru_26FD46EB0;
  }
  if ([(CAFCharacteristic *)self hidden]) {
    id v12 = @"H";
  }
  else {
    id v12 = &stru_26FD46EB0;
  }
  BOOL v13 = [(CAFCharacteristic *)self supportsStates];
  id v14 = @"S";
  if (!v13) {
    id v14 = &stru_26FD46EB0;
  }
  id v15 = [v6 stringWithFormat:@"(%@%@%@%@%@%@%@%@)", v7, v8, v3, v9, v10, v11, v12, v14];

  return v15;
}

- (id)allInstanceIDs
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = [(CAFCharacteristic *)self instanceID];
  [v3 addObject:v4];

  uint64_t v5 = [(CAFCharacteristic *)self errorInstanceID];

  if (v5)
  {
    uint64_t v6 = [(CAFCharacteristic *)self errorInstanceID];
    [v3 addObject:v6];
  }
  BOOL v7 = [(CAFCharacteristic *)self disabledInstanceID];

  if (v7)
  {
    uint64_t v8 = [(CAFCharacteristic *)self disabledInstanceID];
    [v3 addObject:v8];
  }
  long long v9 = [(CAFCharacteristic *)self notifierInstanceID];

  if (v9)
  {
    id v10 = [(CAFCharacteristic *)self notifierInstanceID];
    [v3 addObject:v10];
  }
  id v11 = [(CAFCharacteristic *)self restrictedInstanceID];

  if (v11)
  {
    id v12 = [(CAFCharacteristic *)self restrictedInstanceID];
    [v3 addObject:v12];
  }
  return v3;
}

- (id)readInstanceIDs
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = [(CAFCharacteristic *)self instanceID];
  [v3 addObject:v4];

  uint64_t v5 = [(CAFCharacteristic *)self errorInstanceID];

  if (v5)
  {
    uint64_t v6 = [(CAFCharacteristic *)self errorInstanceID];
    [v3 addObject:v6];
  }
  BOOL v7 = [(CAFCharacteristic *)self disabledInstanceID];

  if (v7)
  {
    uint64_t v8 = [(CAFCharacteristic *)self disabledInstanceID];
    [v3 addObject:v8];
  }
  long long v9 = [(CAFCharacteristic *)self restrictedInstanceID];

  if (v9)
  {
    id v10 = [(CAFCharacteristic *)self restrictedInstanceID];
    [v3 addObject:v10];
  }
  return v3;
}

- (id)registrationInstanceIDs
{
  BOOL v3 = objc_opt_new();
  if ([(CAFCharacteristic *)self isMutable])
  {
    BOOL v4 = [(CAFCharacteristic *)self instanceID];
    [v3 addObject:v4];
  }
  uint64_t v5 = [(CAFCharacteristic *)self errorInstanceID];

  if (v5)
  {
    uint64_t v6 = [(CAFCharacteristic *)self errorInstanceID];
    [v3 addObject:v6];
  }
  BOOL v7 = [(CAFCharacteristic *)self disabledInstanceID];

  if (v7)
  {
    uint64_t v8 = [(CAFCharacteristic *)self disabledInstanceID];
    [v3 addObject:v8];
  }
  long long v9 = [(CAFCharacteristic *)self restrictedInstanceID];

  if (v9)
  {
    id v10 = [(CAFCharacteristic *)self restrictedInstanceID];
    [v3 addObject:v10];
  }
  return v3;
}

- (id)pluginID
{
  uint64_t v2 = [(CAFCharacteristic *)self service];
  BOOL v3 = [v2 accessory];
  BOOL v4 = [v3 pluginID];

  return v4;
}

+ (id)characteristicFormats
{
  v8[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 primaryCharacteristicFormat];
  v8[0] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v5 = [a1 secondaryCharacteristicFormats];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (void)handleValueAndError:(id)a3 value:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAFCharacteristic *)self instanceID];
  int v9 = [v6 isEqual:v8];

  if (!v9)
  {
    id v12 = [(CAFCharacteristic *)self errorInstanceID];
    int v13 = [v6 isEqual:v12];

    if (v13)
    {
      objc_opt_class();
      id v14 = [v7 value];
      if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }

      __int16 v19 = CAFCharacteristicLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v32 = [(CAFCharacteristic *)self pluginID];
        __int16 v33 = [(CAFCharacteristic *)self instanceID];
        int v38 = 138413058;
        uint64_t v39 = v32;
        __int16 v40 = 2112;
        v41 = v33;
        __int16 v42 = 2112;
        id v43 = v6;
        __int16 v44 = 2112;
        v45 = v15;
        _os_log_debug_impl(&dword_249710000, v19, OS_LOG_TYPE_DEBUG, "Handle error state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);
      }
      p_valueLock = &self->_valueLock;
      os_unfair_lock_lock(&self->_valueLock);
      [(CAFCharacteristic *)self setHasErrorState:[v15 BOOLValue]];
    }
    else
    {
      id v16 = [(CAFCharacteristic *)self disabledInstanceID];
      int v17 = [v6 isEqual:v16];

      if (v17)
      {
        objc_opt_class();
        id v18 = [v7 value];
        if (v18 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v15 = v18;
        }
        else {
          id v15 = 0;
        }

        uint64_t v24 = CAFCharacteristicLogging();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          int v34 = [(CAFCharacteristic *)self pluginID];
          __int16 v35 = [(CAFCharacteristic *)self instanceID];
          int v38 = 138413058;
          uint64_t v39 = v34;
          __int16 v40 = 2112;
          v41 = v35;
          __int16 v42 = 2112;
          id v43 = v6;
          __int16 v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_249710000, v24, OS_LOG_TYPE_DEBUG, "Handle disabled state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);
        }
        p_valueLock = &self->_valueLock;
        os_unfair_lock_lock(&self->_valueLock);
        [(CAFCharacteristic *)self setIsDisabled:[v15 BOOLValue]];
      }
      else
      {
        unint64_t v21 = [(CAFCharacteristic *)self restrictedInstanceID];
        int v22 = [v6 isEqual:v21];

        if (!v22)
        {
          uint64_t v25 = [(CAFCharacteristic *)self notifierInstanceID];
          int v26 = [v6 isEqual:v25];

          if (!v26) {
            goto LABEL_38;
          }
          v27 = CAFCharacteristicLogging();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[CAFCharacteristic handleValueAndError:value:]();
          }

          if ([(CAFCharacteristic *)self shouldInitialize])
          {
            id v28 = [(CAFCharacteristic *)self service];
            id v29 = [v28 observers];
            char v30 = [v29 hasObservers];

            if (v30)
            {
              [(CAFCharacteristic *)self updateValueRequiringRead:1];
              goto LABEL_38;
            }
            id v15 = CAFGeneralLogging();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              -[CAFCharacteristic handleValueAndError:value:](self);
            }
          }
          else
          {
            id v15 = CAFGeneralLogging();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              -[CAFCharacteristic handleValueAndError:value:](self);
            }
          }
LABEL_37:

          goto LABEL_38;
        }
        objc_opt_class();
        id v23 = [v7 value];
        if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v15 = v23;
        }
        else {
          id v15 = 0;
        }

        v31 = CAFCharacteristicLogging();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v36 = [(CAFCharacteristic *)self pluginID];
          uint64_t v37 = [(CAFCharacteristic *)self instanceID];
          int v38 = 138413058;
          uint64_t v39 = v36;
          __int16 v40 = 2112;
          v41 = v37;
          __int16 v42 = 2112;
          id v43 = v6;
          __int16 v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_249710000, v31, OS_LOG_TYPE_DEBUG, "Handle restricted state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);
        }
        p_valueLock = &self->_valueLock;
        os_unfair_lock_lock(&self->_valueLock);
        [(CAFCharacteristic *)self setIsRestricted:[v15 BOOLValue]];
      }
    }
    os_unfair_lock_unlock(p_valueLock);
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
    goto LABEL_37;
  }
  os_unfair_lock_lock(&self->_valueLock);
  [(CAFCharacteristic *)self setCharacteristicValue:v7];
  os_unfair_lock_unlock(&self->_valueLock);
  if (v7)
  {
    id v10 = [v7 error];

    if (v10)
    {
      id v11 = [v7 error];
      [(CAFCharacteristic *)self setError:v11];
    }
  }
  [(CAFCharacteristic *)self setCachedValueIfAvailableForGroupUpdate:0];
LABEL_38:
}

- (void)handleUpdateWithInstanceID:(id)a3 value:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(CAFCharacteristic *)self handleValueAndError:a3 value:a4];
  uint64_t v5 = CARSignpostLogForCategory();
  if (self)
  {
    id v6 = CARSignpostLogForCategory();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v5))
  {
    uint64_t v8 = [(CAFCharacteristic *)self name];
    int v9 = [(CAFCharacteristic *)self pluginID];
    id v10 = [(CAFCharacteristic *)self instanceID];
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_signpost_emit_with_name_impl(&dword_249710000, v5, OS_SIGNPOST_EVENT, v7, "Update", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", (uint8_t *)&v11, 0x20u);
  }
LABEL_7:
}

- (void)handleWrite:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CAFCharacteristic *)self instanceID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CAFCharacteristic handleWrite:value:](self, v6, v10);
    }

    if (v6)
    {
      int v11 = [v6 error];

      if (v11)
      {
        id v12 = [v6 error];
        [(CAFCharacteristic *)self setError:v12];
      }
    }
  }
}

- (void)handleError:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CAFCharacteristic *)self instanceID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CAFCharacteristic handleError:value:]();
    }

    [(CAFCharacteristic *)self setError:v6];
  }
}

- (void)handleRegistrationWithInstanceID:(id)a3 value:(id)a4 registered:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  int v9 = [(CAFCharacteristic *)self instanceID];
  int v10 = [v11 isEqual:v9];

  if (v10)
  {
    os_unfair_lock_lock(&self->_valueLock);
    [(CAFCharacteristic *)self setIsNotificationEnabled:v5];
    os_unfair_lock_unlock(&self->_valueLock);
  }
  [(CAFCharacteristic *)self handleValueAndError:v11 value:v8];
}

- (void)handleRegistrationWithInstanceID:(id)a3 registered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CAFCharacteristic *)self instanceID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CAFControl handleRegistrationWithInstanceID:registered:](self);
    }

    os_unfair_lock_lock(&self->_valueLock);
    [(CAFCharacteristic *)self setIsNotificationEnabled:v4];
    os_unfair_lock_unlock(&self->_valueLock);
    [(CAFCharacteristic *)self _didUpdateFromGroupUpdate:0];
  }
}

+ (id)observerProtocol
{
  return &unk_26FDB4658;
}

+ (id)primaryCharacteristicFormat
{
  return @"generic";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  return &stru_26FD46EB0;
}

- (id)encodeValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (id)decodeValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (NSString)fullDescription
{
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  uint64_t v5 = [(CAFCharacteristic *)self lockState];
  unint64_t v6 = [(CAFCharacteristic *)self transactionId];
  id v7 = NSString;
  int v8 = [(CAFCharacteristic *)self characteristicValue];
  if (v8)
  {
    uint64_t v2 = [(CAFCharacteristic *)self characteristicValue];
    int v9 = [v2 value];
  }
  else
  {
    int v9 = 0;
  }
  int v10 = [(CAFCharacteristic *)self cachedValue];
  id v11 = [(CAFCharacteristic *)self pendingValue];
  id v12 = [v7 stringWithFormat:@"[V:%@ C:%@ P:%@]", v9, v10, v11];

  if (v8)
  {
  }
  __int16 v13 = (__CFString *)[(NSError *)self->_error copy];
  os_unfair_lock_unlock(p_valueLock);
  id v14 = [(CAFCharacteristic *)self descriptionExtras];
  if ([v14 length])
  {
    unint64_t v15 = 0x263F08000uLL;
    id v16 = [NSString stringWithFormat:@" %@", v14];
  }
  else
  {
    id v16 = 0;
    unint64_t v15 = 0x263F08000uLL;
  }

  unint64_t v34 = v6;
  if ([(CAFCharacteristic *)self supportsStates])
  {
    uint64_t v17 = NSString;
    if ([(CAFCharacteristic *)self isInvalid]) {
      id v18 = @"I";
    }
    else {
      id v18 = &stru_26FD46EB0;
    }
    if ([(CAFCharacteristic *)self hasErrorState]) {
      __int16 v19 = @"E";
    }
    else {
      __int16 v19 = &stru_26FD46EB0;
    }
    if ([(CAFCharacteristic *)self isDisabled]) {
      __int16 v20 = @"D";
    }
    else {
      __int16 v20 = &stru_26FD46EB0;
    }
    BOOL v21 = [(CAFCharacteristic *)self isRestricted];
    int v22 = @"R";
    if (!v21) {
      int v22 = &stru_26FD46EB0;
    }
    __int16 v33 = v18;
    unint64_t v15 = 0x263F08000;
    [v17 stringWithFormat:@" states=%@%@%@%@", v33, v19, v20, v22];
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }
  uint64_t v24 = *(void **)(v15 + 2880);
  uint64_t v25 = [(CAFCharacteristic *)self description];
  uint64_t v26 = NSStringFromCharacteristicState(v5);
  v27 = (void *)v26;
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = &stru_26FD46EB0;
  }
  id v29 = @"NO";
  if (v13) {
    id v29 = v13;
  }
  if (v16) {
    char v30 = v16;
  }
  else {
    char v30 = &stru_26FD46EB0;
  }
  v31 = [v24 stringWithFormat:@"%@(state=%@(%lu) values=%@%@ error=%@%@)", v25, v26, v34, v12, v28, v29, v30];

  return (NSString *)v31;
}

- (BOOL)usable
{
  return 1;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_26FD909C0;
}

- (id)currentDescriptionForCache:(id)a3
{
  char v30 = NSString;
  uint64_t v29 = objc_opt_class();
  id v28 = [(CAFCharacteristic *)self name];
  unint64_t v34 = [(CAFCharacteristic *)self pluginID];
  v27 = [(CAFCharacteristic *)self instanceID];
  uint64_t v4 = [(CAFCharacteristic *)self errorInstanceID];
  __int16 v33 = (void *)v4;
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"-";
  }
  uint64_t v26 = v5;
  uint64_t v6 = [(CAFCharacteristic *)self disabledInstanceID];
  v32 = (void *)v6;
  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"-";
  }
  uint64_t v25 = v7;
  uint64_t v8 = [(CAFCharacteristic *)self notifierInstanceID];
  v31 = (void *)v8;
  if (v8) {
    int v9 = (__CFString *)v8;
  }
  else {
    int v9 = @"-";
  }
  uint64_t v24 = v9;
  uint64_t v10 = [(CAFCharacteristic *)self restrictedInstanceID];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"-";
  }
  id v23 = v12;
  int v22 = [(CAFCharacteristic *)self characteristicType];
  BOOL v21 = [(CAFCharacteristic *)self accessory];
  __int16 v13 = [(CAFCharacteristic *)self accessory];
  id v14 = [v13 instanceID];
  unint64_t v15 = [(CAFCharacteristic *)self service];
  id v16 = [(CAFCharacteristic *)self service];
  uint64_t v17 = [v16 instanceID];
  id v18 = [(CAFCharacteristic *)self propertiesDescription];
  __int16 v19 = [v30 stringWithFormat:@"<%@: %p %@ %@ %@ (%@|%@|%@|%@) type=%@ accessory=(%p)%@ service=(%p)%@ properties=%@>", v29, self, v28, v34, v27, v26, v25, v24, v23, v22, v21, v14, v15, v17, v18];

  return v19;
}

- (CAFService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (CAFService *)WeakRetained;
}

- (BOOL)hasErrorState
{
  return self->_hasErrorState;
}

- (void)setHasErrorState:(BOOL)a3
{
  self->_hasErrorState = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (BOOL)writable
{
  return self->_writable;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSNumber)errorInstanceID
{
  return self->_errorInstanceID;
}

- (NSNumber)disabledInstanceID
{
  return self->_disabledInstanceID;
}

- (NSNumber)notifierInstanceID
{
  return self->_notifierInstanceID;
}

- (NSNumber)restrictedInstanceID
{
  return self->_restrictedInstanceID;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
}

- (CAFCharacteristicValue)characteristicValue
{
  return self->_characteristicValue;
}

- (void)setCharacteristicValue:(id)a3
{
}

- (NSNumber)notifierValue
{
  return self->_notifierValue;
}

- (void)setNotifierValue:(id)a3
{
}

- (CAFCharacteristicMetadata)metaData
{
  return self->_metaData;
}

- (BOOL)isMutable
{
  return self->_isMutable;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (BOOL)hasInitialValue
{
  return self->_hasInitialValue;
}

- (BOOL)hasLargePayload
{
  return self->_hasLargePayload;
}

- (BOOL)supportsInvalid
{
  return self->_supportsInvalid;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (void)setIsNotificationEnabled:(BOOL)a3
{
  self->_isNotificationEnabled = a3;
}

- (BOOL)shouldInitialize
{
  return self->_shouldInitialize;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
}

- (BOOL)initializationFinished
{
  return self->_initializationFinished;
}

- (void)setInitializationFinished:(BOOL)a3
{
  self->_initializationFinished = a3;
}

- (unint64_t)lastState
{
  return self->_lastState;
}

- (void)setLastState:(unint64_t)a3
{
  self->_lastState = a3;
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

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
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
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_notifierValue, 0);
  objc_storeStrong((id *)&self->_characteristicValue, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_restrictedInstanceID, 0);
  objc_storeStrong((id *)&self->_notifierInstanceID, 0);
  objc_storeStrong((id *)&self->_disabledInstanceID, 0);
  objc_storeStrong((id *)&self->_errorInstanceID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithService:(void *)a1 config:.cold.1(void *a1)
{
  uint64_t v2 = [a1 pluginID];
  int v9 = [a1 instanceID];
  OUTLINED_FUNCTION_1(&dword_249710000, v3, v4, "Parsing characteristic config from pluginID: %@ service instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);
}

- (void)initWithService:(void *)a1 config:.cold.2(void *a1)
{
  id v1 = [a1 pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing characteristic config from pluginID: %@ instanceID: %@ failed for characteristicType", v4, v5, v6, v7, v8);
}

- (void)initWithService:(void *)a1 config:.cold.3(void *a1)
{
  id v1 = [a1 pluginID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing characteristic config from pluginID: %@ instanceID: %@ failed for metaData", v4, v5, v6, v7, v8);
}

- (void)initWithService:config:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ shouldInitialize=NO", v2, v3, v4, v5, v6);
}

- (void)initWithService:config:.cold.5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ shouldDefer=YES", v2, v3, v4, v5, v6);
}

- (void)setValue:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_249710000, v0, OS_LOG_TYPE_ERROR, "%{public}@ characteristic is currently disabled", v1, 0xCu);
}

- (void)setValue:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ unable to set value while initializing", v2, v3, v4, v5, v6);
}

- (void)setValue:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_249710000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ setValue: %{public}@", v2, 0x16u);
}

- (void)setValue:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_249710000, v0, OS_LOG_TYPE_ERROR, "%{public}@ characteristic is not writable", v1, 0xCu);
}

- (void)setCachedValueIfAvailableForGroupUpdate:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_249710000, v0, v1, "%{public}@ no value to cache", v2, v3, v4, v5, v6);
}

- (void)updateValueRequiringRead:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%{public}@ (requireRead=%@) skipping", v4, v5, v6, v7, v8);
}

- (void)updateValueRequiringRead:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%{public}@ (requireRead=%@) readValue", v4, v5, v6, v7, v8);
}

- (void)handleValueAndError:(void *)a1 value:.cold.1(void *a1)
{
  uint64_t v1 = [a1 service];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ received update for %@ but no service observers, skipping read", v4, v5, v6, v7, v8);
}

- (void)handleValueAndError:(void *)a1 value:.cold.2(void *a1)
{
  uint64_t v1 = [a1 service];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_8(&dword_249710000, v2, v3, "%@ received update for uninitialized charcteristic %@, skipping read", v4, v5, v6, v7, v8);
}

- (void)handleValueAndError:value:.cold.3()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = [v1 pluginID];
  uint64_t v3 = [v0 instanceID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Handle notifier state update pluginID: %@ instanceID: %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)handleWrite:(NSObject *)a3 value:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v8 = [a1 pluginID];
  uint64_t v9 = [a1 instanceID];
  if (a2)
  {
    uint64_t v3 = [a2 error];
    if (v3)
    {
      id v12 = NSString;
      uint64_t v4 = [a2 error];
      id v11 = [v12 stringWithFormat:@" error: %@", v4];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      id v11 = &stru_26FD46EB0;
    }
  }
  else
  {
    int v10 = 0;
    id v11 = &stru_26FD46EB0;
  }
  *(_DWORD *)buf = 138412802;
  id v14 = v8;
  __int16 v15 = 2112;
  id v16 = v9;
  __int16 v17 = 2112;
  id v18 = v11;
  _os_log_debug_impl(&dword_249710000, a3, OS_LOG_TYPE_DEBUG, "Handle write pluginID: %@ instanceID: %@%@", buf, 0x20u);
  if (v10)
  {
  }
  if (a2) {
}
  }

- (void)handleError:value:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = [v1 pluginID];
  uint64_t v3 = [v0 instanceID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Handle error pluginID: %@ instanceID: %@ error: %@", v6, v7, v8, v9, v10);
}

@end