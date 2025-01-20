@interface BKSHIDEventDeferringChainObserverPredicate
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)new;
- (BKSHIDEventDeferringChainObserverPredicate)init;
- (BKSHIDEventDeferringChainObserverPredicate)initWithCoder:(id)a3;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDisplay)display;
- (BOOL)isEqual:(id)a3;
- (id)_initWithCopyOf:(id *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_init;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringChainObserverPredicate

- (id)_initWithCopyOf:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[BKSHIDEventDeferringChainObserverPredicate _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      objc_storeStrong(a1 + 2, v3[2]);
    }
  }

  return a1;
}

- (void)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:sel__init object:v1 file:@"BKSHIDEventDeferringChainObserverPredicate.m" lineNumber:50 description:@"BKSHIDEventDeferringChainObserverPredicate cannot be subclassed"];
      }
    }
    uint64_t v4 = +[BKSHIDEventDisplay nullDisplay];
    v5 = (void *)v1[1];
    v1[1] = v4;

    uint64_t v6 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    v7 = (void *)v1[2];
    v1[2] = v6;

    v9.receiver = v1;
    v9.super_class = (Class)BKSHIDEventDeferringChainObserverPredicate;
    return objc_msgSendSuper2(&v9, sel_init);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [BKSMutableHIDEventDeferringChainObserverPredicate alloc];
  return -[BKSHIDEventDeferringChainObserverPredicate _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(BKSHIDEventDisplay *)self->_display hash];
  [(BKSHIDEventDeferringEnvironment *)self->_environment hash];
  return BSHashPurifyNS();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  display = self->_display;
  id v7 = v4;
  if (display)
  {
    [v4 encodeObject:display forKey:@"display"];
    id v4 = v7;
  }
  environment = self->_environment;
  if (environment)
  {
    [v7 encodeObject:environment forKey:@"environment"];
    id v4 = v7;
  }
}

- (BKSHIDEventDeferringChainObserverPredicate)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringChainObserverPredicate;
  id v3 = a3;
  id v4 = [(BKSHIDEventDeferringChainObserverPredicate *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"display", v10.receiver, v10.super_class);
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];

  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  return v4;
}

- (BKSHIDEventDeferringChainObserverPredicate)init
{
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[BKSHIDEventDeferringChainObserverPredicate init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSHIDEventDeferringChainObserverPredicate.m" lineNumber:39 description:@"cannot directly allocate BKSHIDEventDeferringChainObserverPredicate"];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"+[BKSHIDEventDeferringChainObserverPredicate new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSHIDEventDeferringChainObserverPredicate.m" lineNumber:44 description:@"cannot directly allocate BKSHIDEventDeferringChainObserverPredicate"];

  return 0;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = -[BKSHIDEventDeferringChainObserverPredicate _init]([BKSMutableHIDEventDeferringChainObserverPredicate alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end