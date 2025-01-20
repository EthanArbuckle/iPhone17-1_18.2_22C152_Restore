@interface EFSchedulerTrampoline
+ (id)trampolineWithScheduler:(id)a3 object:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)_initWithScheduler:(id)a3 object:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation EFSchedulerTrampoline

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 setTarget:self->_object];
  [v4 retainArguments];
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__EFSchedulerTrampoline_forwardInvocation___block_invoke;
  v7[3] = &unk_1E6121B40;
  id v6 = v4;
  id v8 = v6;
  [(EFScheduler *)scheduler performBlock:v7];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EFSchedulerTrampoline;
  v5 = -[EFSchedulerTrampoline methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [self->_object methodSignatureForSelector:a3];
  }
  id v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

uint64_t __43__EFSchedulerTrampoline_forwardInvocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

+ (id)trampolineWithScheduler:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (trampolineWithScheduler_object__onceToken != -1) {
    dispatch_once(&trampolineWithScheduler_object__onceToken, &__block_literal_global_28);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);
  id v8 = [(id)trampolineWithScheduler_object__schedulerTrampolines objectForKey:v6];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    objc_msgSend((id)trampolineWithScheduler_object__schedulerTrampolines, "setObject:forKey:");
  }
  v9 = [v8 objectForKey:v7];
  if (!v9)
  {
    v9 = (void *)[objc_alloc((Class)a1) _initWithScheduler:v6 object:v7];
    [v8 setObject:v9 forKey:v7];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);
  return v9;
}

- (id)_initWithScheduler:(id)a3 object:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EFSchedulerTrampoline.m", 52, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)EFSchedulerTrampoline;
  objc_super v10 = [(EFSchedulerTrampoline *)&v14 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_scheduler, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

void __56__EFSchedulerTrampoline_trampolineWithScheduler_object___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)trampolineWithScheduler_object__schedulerTrampolines;
  trampolineWithScheduler_object__schedulerTrampolines = v0;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  scheduler = self->_scheduler;
  id v6 = [self->_object debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p> scheduler=%@ object=%@", v4, self, scheduler, v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [self->_object description];
  id v6 = [v3 stringWithFormat:@"<%@: %p> object=%@", v4, self, v5];

  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EFSchedulerTrampoline;
  if ([(EFSchedulerTrampoline *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [self->_object conformsToProtocol:v4];
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EFSchedulerTrampoline;
  if (-[EFSchedulerTrampoline respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

@end