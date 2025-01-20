@interface EDPersistenceHookRegistry
+ (OS_os_log)log;
+ (id)_proxiedProtocols;
- (BOOL)respondsToSelector:(SEL)a3;
- (EDPersistenceHookRegistry)init;
- (id)_copyRespondersForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_initializeMethodSignatures;
- (void)_messageRespondersWithInvocation:(id)a3;
- (void)_registerHookResponder:(id)a3 protocol:(id)a4;
- (void)_registerHookResponder:(id)a3 withMethodDescription:(objc_method_description)a4;
- (void)_registerSelector:(objc_method_description)a3;
- (void)dealloc;
- (void)registerAccountChangeHookResponder:(id)a3;
- (void)registerActivityHookResponder:(id)a3;
- (void)registerBrandIndicatorChangeHookResponder:(id)a3;
- (void)registerBusinessChangeHookResponder:(id)a3;
- (void)registerCategoryChangeHookResponder:(id)a3;
- (void)registerCloudStorageChangeHookResponder:(id)a3;
- (void)registerDatabaseChangeHookResponder:(id)a3;
- (void)registerMailboxChangeHookResponder:(id)a3;
- (void)registerMessageChangeHookResponder:(id)a3;
- (void)registerMessageDeliveryHookResponder:(id)a3;
- (void)registerOneTimeCodeChangeHookResponder:(id)a3;
- (void)registerProtectedDataReconciliationHookResponder:(id)a3;
- (void)registerSearchableIndexHookResponder:(id)a3;
- (void)registerSenderBucketChangeHookResponder:(id)a3;
- (void)registerThreadChangeHookResponder:(id)a3;
- (void)unregisterAllHookResponders;
- (void)unregisterHookResponder:(id)a3;
@end

@implementation EDPersistenceHookRegistry

- (void)_registerHookResponder:(id)a3 protocol:(id)a4
{
  unsigned int outCount = -1431655766;
  v8 = protocol_copyMethodDescriptionList((Protocol *)a4, 1, 1, &outCount);
  unsigned int v14 = -1431655766;
  v9 = protocol_copyMethodDescriptionList((Protocol *)a4, 0, 1, &v14);
  os_unfair_lock_lock(&self->_lock);
  if (outCount)
  {
    unint64_t v10 = 0;
    v11 = v8;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPersistenceHookRegistry.m", 181, @"Invalid parameter not satisfying: %@", @"[hookResponder respondsToSelector:requiredMethod]");
      }
      -[EDPersistenceHookRegistry _registerHookResponder:withMethodDescription:](self, "_registerHookResponder:withMethodDescription:", a3, v11->name, v11->types);
      ++v10;
      ++v11;
    }
    while (v10 < outCount);
  }
  if (v14)
  {
    unint64_t v12 = 0;
    v13 = v9;
    do
    {
      if (objc_opt_respondsToSelector()) {
        -[EDPersistenceHookRegistry _registerHookResponder:withMethodDescription:](self, "_registerHookResponder:withMethodDescription:", a3, v13->name, v13->types);
      }
      ++v12;
      ++v13;
    }
    while (v12 < v14);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8) {
    free(v8);
  }
  if (v9) {
    free(v9);
  }
}

- (void)_registerHookResponder:(id)a3 withMethodDescription:(objc_method_description)a4
{
  SEL name = a4.name;
  Value = (void *)CFDictionaryGetValue(self->_hookRespondersBySelector, a4.name);
  if (!Value)
  {
    Value = (void *)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
    CFDictionarySetValue(self->_hookRespondersBySelector, name, Value);
  }

  [Value addObject:a3];
}

- (void)registerMessageChangeHookResponder:(id)a3
{
}

- (void)registerMailboxChangeHookResponder:(id)a3
{
}

- (void)registerCategoryChangeHookResponder:(id)a3
{
}

- (void)registerOneTimeCodeChangeHookResponder:(id)a3
{
}

