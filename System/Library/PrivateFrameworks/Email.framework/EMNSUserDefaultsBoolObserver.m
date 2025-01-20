@interface EMNSUserDefaultsBoolObserver
- (BOOL)isEnabled;
- (EMNSUserDefaultsBoolObserver)initWithUserDefaultKey:(id)a3 keyRepresentsDisabled:(BOOL)a4 handler:(id)a5;
- (EMNSUserDefaultsBoolObserver)initWithUserDefaults:(id)a3 keyPath:(id)a4 keyRepresentsDisabled:(BOOL)a5 handler:(id)a6;
- (uint64_t)_getEnabledWithUserDefaults:(void *)a3 keyPath:(int)a4 keyRepresentsDisabled:;
@end

@implementation EMNSUserDefaultsBoolObserver

- (EMNSUserDefaultsBoolObserver)initWithUserDefaultKey:(id)a3 keyRepresentsDisabled:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v11 = [(EMNSUserDefaultsBoolObserver *)self initWithUserDefaults:v10 keyPath:v8 keyRepresentsDisabled:v6 handler:v9];

  return v11;
}

- (EMNSUserDefaultsBoolObserver)initWithUserDefaults:(id)a3 keyPath:(id)a4 keyRepresentsDisabled:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)EMNSUserDefaultsBoolObserver;
  v13 = [(EMNSUserDefaultsBoolObserver *)&v25 init];
  v14 = v13;
  if (v13)
  {
    v13->_enabled = -[EMNSUserDefaultsBoolObserver _getEnabledWithUserDefaults:keyPath:keyRepresentsDisabled:]((uint64_t)v13, v10, v11, v7);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__EMNSUserDefaultsBoolObserver_initWithUserDefaults_keyPath_keyRepresentsDisabled_handler___block_invoke;
    v18[3] = &unk_1E63E5AF0;
    objc_copyWeak(&v22, &location);
    id v19 = v10;
    id v20 = v11;
    BOOL v23 = v7;
    id v21 = v12;
    uint64_t v15 = objc_msgSend(v19, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v20, 1, 1, v18);
    observationToken = v14->_observationToken;
    v14->_observationToken = (EFCancelable *)v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (uint64_t)_getEnabledWithUserDefaults:(void *)a3 keyPath:(int)a4 keyRepresentsDisabled:
{
  id v7 = a2;
  id v8 = a3;
  if (a1) {
    uint64_t v9 = [v7 BOOLForKey:v8] ^ a4;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

void __91__EMNSUserDefaultsBoolObserver_initWithUserDefaults_keyPath_keyRepresentsDisabled_handler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[16] = -[EMNSUserDefaultsBoolObserver _getEnabledWithUserDefaults:keyPath:keyRepresentsDisabled:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end