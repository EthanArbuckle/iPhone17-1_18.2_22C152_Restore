@interface MPUApplicationDefaults
- (BOOL)BOOLForKey:(id)a3;
- (MPUApplicationDefaults)initWithApplicationIdentifier:(id)a3;
- (__CFString)_defaultsDomain;
- (id)_defaultsDidChangeNotificationName;
- (id)_objectForKey:(id)a3 expectedTypeID:(unint64_t)a4;
- (id)arrayForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)numberForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)_applyUpdates;
- (void)_defaultsDidChange;
- (void)_setObject:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)performBatchUpdates:(id)a3;
- (void)registerDefaults:(id)a3;
- (void)removeValueForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
@end

@implementation MPUApplicationDefaults

- (MPUApplicationDefaults)initWithApplicationIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUApplicationDefaults;
  v6 = [(MPUApplicationDefaults *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayerUI.MPUApplicationDefaults.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_applicationIdentifier, a3);
    v9 = [(MPUApplicationDefaults *)v6 _defaultsDidChangeNotificationName];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_MPUApplicationDefaultsDidChangeNotification, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(MPUApplicationDefaults *)self _defaultsDidChangeNotificationName];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v3, 0);

  v5.receiver = self;
  v5.super_class = (Class)MPUApplicationDefaults;
  [(MPUApplicationDefaults *)&v5 dealloc];
}

- (void)registerDefaults:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__MPUApplicationDefaults_registerDefaults___block_invoke;
  v7[3] = &unk_2647C2598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(accessQueue, v7);
}

void __43__MPUApplicationDefaults_registerDefaults___block_invoke(uint64_t a1)
{
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFBooleanGetTypeID()];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__MPUApplicationDefaults_BOOLForKey___block_invoke;
    block[3] = &unk_2647C25C0;
    v14 = &v15;
    block[4] = self;
    CFStringRef v9 = (const __CFString *)v4;
    v13 = (__CFString *)v9;
    dispatch_sync(accessQueue, block);
    v10 = [(MPUApplicationDefaults *)self _defaultsDomain];
    CFPreferencesSetAppValue(v9, (CFPropertyListRef)v16[5], v10);
    char v7 = [(id)v16[5] BOOLValue];

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

uint64_t __37__MPUApplicationDefaults_BOOLForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  id v4 = (void *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v4 = (void *)MEMORY[0x263EFFB38];
  }
  [(MPUApplicationDefaults *)self _setObject:*v4 forKey:a4];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFStringGetTypeID()];

  return v5;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFArrayGetTypeID()];

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFDictionaryGetTypeID()];

  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFNumberGetTypeID()];
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 integerValue];
  }
  else
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__MPUApplicationDefaults_integerForKey___block_invoke;
    block[3] = &unk_2647C25C0;
    v14 = &v15;
    block[4] = self;
    CFStringRef v9 = (const __CFString *)v4;
    v13 = (__CFString *)v9;
    dispatch_sync(accessQueue, block);
    v10 = [(MPUApplicationDefaults *)self _defaultsDomain];
    CFPreferencesSetAppValue(v9, (CFPropertyListRef)v16[5], v10);
    int64_t v7 = [(id)v16[5] integerValue];

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

uint64_t __40__MPUApplicationDefaults_integerForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFNumberGetTypeID()];

  return v5;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(MPUApplicationDefaults *)self _setObject:v8 forKey:v7];
}

- (id)dateForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MPUApplicationDefaults *)self _objectForKey:v4 expectedTypeID:CFDateGetTypeID()];

  return v5;
}

- (void)removeValueForKey:(id)a3
{
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = (void (**)(void))a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MPUApplicationDefaults_performBatchUpdates___block_invoke;
  block[3] = &unk_2647C25E8;
  block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
  v4[2](v4);
  uint64_t v8 = 0;
  CFStringRef v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__MPUApplicationDefaults_performBatchUpdates___block_invoke_2;
  v7[3] = &unk_2647C2610;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_barrier_sync(v6, v7);
  if (*((unsigned char *)v9 + 24)) {
    [(MPUApplicationDefaults *)self _applyUpdates];
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __46__MPUApplicationDefaults_performBatchUpdates___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __46__MPUApplicationDefaults_performBatchUpdates___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = --*(void *)(*(void *)(result + 32) + 32) == 0;
  return result;
}

- (void)_applyUpdates
{
  v3 = [(MPUApplicationDefaults *)self _defaultsDomain];
  id v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__MPUApplicationDefaults__applyUpdates__block_invoke;
  v5[3] = &unk_2647C2638;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);
}

void __39__MPUApplicationDefaults__applyUpdates__block_invoke(uint64_t a1)
{
  CFPreferencesAppSynchronize(*(CFStringRef *)(a1 + 40));
  name = [*(id *)(a1 + 32) _defaultsDidChangeNotificationName];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (__CFString)_defaultsDomain
{
  return (__CFString *)self->_applicationIdentifier;
}

- (id)_defaultsDidChangeNotificationName
{
  return [(NSString *)self->_applicationIdentifier stringByAppendingString:@"-prefsChanged"];
}

- (void)_defaultsDidChange
{
  CFPreferencesAppSynchronize([(MPUApplicationDefaults *)self _defaultsDomain]);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"MPUApplicationDefaultsDidChangeNotification" object:self];
}

- (id)_objectForKey:(id)a3 expectedTypeID:(unint64_t)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (void *)CFPreferencesCopyAppValue(v6, [(MPUApplicationDefaults *)self _defaultsDomain]);

  if (v7 && CFGetTypeID(v7) != a4)
  {
    CFRelease(v7);
    id v7 = 0;
  }
  return v7;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, [(MPUApplicationDefaults *)self _defaultsDomain]);
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__MPUApplicationDefaults__setObject_forKey___block_invoke;
  v9[3] = &unk_2647C2660;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_barrier_sync(accessQueue, v9);
  if (*((unsigned char *)v11 + 24)) {
    [(MPUApplicationDefaults *)self _applyUpdates];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __44__MPUApplicationDefaults__setObject_forKey___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32) == 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end