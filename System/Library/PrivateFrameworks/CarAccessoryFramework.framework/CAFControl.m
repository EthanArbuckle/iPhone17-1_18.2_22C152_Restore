@interface CAFControl
+ (id)controlIdentifier;
+ (id)controlWithService:(id)a3 config:(id)a4;
+ (id)observerProtocol;
+ (id)registeredControlClasses;
+ (void)_appendParametersDescription:(id)a3 parameters:(id)a4;
+ (void)load;
+ (void)registerControlClass:(Class)a3;
- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4;
- (BOOL)hasErrorState;
- (BOOL)hasResponse;
- (BOOL)hidden;
- (BOOL)incoming;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotificationEnabled;
- (BOOL)isRestricted;
- (BOOL)notifies;
- (BOOL)outgoing;
- (BOOL)shouldInitialize;
- (BOOL)supportsDisable;
- (BOOL)supportsError;
- (BOOL)supportsRestricted;
- (BOOL)supportsStates;
- (BOOL)usable;
- (CAFAccessory)accessory;
- (CAFCachedDescription)cachedDescription;
- (CAFCar)car;
- (CAFControl)initWithService:(id)a3 config:(id)a4;
- (CAFService)service;
- (CARObserverHashTable)observers;
- (Class)baseCAFClass;
- (NSArray)comparisonKeys;
- (NSArray)requestParameters;
- (NSArray)responseParameters;
- (NSNumber)disabledInstanceID;
- (NSNumber)errorInstanceID;
- (NSNumber)instanceID;
- (NSNumber)priority;
- (NSNumber)restrictedInstanceID;
- (NSString)controlType;
- (NSString)description;
- (NSString)fullDescription;
- (NSString)typeName;
- (NSUUID)uniqueIdentifier;
- (id)allInstanceIDs;
- (id)currentDescriptionForCache:(id)a3;
- (id)parametersDescription;
- (id)pluginID;
- (id)propertiesDescription;
- (id)readInstanceIDs;
- (id)registrationInstanceIDs;
- (int64_t)compare:(id)a3;
- (os_unfair_lock_s)valueLock;
- (unint64_t)hash;
- (unint64_t)sender;
- (void)_didUpdate;
- (void)dealloc;
- (void)handleNotificationWithValue:(id)a3;
- (void)handleRegistrationWithInstanceID:(id)a3 registered:(BOOL)a4;
- (void)handleRegistrationWithInstanceID:(id)a3 value:(id)a4 registered:(BOOL)a5;
- (void)handleRequestWithValue:(id)a3 withResponse:(id)a4;
- (void)handleUpdateWithInstanceID:(id)a3 value:(id)a4;
- (void)handleValueAndError:(id)a3 value:(id)a4;
- (void)notifyWithValue:(id)a3;
- (void)registerObserver:(id)a3;
- (void)requestWithValue:(id)a3 response:(id)a4;
- (void)setCachedDescription:(id)a3;
- (void)setHasErrorState:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsNotificationEnabled:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setSender:(unint64_t)a3;
- (void)setTypeName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setValueLock:(os_unfair_lock_s)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFControl

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[CAFControl registerControlClass:v3];
  }
}

+ (void)registerControlClass:(Class)a3
{
  if (registerControlClass__onceToken != -1) {
    dispatch_once(&registerControlClass__onceToken, &__block_literal_global_0);
  }
  id obj = (id)_registeredControlClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredControlClasses;
  v5 = [(objc_class *)a3 controlIdentifier];
  [v4 setObject:a3 forKeyedSubscript:v5];

  objc_sync_exit(obj);
}

uint64_t __35__CAFControl_registerControlClass___block_invoke()
{
  _registeredControlClasses = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)registeredControlClasses
{
  id v2 = (id)_registeredControlClasses;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(id)_registeredControlClasses copy];
  objc_sync_exit(v2);

  return v3;
}

+ (id)controlWithService:(id)a3 config:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CAFCarConfiguration getType:v5];
  v8 = +[CAFControl registeredControlClasses];
  v9 = (objc_class *)[v8 objectForKeyedSubscript:v7];

  if (!v9) {
    v9 = (objc_class *)objc_opt_class();
  }
  v10 = (void *)[[v9 alloc] initWithService:v6 config:v5];

  return v10;
}

