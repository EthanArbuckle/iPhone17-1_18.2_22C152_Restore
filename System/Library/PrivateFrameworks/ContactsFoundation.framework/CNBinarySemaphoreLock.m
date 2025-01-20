@interface CNBinarySemaphoreLock
- (CNBinarySemaphoreLock)init;
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)lock;
- (void)setName:(id)a3;
- (void)unlock;
@end

@implementation CNBinarySemaphoreLock

- (CNBinarySemaphoreLock)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNBinarySemaphoreLock;
  v2 = [(CNBinarySemaphoreLock *)&v8 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;

    if (!v2->_semaphore)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"dispatch_semaphore_wait failed" userInfo:0];
      objc_exception_throw(v7);
    }
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(CNBinarySemaphoreLock *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CNBinarySemaphoreLock;
  [(CNBinarySemaphoreLock *)&v3 dealloc];
}

- (void)invalidate
{
  self->_semaphore = 0;
  MEMORY[0x1F41817F8]();
}

- (void)lock
{
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL))
  {
    [NSString stringWithFormat:@"dispatch_semaphore_wait failed: %@", self];
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v3);
  }
}

- (void)unlock
{
}

- (id)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"semaphore" pointerValue:self->_semaphore];
  id v5 = (id)[v3 appendName:@"name" object:self->_name];
  v6 = [v3 build];

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end