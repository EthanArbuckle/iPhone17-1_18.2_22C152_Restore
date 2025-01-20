@interface _SGDCloudKitSyncPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)properties;
- (CKRecordID)saltAtomicReferenceId;
- (CKServerChangeToken)syncToken;
- (NSData)salt;
- (NSNumber)eventsWereRemovedFromEventKit;
- (NSNumber)hasDeferredProcessStateChanges;
- (NSNumber)hasDeferredSync;
- (NSNumber)hasSubscription;
- (NSNumber)saltUsesManatee;
- (NSString)primaryICloudCalendarAccount;
- (SEL)_getterForProperty:(objc_property *)a3;
- (SEL)_setterForProperty:(objc_property *)a3;
- (_SGDCloudKitSyncPersistedState)init;
- (_SGDCloudKitSyncPersistedState)initWithCoder:(id)a3;
- (id)changeCallback;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setChangeCallback:(id)a3;
- (void)setEventsWereRemovedFromEventKit:(id)a3;
- (void)setHasDeferredProcessStateChanges:(id)a3;
- (void)setHasDeferredSync:(id)a3;
- (void)setHasSubscription:(id)a3;
- (void)setPrimaryICloudCalendarAccount:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSaltAtomicReferenceId:(id)a3;
- (void)setSaltUsesManatee:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setupKvo;
- (void)stopKvo;
@end

@implementation _SGDCloudKitSyncPersistedState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSaltUsesManatee:(id)a3
{
}

- (void)setSaltAtomicReferenceId:(id)a3
{
}

- (void)setSalt:(id)a3
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (_SGDCloudKitSyncPersistedState *)a4;
  id v11 = a5;
  if (v10 == self)
  {
    v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "SGCK Persisted state changed (keyPath: %@, change: %@, self: %@)", (uint8_t *)&v15, 0x20u);
    }

    v13 = [(_SGDCloudKitSyncPersistedState *)v10 changeCallback];

    if (v13)
    {
      v14 = [(_SGDCloudKitSyncPersistedState *)v10 changeCallback];
      ((void (**)(void, _SGDCloudKitSyncPersistedState *))v14)[2](v14, v10);
    }
  }
}

- (id)changeCallback
{
  return self->_changeCallback;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = +[_SGDCloudKitSyncPersistedState properties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        id v11 = (objc_class *)objc_opt_class();
        id v12 = [v10 second];
        objc_property_t Property = class_getProperty(v11, (const char *)[v12 UTF8String]);

        if (!Property)
        {
          __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 211, @"Invalid parameter not satisfying: %@", @"objcProperty != nil" object file lineNumber description];
        }
        v14 = [(_SGDCloudKitSyncPersistedState *)self _getterForProperty:Property];
        int v15 = ((void (*)(_SGDCloudKitSyncPersistedState *, const char *))[(_SGDCloudKitSyncPersistedState *)self methodForSelector:v14])(self, v14);
        id v16 = [v10 second];
        [v4 encodeObject:v15 forKey:v16];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (SEL)_getterForProperty:(objc_property *)a3
{
  if (!a3)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 119, @"Invalid parameter not satisfying: %@", @"property" object file lineNumber description];
  }
  id v4 = property_copyAttributeValue(a3, "G");
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = sel_registerName(v4);
    free(v5);
    return v6;
  }
  else
  {
    Name = property_getName(a3);
    return sel_registerName(Name);
  }
}

- (NSNumber)eventsWereRemovedFromEventKit
{
  return self->_eventsWereRemovedFromEventKit;
}

- (CKServerChangeToken)syncToken
{
  return self->_syncToken;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSNumber)saltUsesManatee
{
  return self->_saltUsesManatee;
}

- (CKRecordID)saltAtomicReferenceId
{
  return self->_saltAtomicReferenceId;
}

- (NSString)primaryICloudCalendarAccount
{
  return self->_primaryICloudCalendarAccount;
}

- (NSNumber)hasSubscription
{
  return self->_hasSubscription;
}

- (NSNumber)hasDeferredSync
{
  return self->_hasDeferredSync;
}

- (NSNumber)hasDeferredProcessStateChanges
{
  return self->_hasDeferredProcessStateChanges;
}

+ (id)properties
{
  if (properties__pasOnceToken3 != -1) {
    dispatch_once(&properties__pasOnceToken3, &__block_literal_global_19007);
  }
  v2 = (void *)properties__pasExprOnceResult;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasDeferredProcessStateChanges, 0);
  objc_storeStrong((id *)&self->_hasDeferredSync, 0);
  objc_storeStrong((id *)&self->_primaryICloudCalendarAccount, 0);
  objc_storeStrong((id *)&self->_eventsWereRemovedFromEventKit, 0);
  objc_storeStrong((id *)&self->_hasSubscription, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_saltUsesManatee, 0);
  objc_storeStrong((id *)&self->_saltAtomicReferenceId, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong(&self->_changeCallback, 0);
}

- (void)setHasDeferredProcessStateChanges:(id)a3
{
}

- (void)setHasDeferredSync:(id)a3
{
}

- (void)setPrimaryICloudCalendarAccount:(id)a3
{
}