- (CAFControl)initWithService:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)CAFControl;
  v8 = [(CAFControl *)&v54 init];
  v9 = v8;
  if (v8)
  {
    v8->_valueLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_service, v6);
    objc_opt_class();
    id v10 = [v7 objectForKeyedSubscript:@"iid"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      v11 = (NSNumber *)v10;
    }
    else {
      v11 = 0;
    }

    instanceID = v9->_instanceID;
    v9->_instanceID = v11;

    objc_opt_class();
    id v13 = [v7 objectForKeyedSubscript:@"iidError"];
    if (v13 && (objc_opt_isKindOfClass() & 1) != 0) {
      v14 = (NSNumber *)v13;
    }
    else {
      v14 = 0;
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
    id v19 = [v7 objectForKeyedSubscript:@"iidRestricted"];
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
      v20 = (NSNumber *)v19;
    }
    else {
      v20 = 0;
    }

    restrictedInstanceID = v9->_restrictedInstanceID;
    v9->_restrictedInstanceID = v20;

    if (v9->_instanceID)
    {
      uint64_t v22 = +[CAFCarConfiguration getType:v7];
      controlType = v9->_controlType;
      v9->_controlType = (NSString *)v22;

      if (!v9->_controlType)
      {
        v37 = CAFControlLogging();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[CAFControl initWithService:config:](v6);
        }

        goto LABEL_47;
      }
      v24 = [v6 pluginID];
      uint64_t v25 = +[CAFCarConfiguration getUUID:v24 instanceID:v9->_instanceID];
      uniqueIdentifier = v9->_uniqueIdentifier;
      v9->_uniqueIdentifier = (NSUUID *)v25;

      uint64_t v27 = +[CAFControlTypes controlNameForType:v9->_controlType];
      typeName = v9->_typeName;
      v9->_typeName = (NSString *)v27;

      objc_opt_class();
      id v29 = [v7 objectForKeyedSubscript:@"priority"];
      if (v29 && (objc_opt_isKindOfClass() & 1) != 0) {
        v30 = (NSNumber *)v29;
      }
      else {
        v30 = 0;
      }

      priority = v9->_priority;
      v9->_priority = v30;

      objc_opt_class();
      id v33 = [v7 objectForKeyedSubscript:@"sender"];
      if (v33 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v34 = v33;
      }
      else {
        id v34 = 0;
      }

      if (v34)
      {
        v9->_sender = [v34 unsignedIntegerValue];
        v9->_hasResponse = +[CAFCarConfiguration getBoolean:v7 key:@"hasResponse"];
        objc_opt_class();
        id v35 = [v7 objectForKeyedSubscript:@"requestParameters"];
        if (v35 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v36 = v35;
        }
        else {
          id v36 = 0;
        }

        uint64_t v38 = +[CAFControlParameter parseParameters:v36];
        requestParameters = v9->_requestParameters;
        v9->_requestParameters = (NSArray *)v38;

        objc_opt_class();
        id v40 = [v7 objectForKeyedSubscript:@"responseParameters"];
        if (v40 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v41 = v40;
        }
        else {
          id v41 = 0;
        }

        uint64_t v42 = +[CAFControlParameter parseParameters:v41];
        responseParameters = v9->_responseParameters;
        v9->_responseParameters = (NSArray *)v42;

        v9->_isNotificationEnabled = 0;
        v44 = [(CAFControl *)v9 car];
        v45 = [v44 carManager];
        v9->_shouldInitialize = [v45 shouldInitializeControl:v9];

        id v46 = objc_alloc(MEMORY[0x263F30E18]);
        v47 = [(id)objc_opt_class() observerProtocol];
        uint64_t v48 = [v46 initWithProtocol:v47];
        observers = v9->_observers;
        v9->_observers = (CARObserverHashTable *)v48;

        v50 = [[CAFCachedDescription alloc] initWithCacheable:v9];
        cachedDescription = v9->_cachedDescription;
        v9->_cachedDescription = v50;

        goto LABEL_43;
      }
      v31 = CAFControlLogging();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CAFControl initWithService:config:](v31);
      }
    }
    else
    {
      v31 = CAFControlLogging();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CAFControl initWithService:config:](v6);
      }
    }

