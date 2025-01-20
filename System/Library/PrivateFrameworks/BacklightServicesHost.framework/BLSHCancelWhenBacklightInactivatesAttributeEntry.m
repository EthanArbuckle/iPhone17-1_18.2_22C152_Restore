@interface BLSHCancelWhenBacklightInactivatesAttributeEntry
- (BOOL)reactivateIfPossible;
- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5;
- (os_unfair_lock_s)activate;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)cancelIfNeededForBacklightState:(uint64_t)a1;
- (void)deactivate;
- (void)invalidate;
@end

@implementation BLSHCancelWhenBacklightInactivatesAttributeEntry

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BLSHCancelWhenBacklightInactivatesAttributeEntry;
  v5 = [(BLSValidWhenBacklightInactiveAttributeEntry *)&v10 initForAttribute:a3 fromAssertion:a4 forService:a5];
  v6 = v5;
  if (v5)
  {
    v5[10] = 0;
    id v7 = objc_alloc_init(MEMORY[0x263F29970]);
    v8 = (void *)v6[4];
    v6[4] = v7;

    -[BLSHCancelWhenBacklightInactivatesAttributeEntry cancelIfNeededForBacklightState:]((uint64_t)v6, [v7 backlightState]);
  }
  return v6;
}

- (void)cancelIfNeededForBacklightState:(uint64_t)a1
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    int v4 = *(unsigned __int8 *)(a1 + 44);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (a2 != 2)
    {
      if (v4)
      {
        v5 = [(id)a1 service];
        v6 = [(id)a1 assertion];
        id v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v8 = *MEMORY[0x263F29920];
        uint64_t v11 = *MEMORY[0x263F08320];
        v12[0] = @"canceled due to backlight inactive";
        v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        objc_super v10 = [v7 errorWithDomain:v8 code:12 userInfo:v9];
        [v5 cancelAssertion:v6 withError:v10];
      }
    }
  }
}

- (BOOL)reactivateIfPossible
{
  return 1;
}

- (os_unfair_lock_s)activate
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock(result + 10);
    LOBYTE(v1[11]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v1 + 10);
    v2 = *(void **)&v1[8]._os_unfair_lock_opaque;
    return (os_unfair_lock_s *)[v2 addObserver:v1];
  }
  return result;
}

- (void)deactivate
{
  if (a1)
  {
    [*(id *)(a1 + 32) removeObserver:a1];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 44) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)invalidate
{
  if (self) {
    -[BLSHCancelWhenBacklightInactivatesAttributeEntry deactivate]((uint64_t)self);
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
}

- (void).cxx_destruct
{
}

@end