- (void)setEventsWereRemovedFromEventKit:(id)a3
{
}

- (void)setHasSubscription:(id)a3
{
}

- (void)setSyncToken:(id)a3
{
}

- (void)setChangeCallback:(id)a3
{
}

- (id)description
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = +[_SGDCloudKitSyncPersistedState properties];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        v10 = (objc_class *)objc_opt_class();
        id v11 = [v9 second];
        objc_property_t Property = class_getProperty(v10, (const char *)[v11 UTF8String]);

        if (!Property)
        {
          __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 224, @"Invalid parameter not satisfying: %@", @"objcProperty != nil" object file lineNumber description];
        }
        v13 = [(_SGDCloudKitSyncPersistedState *)self _getterForProperty:Property];
        v14 = ((void (*)(_SGDCloudKitSyncPersistedState *, const char *))[(_SGDCloudKitSyncPersistedState *)self methodForSelector:v13])(self, v13);
        int v15 = v14;
        if (!v14)
        {
          v2 = [MEMORY[0x1E4F1CA98] null];
          int v15 = v2;
        }
        id v16 = [v9 second];
        [v4 setObject:v15 forKeyedSubscript:v16];

        if (!v14) {
        ++v8;
        }
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  id v18 = [NSString alloc];
  v25.receiver = self;
  v25.super_class = (Class)_SGDCloudKitSyncPersistedState;
  long long v19 = [(_SGDCloudKitSyncPersistedState *)&v25 description];
  long long v20 = [v4 description];
  long long v21 = (void *)[v18 initWithFormat:@"<%@ %@>", v19, v20];

  return v21;
}

- (void)stopKvo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = +[_SGDCloudKitSyncPersistedState properties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) second];
        [(_SGDCloudKitSyncPersistedState *)self removeObserver:self forKeyPath:v8 context:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setupKvo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = +[_SGDCloudKitSyncPersistedState properties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) second];
        [(_SGDCloudKitSyncPersistedState *)self addObserver:self forKeyPath:v8 options:0 context:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  [(_SGDCloudKitSyncPersistedState *)self stopKvo];
  v3.receiver = self;
  v3.super_class = (Class)_SGDCloudKitSyncPersistedState;
  [(_SGDCloudKitSyncPersistedState *)&v3 dealloc];
}

- (_SGDCloudKitSyncPersistedState)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SGDCloudKitSyncPersistedState;
  uint64_t v6 = [(_SGDCloudKitSyncPersistedState *)&v30 init];
  if (v6)
  {
    SEL v25 = a2;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = +[_SGDCloudKitSyncPersistedState properties];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v13 = [v12 first];
          Class v14 = NSClassFromString(v13);

          if (!v14)
          {
            v23 = sgLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v12;
              _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "_SGDCloudKitSyncPersistedState got invalid class name in property: %@", buf, 0xCu);
            }

            long long v22 = 0;
            goto LABEL_17;
          }
          int v15 = [v12 second];
          id v16 = [v5 decodeObjectOfClass:v14 forKey:v15];

          __int16 v17 = (objc_class *)objc_opt_class();
          id v18 = [v12 second];
          objc_property_t Property = class_getProperty(v17, (const char *)[v18 UTF8String]);

          if (!Property)
          {
            long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:v25, v6, @"SGDCloudKitSync.m", 164, @"Invalid parameter not satisfying: %@", @"objcProperty != nil" object file lineNumber description];
          }
          uint64_t v20 = [(_SGDCloudKitSyncPersistedState *)v6 _setterForProperty:Property];
          ((void (*)(_SGDCloudKitSyncPersistedState *, uint64_t, void *))[(_SGDCloudKitSyncPersistedState *)v6 methodForSelector:v20])(v6, v20, v16);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(_SGDCloudKitSyncPersistedState *)v6 setupKvo];
  }
  long long v22 = v6;
LABEL_17:

  return v22;
}

- (SEL)_setterForProperty:(objc_property *)a3
{
  uint64_t v6 = property_copyAttributeValue(a3, "S");
  if (!v6)
  {
    Name = property_getName(a3);
    size_t v8 = strlen(Name) + 5;
    uint64_t v9 = (char *)malloc_type_malloc(v8, 0xE90D5EADuLL);
    if (!v9)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v17);
    }
    uint64_t v6 = v9;
    int v12 = *(unsigned __int8 *)Name;
    long long v11 = Name + 1;
    char v10 = v12;
    char v13 = v12 - 32;
    if ((v12 - 97) < 0x1A) {
      char v10 = v13;
    }
    if (snprintf(v9, v8, "set%c%s:", v10, v11) < 0)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"SGDCloudKitSync.m", 143, @"Invalid parameter not satisfying: %@", @"snprintfResult >= 0" object file lineNumber description];
    }
  }
  Class v14 = sel_registerName(v6);
  free(v6);
  return v14;
}

- (_SGDCloudKitSyncPersistedState)init
{
  v5.receiver = self;
  v5.super_class = (Class)_SGDCloudKitSyncPersistedState;
  v2 = [(_SGDCloudKitSyncPersistedState *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(_SGDCloudKitSyncPersistedState *)v2 setupKvo];
  }
  return v3;
}

@end