LABEL_47:
    v52 = 0;
    goto LABEL_48;
  }
LABEL_43:
  v52 = v9;
LABEL_48:

  return v52;
}

- (void)dealloc
{
  uint64_t v3 = [(CAFControl *)self car];
  [v3 enableNotificationForControl:self enable:0 response:0];

  v4.receiver = self;
  v4.super_class = (Class)CAFControl;
  [(CAFControl *)&v4 dealloc];
}

- (unint64_t)hash
{
  id v2 = [(CAFControl *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (CAFControl *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CAFControl *)v4 uniqueIdentifier];
      id v6 = [(CAFControl *)self uniqueIdentifier];
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
  id v2 = [(CAFControl *)self accessory];
  unint64_t v3 = [v2 car];

  return (CAFCar *)v3;
}

- (CAFAccessory)accessory
{
  id v2 = [(CAFControl *)self service];
  unint64_t v3 = [v2 accessory];

  return (CAFAccessory *)v3;
}

- (BOOL)outgoing
{
  return [(CAFControl *)self sender] == 0;
}

- (BOOL)incoming
{
  return [(CAFControl *)self sender] == 1;
}

- (BOOL)notifies
{
  if ([(CAFControl *)self incoming]) {
    return 1;
  }
  objc_super v4 = [(CAFControl *)self errorInstanceID];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(CAFControl *)self disabledInstanceID];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      id v6 = [(CAFControl *)self restrictedInstanceID];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (BOOL)hidden
{
  return 0;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFControl *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFControl *)self observers];
  [v5 unregisterObserver:v4];
}

- (NSString)description
{
  id v2 = [(CAFControl *)self cachedDescription];
  BOOL v3 = [v2 description];

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_didUpdate
{
  BOOL v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__CAFControl__didUpdate__block_invoke;
  block[3] = &unk_265263258;
  block[4] = self;
  dispatch_async(v3, block);
}

void __24__CAFControl__didUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) service];
  [v2 _controlDidUpdate:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 controlDidUpdate:*(void *)(a1 + 32)];
}

- (void)requestWithValue:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CAFControl *)self outgoing])
  {
    if (!v7) {
      goto LABEL_9;
    }
    v11 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__CAFControl_requestWithValue_response___block_invoke;
    block[3] = &unk_265263360;
    id v17 = v7;
    dispatch_async(v11, block);

    v12 = v17;
LABEL_8:

    goto LABEL_9;
  }
  BOOL v8 = [(CAFControl *)self hasResponse];
  v9 = [(CAFControl *)self car];
  id v10 = v9;
  if (!v8)
  {
    [v9 notifyControl:self value:v6];

    if (!v7) {
      goto LABEL_9;
    }
    id v13 = dispatch_get_global_queue(33, 0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__CAFControl_requestWithValue_response___block_invoke_2;
    v14[3] = &unk_265263360;
    id v15 = v7;
    dispatch_async(v13, v14);

    v12 = v15;
    goto LABEL_8;
  }
  [v9 requestControl:self value:v6 response:v7];

LABEL_9:
}

void __40__CAFControl_requestWithValue_response___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:10 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __40__CAFControl_requestWithValue_response___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyWithValue:(id)a3
{
  id v7 = a3;
  if ([(CAFControl *)self outgoing])
  {
    BOOL v4 = [(CAFControl *)self hasResponse];
    id v5 = [(CAFControl *)self car];
    id v6 = v5;
    if (v4) {
      [v5 requestControl:self value:v7 response:0];
    }
    else {
      [v5 notifyControl:self value:v7];
    }
  }
}

- (BOOL)supportsStates
{
  if ([(CAFControl *)self supportsError]) {
    return 1;
  }
  return [(CAFControl *)self supportsDisable];
}

