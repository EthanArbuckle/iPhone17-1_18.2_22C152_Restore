@interface SKPerformSelector
+ (BOOL)supportsSecureCoding;
+ (id)perfromSelector:(SEL)a3 onTarget:(id)a4;
- (SKPerformSelector)init;
- (SKPerformSelector)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
@end

@implementation SKPerformSelector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKPerformSelector)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKPerformSelector;
  v2 = [(SKAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_weakTarget, 0);
    strongTarget = v3->_strongTarget;
    v3->_strongTarget = 0;

    v3->_selector = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_weakTarget, 0);
  strongTarget = self->_strongTarget;
  self->_strongTarget = 0;

  self->_selector = 0;
  v4.receiver = self;
  v4.super_class = (Class)SKPerformSelector;
  [(SKAction *)&v4 dealloc];
}

- (SKPerformSelector)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKPerformSelector;
  v5 = [(SKAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    if (!SKGetLinkedOnOrAfter(786432))
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_target"];
      strongTarget = v5->_strongTarget;
      v5->_strongTarget = v8;

      objc_storeWeak((id *)&v5->_weakTarget, v5->_strongTarget);
    }
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selector"];
    SEL v7 = NSSelectorFromString(v6);
    if (v7) {
      v10 = v7;
    }
    else {
      v10 = 0;
    }
    v5->_selector = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  {
    -[SKPerformSelector encodeWithCoder:]::sdk_version = dyld_get_program_sdk_version();
  }
  if (-[SKPerformSelector encodeWithCoder:]::sdk_version < 0xC0000)
  {
    v9.receiver = self;
    v9.super_class = (Class)SKPerformSelector;
    [(SKAction *)&v9 encodeWithCoder:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
    [v4 encodeObject:WeakRetained forKey:@"_target"];

    if (self->_selector) {
      selector = self->_selector;
    }
    else {
      selector = 0;
    }
    uint64_t v8 = NSStringFromSelector(selector);
    [v4 encodeObject:v8 forKey:@"_selector"];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKPerformSelector;
    [(SKAction *)&v10 encodeWithCoder:v4];
    if (self->_selector) {
      v5 = self->_selector;
    }
    else {
      v5 = 0;
    }
    uint64_t v8 = NSStringFromSelector(v5);
    [v4 encodeObject:v8 forKey:@"_selector"];
  }
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v9 = a3;
  if (![(SKAction *)self finished])
  {
    [(SKAction *)self setFinished:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
    objc_super v6 = WeakRetained;
    if (WeakRetained)
    {
      selector = self->_selector;
      if (selector) {
        [WeakRetained selector];
      }
    }
    strongTarget = self->_strongTarget;
    self->_strongTarget = 0;
  }
}

+ (id)perfromSelector:(SEL)a3 onTarget:(id)a4
{
  id v6 = a4;
  SEL v7 = v6;
  uint64_t v8 = 0;
  if (a3 && v6)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = objc_alloc_init(SKPerformSelector);
      v8->_selector = a3;
      objc_storeStrong((id *)&v8->_strongTarget, a4);
      objc_storeWeak((id *)&v8->_weakTarget, v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKPerformSelector;
  id v4 = [(SKAction *)&v7 copyWithZone:a3];
  *((void *)v4 + 2) = self->_selector;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakTarget);
  objc_storeWeak((id *)v4 + 3, WeakRetained);

  return v4;
}

- (id)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongTarget, 0);

  objc_destroyWeak((id *)&self->_weakTarget);
}

@end