- (void)registerThreadChangeHookResponder:(id)a3
{
}

- (void)registerAccountChangeHookResponder:(id)a3
{
}

- (void)registerProtectedDataReconciliationHookResponder:(id)a3
{
}

- (void)registerActivityHookResponder:(id)a3
{
}

- (void)unregisterHookResponder:(id)a3
{
  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0190280](self, a2);
    os_unfair_lock_lock(&self->_lock);
    id context = a3;
    CFDictionaryApplyFunction(self->_hookRespondersBySelector, (CFDictionaryApplierFunction)_unregistrationWalker, &context);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EDPersistenceHookRegistry;
  return -[EDPersistenceHookRegistry respondsToSelector:](&v6, sel_respondsToSelector_)
      || CFDictionaryGetValue(self->_methodSignaturesBySelector, a3) != 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = (id)CFDictionaryGetValue(self->_methodSignaturesBySelector, a3);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)EDPersistenceHookRegistry;
    return [(EDPersistenceHookRegistry *)&v6 methodSignatureForSelector:a3];
  }
  return result;
}

- (void)_messageRespondersWithInvocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = -[EDPersistenceHookRegistry _copyRespondersForSelector:](self, "_copyRespondersForSelector:", [a3 selector]);
  v5 = +[EDPersistenceHookRegistry log];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    [(EDPersistenceHookRegistry *)a3 _messageRespondersWithInvocation:v5];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1E0190280]();
        [a3 invokeWithTarget:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_copyRespondersForSelector:(SEL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (id)objc_msgSend((id)CFDictionaryGetValue(self->_hookRespondersBySelector, a3), "setRepresentation");
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__EDPersistenceHookRegistry_log__block_invoke;
  block[3] = &unk_1E6C04518;
  block[4] = a1;
  if (log_onceToken_70 != -1) {
    dispatch_once(&log_onceToken_70, block);
  }
  return (OS_os_log *)log_log_70;
}

+ (id)_proxiedProtocols
{
  v3[15] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1F35BC958;
  v3[1] = &unk_1F35BCCD8;
  v3[2] = &unk_1F35FE6A8;
  v3[3] = &unk_1F35E9BC8;
  v3[4] = &unk_1F35CFAF0;
  v3[5] = &unk_1F35BE740;
  v3[6] = &unk_1F35CAC50;
  v3[7] = &unk_1F35C0928;
  v3[8] = &unk_1F35FE708;
  v3[9] = &unk_1F35DD148;
  v3[10] = &unk_1F35BF6E8;
  v3[11] = &unk_1F35CABD0;
  v3[12] = &unk_1F35FE768;
  v3[13] = &unk_1F35D39D0;
  v3[14] = &unk_1F35FE7C8;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:15];
}

os_log_t __32__EDPersistenceHookRegistry_log__block_invoke(uint64_t a1)
{
  v1 = [NSStringFromClass(*(Class *)(a1 + 32)) UTF8String];
  os_log_t result = os_log_create("com.apple.email", v1);
  log_log_70 = (uint64_t)result;
  return result;
}