- (BOOL)supportsError
{
  id v2 = [(CAFControl *)self errorInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsDisable
{
  id v2 = [(CAFControl *)self disabledInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsRestricted
{
  id v2 = [(CAFControl *)self restrictedInstanceID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)propertiesDescription
{
  BOOL v3 = [(CAFControl *)self hasResponse];
  BOOL v4 = [(CAFControl *)self outgoing];
  if (v3)
  {
    id v5 = @"C";
    if (v4) {
      goto LABEL_8;
    }
    BOOL v6 = [(CAFControl *)self isNotificationEnabled];
    id v7 = @"c";
  }
  else
  {
    id v5 = @"E";
    if (v4) {
      goto LABEL_8;
    }
    BOOL v6 = [(CAFControl *)self isNotificationEnabled];
    id v7 = @"e";
  }
  if (!v6) {
    id v5 = v7;
  }
LABEL_8:
  BOOL v8 = v5;
  v9 = NSString;
  if ([(CAFControl *)self outgoing]) {
    id v10 = @"O";
  }
  else {
    id v10 = @"I";
  }
  if ([(CAFControl *)self hidden]) {
    v11 = @"H";
  }
  else {
    v11 = &stru_26FD46EB0;
  }
  BOOL v12 = [(CAFControl *)self supportsStates];
  id v13 = @"S";
  if (!v12) {
    id v13 = &stru_26FD46EB0;
  }
  v14 = [v9 stringWithFormat:@"(%@%@%@%@)", v10, v8, v11, v13];

  return v14;
}

+ (void)_appendParametersDescription:(id)a3 parameters:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          objc_msgSend(v5, "appendString:", @"(");
          id v13 = [v12 formatString];
          [v5 appendString:v13];

          if ([v12 supportsInvalid]) {
            [v5 appendString:@"?"];
          }
          [v5 appendString:@" "]);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (id)parametersDescription
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"( ");
  BOOL v4 = [(CAFControl *)self requestParameters];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [v3 appendString:@"in: "];
    id v6 = [(CAFControl *)self requestParameters];
    +[CAFControl _appendParametersDescription:v3 parameters:v6];
  }
  id v7 = [(CAFControl *)self responseParameters];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v3 appendString:@"out: "];
    uint64_t v9 = [(CAFControl *)self responseParameters];
    +[CAFControl _appendParametersDescription:v3 parameters:v9];
  }
  else if (!v5)
  {
    [v3 appendString:@"void "];
  }
  [v3 appendString:@""]);
  return v3;
}

- (id)allInstanceIDs
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = [(CAFControl *)self instanceID];
  [v3 addObject:v4];

  uint64_t v5 = [(CAFControl *)self errorInstanceID];

  if (v5)
  {
    id v6 = [(CAFControl *)self errorInstanceID];
    [v3 addObject:v6];
  }
  id v7 = [(CAFControl *)self disabledInstanceID];

  if (v7)
  {
    uint64_t v8 = [(CAFControl *)self disabledInstanceID];
    [v3 addObject:v8];
  }
  uint64_t v9 = [(CAFControl *)self restrictedInstanceID];

  if (v9)
  {
    uint64_t v10 = [(CAFControl *)self restrictedInstanceID];
    [v3 addObject:v10];
  }
  return v3;
}

- (id)readInstanceIDs
{
  BOOL v3 = objc_opt_new();
  BOOL v4 = [(CAFControl *)self errorInstanceID];

  if (v4)
  {
    uint64_t v5 = [(CAFControl *)self errorInstanceID];
    [v3 addObject:v5];
  }
  id v6 = [(CAFControl *)self disabledInstanceID];

  if (v6)
  {
    id v7 = [(CAFControl *)self disabledInstanceID];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(CAFControl *)self restrictedInstanceID];

  if (v8)
  {
    uint64_t v9 = [(CAFControl *)self restrictedInstanceID];
    [v3 addObject:v9];
  }
  return v3;
}

