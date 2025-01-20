@interface CoreDAVActionBackedTask
- (CoreDAVAction)backingAction;
- (id)description;
- (void)setBackingAction:(id)a3;
@end

@implementation CoreDAVActionBackedTask

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVActionBackedTask;
  v4 = [(CoreDAVTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVActionBackedTask *)self backingAction];
  [v3 appendFormat:@"| Backing Action: [%@]", v5];

  [v3 appendFormat:@"]"];
  return v3;
}

- (CoreDAVAction)backingAction
{
  return self->_backingAction;
}

- (void)setBackingAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end