- (EDPersistenceHookRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDPersistenceHookRegistry;
  v2 = [(EDPersistenceHookRegistry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    v2->_hookRespondersBySelector = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
    v3->_methodSignaturesBySelector = CFDictionaryCreateMutable(0, 0, 0, v4);
    [(EDPersistenceHookRegistry *)v3 _initializeMethodSignatures];
  }
  return v3;
}

- (void)dealloc
{
  hookRespondersBySelector = self->_hookRespondersBySelector;
  if (hookRespondersBySelector) {
    CFRelease(hookRespondersBySelector);
  }
  methodSignaturesBySelector = self->_methodSignaturesBySelector;
  if (methodSignaturesBySelector) {
    CFRelease(methodSignaturesBySelector);
  }
  v5.receiver = self;
  v5.super_class = (Class)EDPersistenceHookRegistry;
  [(EDPersistenceHookRegistry *)&v5 dealloc];
}

- (void)_initializeMethodSignatures
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = (void *)[(id)objc_opt_class() _proxiedProtocols];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(Protocol **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int outCount = -1431655766;
        uint64_t v9 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
        unsigned int v15 = -1431655766;
        uint64_t v10 = protocol_copyMethodDescriptionList(v8, 0, 1, &v15);
        if (outCount)
        {
          unint64_t v11 = 0;
          p_types = &v9->types;
          do
          {
            -[EDPersistenceHookRegistry _registerSelector:](self, "_registerSelector:", *(p_types - 1), *p_types);
            ++v11;
            p_types += 2;
          }
          while (v11 < outCount);
        }
        if (v15)
        {
          unint64_t v13 = 0;
          long long v14 = &v10->types;
          do
          {
            -[EDPersistenceHookRegistry _registerSelector:](self, "_registerSelector:", *(v14 - 1), *v14);
            ++v13;
            v14 += 2;
          }
          while (v13 < v15);
        }
        if (v9) {
          free(v9);
        }
        if (v10) {
          free(v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)_registerSelector:(objc_method_description)a3
{
  types = a3.types;
  SEL name = a3.name;
  if (!a3.types) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDPersistenceHookRegistry.m", 119, objc_msgSend(NSString, "stringWithFormat:", @"Unable to initialize Hook Registry. Found no types for selector: %@", NSStringFromSelector(a3.name)));
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  uint64_t v7 = [v6 numberOfArguments];
  uint64_t v8 = (void (*)(void))__HookResponderCallOut0__;
  if (v7 == 2)
  {
LABEL_4:
    uint64_t v9 = v8;
LABEL_5:
    uint64_t v10 = (objc_class *)objc_opt_class();
    class_addMethod(v10, name, v9, types);
  }
  else
  {
    uint64_t v11 = v7;
    unint64_t v12 = v7 - 3;
    if ((unint64_t)(v7 - 3) <= 3)
    {
      uint64_t v13 = 2;
      while (1)
      {
        uint64_t v14 = [v6 _classForObjectAtArgumentIndex:v13];
        if (!(v14 | [v6 _protocolsForObjectAtArgumentIndex:v13])) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v8 = (void (*)(void))__HookResponderCallOut4__;
          if (v12 >= 3) {
            goto LABEL_4;
          }
          uint64_t v9 = (void (*)(void))off_1F3582C20[v12];
          goto LABEL_5;
        }
      }
      if (v11 == 4)
      {
        int v15 = strcmp((const char *)[v6 getArgumentTypeAtIndex:3], "B");
        uint64_t v8 = (void (*)(void))__HookResponderCallOut1WithBool__;
        if (!v15) {
          goto LABEL_4;
        }
      }
    }
  }
  methodSignaturesBySelector = self->_methodSignaturesBySelector;

  CFDictionarySetValue(methodSignaturesBySelector, name, v6);
}

- (void)unregisterAllHookResponders
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFDictionaryRemoveAllValues(self->_hookRespondersBySelector);

  os_unfair_lock_unlock(p_lock);
}

- (void)registerDatabaseChangeHookResponder:(id)a3
{
}

- (void)registerSearchableIndexHookResponder:(id)a3
{
}

- (void)registerBusinessChangeHookResponder:(id)a3
{
}

- (void)registerMessageDeliveryHookResponder:(id)a3
{
}

- (void)registerCloudStorageChangeHookResponder:(id)a3
{
}

- (void)registerBrandIndicatorChangeHookResponder:(id)a3
{
}

- (void)registerSenderBucketChangeHookResponder:(id)a3
{
}

- (void)_messageRespondersWithInvocation:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = NSStringFromSelector((SEL)[a1 selector]);
  __int16 v7 = 2114;
  uint64_t v8 = a2;
}

@end