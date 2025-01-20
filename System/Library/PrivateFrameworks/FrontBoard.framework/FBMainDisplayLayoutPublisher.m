@interface FBMainDisplayLayoutPublisher
+ (id)sharedInstance;
- (BOOL)isTransitioning;
- (FBMainDisplayLayoutPublisher)init;
- (FBSDisplayLayout)currentLayout;
- (id)_addElement:(id)a3 forKey:(id)a4;
- (id)_initWithPublisher:(id)a3;
- (id)addElement:(id)a3;
- (id)transitionAssertionWithReason:(id)a3;
- (int64_t)backlightLevel;
- (int64_t)interfaceOrientation;
- (void)_updateWithBacklightState:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)flush;
- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setBacklightLevel:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation FBMainDisplayLayoutPublisher

- (id)transitionAssertionWithReason:(id)a3
{
  return (id)[(FBSDisplayLayoutPublisher *)self->_publisher transitionAssertionWithReason:a3];
}

- (void)flush
{
}

- (id)addElement:(id)a3
{
  return (id)[(FBSDisplayLayoutPublisher *)self->_publisher addElement:a3];
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 postNotificationName:@"FBDisplayLayoutDidUpdateNotification" object:&unk_1EFB272F8];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) { {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

- (FBMainDisplayLayoutPublisher)init
{
  v4 = [NSString stringWithFormat:@"init is not allowed on FBMainDisplayLayoutPublisher"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBMainDisplayLayoutPublisher.m";
    __int16 v17 = 1024;
    int v18 = 42;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBMainDisplayLayoutPublisher *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithPublisher:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v22.receiver = self;
    v22.super_class = (Class)FBMainDisplayLayoutPublisher;
    v8 = [(FBMainDisplayLayoutPublisher *)&v22 init];
    p_isa = (id *)&v8->super.isa;
    if (!v8)
    {
LABEL_16:

      return p_isa;
    }
    objc_storeStrong((id *)&v8->_publisher, a3);
    v10 = [p_isa[1] transitionAssertionWithReason:0];
    __int16 v11 = +[FBDisplayManager sharedInstance];
    [v11 addObserver:p_isa];
    id v12 = p_isa[1];
    __int16 v13 = [v11 mainConfiguration];
    [v12 setDisplayConfiguration:v13];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v14 = (void *)getBLSBacklightClass_softClass;
    uint64_t v31 = getBLSBacklightClass_softClass;
    if (!getBLSBacklightClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getBLSBacklightClass_block_invoke;
      v26 = &unk_1E5C496D8;
      v27 = &v28;
      __getBLSBacklightClass_block_invoke((uint64_t)&v23);
      v14 = (void *)v29[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v28, 8);
    v16 = [v15 sharedBacklight];
    if (v16)
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2050000000;
      __int16 v17 = (void *)getBLSRuntimeClass_softClass;
      uint64_t v31 = getBLSRuntimeClass_softClass;
      if (!getBLSRuntimeClass_softClass)
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        v25 = __getBLSRuntimeClass_block_invoke;
        v26 = &unk_1E5C496D8;
        v27 = &v28;
        __getBLSRuntimeClass_block_invoke((uint64_t)&v23);
        __int16 v17 = (void *)v29[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v28, 8);
      if ([v18 isHostProcess])
      {
        [v16 addObserver:p_isa];
        objc_msgSend(p_isa, "_updateWithBacklightState:", objc_msgSend(v16, "backlightState"));
LABEL_15:
        [p_isa[1] addObserver:p_isa];
        [p_isa[1] activate];
        [v10 invalidate];

        goto LABEL_16;
      }
      __int16 v19 = FBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) { {
        -[FBMainDisplayLayoutPublisher _initWithPublisher:](v19);
      }
      }
    }
    else
    {
      __int16 v19 = FBLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) { {
        -[FBMainDisplayLayoutPublisher _initWithPublisher:](v19);
      }
      }
    }

    [p_isa[1] setBacklightLevel:100];
    goto LABEL_15;
  }
  v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"publisher"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    [(FBMainDisplayLayoutPublisher *)a2 _initWithPublisher:(uint64_t)v21];
  }
  }
  [v21 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  v4 = [NSString stringWithFormat:@"FBMainDisplayLayoutPublisher is a singleton"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    int v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    id v15 = @"FBMainDisplayLayoutPublisher.m";
    __int16 v16 = 1024;
    int v17 = 84;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __46__FBMainDisplayLayoutPublisher_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F628B8] bootstrapConfiguration];
  v1 = [MEMORY[0x1E4F62848] environmentAliases];
  v2 = [MEMORY[0x1E4F62888] defaultShellMachName];
  v3 = [v1 resolveMachService:v2];
  v4 = [v0 domainForMachName:v3];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F62940] serviceIdentifier];
    id v6 = [v4 serviceForIdentifier:v5];

    if (v6)
    {
      v7 = objc_opt_new();
      int v8 = [v4 identifier];
      [v7 setDomainIdentifier:v8];

      int v9 = [MEMORY[0x1E4F62940] mainDisplayInstanceIdentifier];
      [v7 setInstanceIdentifier:v9];

      __int16 v10 = [FBMainDisplayLayoutPublisher alloc];
      __int16 v11 = [MEMORY[0x1E4F62960] publisherWithConfiguration:v7];
      uint64_t v12 = [(FBMainDisplayLayoutPublisher *)v10 _initWithPublisher:v11];
      __int16 v13 = (void *)sharedInstance___sharedInstance;
      sharedInstance___sharedInstance = v12;
    }
    else
    {
      v7 = FBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "No layout monitor service specified. This process will not publish layout for the main display.", v14, 2u);
      }
    }
  }
}

