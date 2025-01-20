@interface HMFUnfairLock
+ (id)lock;
+ (id)lockWithOptions:(unint64_t)a3;
- (HMFUnfairLock)init;
- (HMFUnfairLock)initWithOptions:(unint64_t)a3;
- (unint64_t)options;
- (void)assertNotOwner;
- (void)assertOwner;
- (void)lock;
- (void)performBlock:(id)a3;
- (void)unlock;
@end

@implementation HMFUnfairLock

+ (id)lock
{
  return (id)[a1 lockWithOptions:0];
}

+ (id)lockWithOptions:(unint64_t)a3
{
  v3 = off_1E5957358;
  if ((a3 & 2) != 0) {
    v3 = &off_1E5957360;
  }
  v4 = (void *)[objc_alloc(*v3) initWithOptions:a3];
  return v4;
}

- (HMFUnfairLock)initWithOptions:(unint64_t)a3
{
  v4 = self;
  if ([(HMFUnfairLock *)self isMemberOfClass:objc_opt_class()])
  {
    v5 = +[HMFUnfairLock lockWithOptions:a3];
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)HMFUnfairLock;
    v6 = [(HMFUnfairLock *)&v9 init];
    if (v6) {
      v6->_options = a3;
    }
    v5 = v6;
    v4 = v5;
  }
  v7 = v5;

  return v7;
}

- (void)lock
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)unlock
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)assertOwner
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)assertNotOwner
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFUnfairLock)init
{
  return [(HMFUnfairLock *)self initWithOptions:0];
}

- (void)performBlock:(id)a3
{
  v5 = (void (**)(void))a3;
  if (v5)
  {
    v4 = self;
    [(HMFUnfairLock *)v4 lock];
    v5[2]();
    [(HMFUnfairLock *)v4 unlock];
  }
}

- (unint64_t)options
{
  return self->_options;
}

@end