- (id)registrationInstanceIDs
{
  BOOL v3 = objc_opt_new();
  if ([(CAFControl *)self incoming])
  {
    BOOL v4 = [(CAFControl *)self instanceID];
    [v3 addObject:v4];
  }
  uint64_t v5 = [(CAFControl *)self errorInstanceID];

  if (v5)
  {
    id v6 = [(CAFControl *)self errorInstanceID];
    [v3 addObject:v6];
  }
  id v7 = [(CAFControl *)self disabledInstanceID];

  if (v7)
  {
    uint64_t v8 = [(CAFControl *)self disabledInstanceID];
    [v3 addObject:v8];
  }
  uint64_t v9 = [(CAFControl *)self restrictedInstanceID];

  if (v9)
  {
    uint64_t v10 = [(CAFControl *)self restrictedInstanceID];
    [v3 addObject:v10];
  }
  return v3;
}

- (id)pluginID
{
  id v2 = [(CAFControl *)self service];
  BOOL v3 = [v2 accessory];
  BOOL v4 = [v3 pluginID];

  return v4;
}

- (void)handleNotificationWithValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CAFControlLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFControl handleNotificationWithValue:](self);
  }

  id v6 = dispatch_get_global_queue(33, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__CAFControl_handleNotificationWithValue___block_invoke;
  v8[3] = &unk_265263280;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__CAFControl_handleNotificationWithValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didNotifyWithValue:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 control:*(void *)(a1 + 32) didNotifyWithValue:*(void *)(a1 + 40)];
}

- (void)handleRequestWithValue:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CAFControlLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CAFControl handleRequestWithValue:withResponse:](self);
  }

  id v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CAFControl_handleRequestWithValue_withResponse___block_invoke;
  block[3] = &unk_265263420;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __50__CAFControl_handleRequestWithValue_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  char v18 = [*(id *)(a1 + 32) _didRequestWithValue:*(void *)(a1 + 40) response:*(void *)(a1 + 48)];
  if (!*((unsigned char *)v16 + 24))
  {
    id v2 = [*(id *)(a1 + 32) observers];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __50__CAFControl_handleRequestWithValue_withResponse___block_invoke_2;
    id v10 = &unk_2652633F8;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v14 = &v15;
    uint64_t v11 = v3;
    id v12 = v4;
    id v13 = *(id *)(a1 + 48);
    [v2 enumerateObserversWithBlock:&v7];

    if (!*((unsigned char *)v16 + 24))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      id v6 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.caraccessoryframework.cardata", 9, 0, v7, v8, v9, v10, v11);
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
    }
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __50__CAFControl_handleRequestWithValue_withResponse___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 control:a1[4] didRequestWithValue:a1[5] response:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)handleValueAndError:(id)a3 value:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAFControl *)self errorInstanceID];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    objc_opt_class();
    id v10 = [v7 value];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    uint64_t v15 = CAFControlLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = [(CAFControl *)self pluginID];
      v23 = [(CAFControl *)self instanceID];
      int v28 = 138413058;
      id v29 = v22;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_debug_impl(&dword_249710000, v15, OS_LOG_TYPE_DEBUG, "Handle control error state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);
    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setHasErrorState:](self, "setHasErrorState:", [v11 BOOLValue]);
LABEL_25:
    os_unfair_lock_unlock(p_valueLock);
    [(CAFControl *)self _didUpdate];

    goto LABEL_26;
  }
  id v12 = [(CAFControl *)self disabledInstanceID];
  int v13 = [v6 isEqual:v12];

  if (v13)
  {
    objc_opt_class();
    id v14 = [v7 value];
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v14;
    }
    else {
      id v11 = 0;
    }

    v20 = CAFControlLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v24 = [(CAFControl *)self pluginID];
      uint64_t v25 = [(CAFControl *)self instanceID];
      int v28 = 138413058;
      id v29 = v24;
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_debug_impl(&dword_249710000, v20, OS_LOG_TYPE_DEBUG, "Handle control disabled state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);
    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsDisabled:](self, "setIsDisabled:", [v11 BOOLValue]);
    goto LABEL_25;
  }
  uint64_t v17 = [(CAFControl *)self restrictedInstanceID];
  int v18 = [v6 isEqual:v17];

  if (v18)
  {
    objc_opt_class();
    id v19 = [v7 value];
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v19;
    }
    else {
      id v11 = 0;
    }

    v21 = CAFControlLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v26 = [(CAFControl *)self pluginID];
      uint64_t v27 = [(CAFControl *)self instanceID];
      int v28 = 138413058;
      id v29 = v26;
      __int16 v30 = 2112;
      v31 = v27;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_debug_impl(&dword_249710000, v21, OS_LOG_TYPE_DEBUG, "Handle control restricted state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);
    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsRestricted:](self, "setIsRestricted:", [v11 BOOLValue]);
    goto LABEL_25;
  }