- (int64_t)interfaceOrientation
{
  return [(FBSDisplayLayoutPublisher *)self->_publisher interfaceOrientation];
}

- (void)setInterfaceOrientation:(int64_t)a3
{
}

- (int64_t)backlightLevel
{
  return [(FBSDisplayLayoutPublisher *)self->_publisher backlightLevel];
}

- (void)setBacklightLevel:(int64_t)a3
{
}

- (BOOL)isTransitioning
{
  return [(FBSDisplayLayoutPublisher *)self->_publisher isTransitioning];
}

- (FBSDisplayLayout)currentLayout
{
  return (FBSDisplayLayout *)[(FBSDisplayLayoutPublisher *)self->_publisher currentLayout];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_updateWithBacklightState:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) { {
    [(FBSDisplayLayoutPublisher *)self->_publisher setBacklightLevel:qword_1A6386378[a3]];
  }
  }
  publisher = self->_publisher;

  [(FBSDisplayLayoutPublisher *)publisher setBacklightState:a3];
}

- (id)_addElement:(id)a3 forKey:(id)a4
{
  return (id)[(FBSDisplayLayoutPublisher *)self->_publisher _addElement:a3 forKey:a4];
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v10 = a5;
  id v8 = a4;
  id v9 = [a3 mainIdentity];

  if (v9 == v8) { {
    [(FBSDisplayLayoutPublisher *)self->_publisher setDisplayConfiguration:v10];
  }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9 = self->_backlightTransition;
  backlightTransition = self->_backlightTransition;
  self->_backlightTransition = 0;

  if (!v9)
  {
    id v9 = [(FBSDisplayLayoutPublisher *)self->_publisher transitionAssertionWithReason:@"BLSBacklight"];
  }
  [(FBMainDisplayLayoutPublisher *)self _updateWithBacklightState:a4];
  [(BSInvalidatable *)v9 invalidate];
}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  publisher = self->_publisher;
  id v10 = self->_backlightTransition;
  id v8 = [(FBSDisplayLayoutPublisher *)publisher transitionAssertionWithReason:@"BLSBacklight"];
  backlightTransition = self->_backlightTransition;
  self->_backlightTransition = v8;

  [(FBMainDisplayLayoutPublisher *)self _updateWithBacklightState:a4];
  [(BSInvalidatable *)v10 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)_initWithPublisher:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"FBMainDisplayLayoutPublisher.m";
  __int16 v16 = 1024;
  int v17 = 47;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_initWithPublisher:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "[FBMainDisplayLayoutPublisher] Unable to create BLSBacklight. Main display backlight updates are unavilable.", v1, 2u);
}

- (void)_initWithPublisher:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "[FBMainDisplayLayoutPublisher] This process is not a BacklightServices host process. Main display backlight updates are unavilable.", v1, 2u);
}

@end