LABEL_26:
}

- (void)handleUpdateWithInstanceID:(id)a3 value:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(CAFControl *)self handleValueAndError:a3 value:a4];
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
    uint64_t v8 = [(CAFControl *)self name];
    int v9 = [(CAFControl *)self pluginID];
    id v10 = [(CAFControl *)self instanceID];
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v9;
    __int16 v15 = 2114;
    long long v16 = v10;
    _os_signpost_emit_with_name_impl(&dword_249710000, v5, OS_SIGNPOST_EVENT, v7, "Update", "Control: %{public}@ pluginID: %{public}@ instanceID: %{public}@", (uint8_t *)&v11, 0x20u);
  }
LABEL_7:
}

- (void)handleRegistrationWithInstanceID:(id)a3 value:(id)a4 registered:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  int v9 = [(CAFControl *)self instanceID];
  int v10 = [v11 isEqual:v9];

  if (v10)
  {
    os_unfair_lock_lock(&self->_valueLock);
    [(CAFControl *)self setIsNotificationEnabled:v5];
    os_unfair_lock_unlock(&self->_valueLock);
  }
  [(CAFControl *)self handleValueAndError:v11 value:v8];
}

- (void)handleRegistrationWithInstanceID:(id)a3 registered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_signpost_id_t v7 = [(CAFControl *)self instanceID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = CAFCharacteristicLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CAFControl handleRegistrationWithInstanceID:registered:](self);
    }

    os_unfair_lock_lock(&self->_valueLock);
    [(CAFControl *)self setIsNotificationEnabled:v4];
    os_unfair_lock_unlock(&self->_valueLock);
    [(CAFControl *)self _didUpdate];
  }
}

+ (id)controlIdentifier
{
  return &stru_26FD46EB0;
}

+ (id)observerProtocol
{
  return &unk_26FDA8730;
}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  return 0;
}

- (NSString)fullDescription
{
  if ([(CAFControl *)self supportsStates])
  {
    uint64_t v3 = NSString;
    if ([(CAFControl *)self hasErrorState]) {
      BOOL v4 = @"E";
    }
    else {
      BOOL v4 = &stru_26FD46EB0;
    }
    if ([(CAFControl *)self isDisabled]) {
      BOOL v5 = @"D";
    }
    else {
      BOOL v5 = &stru_26FD46EB0;
    }
    BOOL v6 = [(CAFControl *)self isRestricted];
    os_signpost_id_t v7 = @"R";
    if (!v6) {
      os_signpost_id_t v7 = &stru_26FD46EB0;
    }
    [v3 stringWithFormat:@" states=%@%@%@", v4, v5, v7];
    int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v8 = 0;
  }
  int v9 = NSString;
  uint64_t v10 = [(CAFControl *)self description];
  id v11 = (void *)v10;
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = &stru_26FD46EB0;
  }
  __int16 v13 = [v9 stringWithFormat:@"%@(%@)", v10, v12];

  return (NSString *)v13;
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
  return (NSArray *)&unk_26FD908E8;
}

- (id)currentDescriptionForCache:(id)a3
{
  int v28 = NSString;
  uint64_t v27 = objc_opt_class();
  v26 = [(CAFControl *)self name];
  v31 = [(CAFControl *)self pluginID];
  v24 = [(CAFControl *)self instanceID];
  uint64_t v4 = [(CAFControl *)self errorInstanceID];
  __int16 v30 = (void *)v4;
  if (v4) {
    BOOL v5 = (__CFString *)v4;
  }
  else {
    BOOL v5 = @"-";
  }
  v23 = v5;
  uint64_t v6 = [(CAFControl *)self disabledInstanceID];
  id v29 = (void *)v6;
  if (v6) {
    os_signpost_id_t v7 = (__CFString *)v6;
  }
  else {
    os_signpost_id_t v7 = @"-";
  }
  uint64_t v22 = v7;
  uint64_t v8 = [(CAFControl *)self restrictedInstanceID];
  uint64_t v25 = (void *)v8;
  if (v8) {
    int v9 = (__CFString *)v8;
  }
  else {
    int v9 = @"-";
  }
  v21 = v9;
  v20 = [(CAFControl *)self controlType];
  id v19 = [(CAFControl *)self parametersDescription];
  uint64_t v10 = [(CAFControl *)self accessory];
  id v11 = [(CAFControl *)self accessory];
  id v12 = [v11 instanceID];
  __int16 v13 = [(CAFControl *)self service];
  id v14 = [(CAFControl *)self service];
  __int16 v15 = [v14 instanceID];
  long long v16 = [(CAFControl *)self propertiesDescription];
  uint64_t v17 = [v28 stringWithFormat:@"<%@: %p %@ %@ %@ (%@|%@|%@) type=%@ parameters=%@ accessory=(%p)%@ service=(%p)%@ properties=%@>", v27, self, v26, v31, v24, v23, v22, v21, v20, v19, v10, v12, v13, v15, v16];

  return v17;
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

- (BOOL)hasResponse
{
  return self->_hasResponse;
}

- (NSArray)requestParameters
{
  return self->_requestParameters;
}

- (NSArray)responseParameters
{
  return self->_responseParameters;
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

- (NSNumber)restrictedInstanceID
{
  return self->_restrictedInstanceID;
}

- (NSString)controlType
{
  return self->_controlType;
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

- (NSNumber)priority
{
  return self->_priority;
}

- (unint64_t)sender
{
  return self->_sender;
}

- (void)setSender:(unint64_t)a3
{
  self->_sender = a3;
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

- (os_unfair_lock_s)valueLock
{
  return self->_valueLock;
}

- (void)setValueLock:(os_unfair_lock_s)a3
{
  self->_valueLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_controlType, 0);
  objc_storeStrong((id *)&self->_restrictedInstanceID, 0);
  objc_storeStrong((id *)&self->_disabledInstanceID, 0);
  objc_storeStrong((id *)&self->_errorInstanceID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_responseParameters, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_destroyWeak((id *)&self->_service);
}

- (void)initWithService:(void *)a1 config:.cold.1(void *a1)
{
  id v2 = [a1 pluginID];
  int v9 = [a1 instanceID];
  OUTLINED_FUNCTION_1(&dword_249710000, v3, v4, "Parsing control config from pluginID: %@ service instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);
}

- (void)initWithService:(void *)a1 config:.cold.2(void *a1)
{
  uint64_t v1 = [a1 pluginID];
  OUTLINED_FUNCTION_1(&dword_249710000, v2, v3, "Parsing control config from pluginID: %@ instanceID: %@ failed for controlType", v4, v5, v6, v7, 2u);
}

- (void)initWithService:(os_log_t)log config:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Parsing control failed for sender", v1, 2u);
}

- (void)handleNotificationWithValue:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 pluginID];
  uint64_t v3 = [a1 instanceID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Handle notification pluginID: %@ instanceID: %@ value: %@", v6, v7, v8, v9, v10);
}

- (void)handleRequestWithValue:(void *)a1 withResponse:.cold.1(void *a1)
{
  uint64_t v2 = [a1 pluginID];
  uint64_t v3 = [a1 instanceID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Handle request pluginID: %@ instanceID: %@ value: %@", v6, v7, v8, v9, v10);
}

- (void)handleRegistrationWithInstanceID:(void *)a1 registered:.cold.1(void *a1)
{
  uint64_t v2 = [a1 pluginID];
  uint64_t v3 = [a1 instanceID];
  OUTLINED_FUNCTION_1_0(&dword_249710000, v4, v5, "Handle registration pluginID: %@ instanceID: %@ registered: %@", v6, v7, v8, v9, 2u);
}

@end