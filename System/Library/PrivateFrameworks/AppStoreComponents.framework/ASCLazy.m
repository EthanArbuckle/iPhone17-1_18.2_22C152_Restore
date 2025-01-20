@interface ASCLazy
- (ASCLazy)initWithFactory:(id)a3;
- (id)description;
- (id)factory;
- (id)object;
- (id)objectIfLoaded;
- (os_unfair_lock_s)loadingGuard;
- (void)setObjectIfLoaded:(id)a3;
@end

@implementation ASCLazy

- (ASCLazy)initWithFactory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLazy;
  v5 = [(ASCLazy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id factory = v5->_factory;
    v5->_id factory = (id)v6;

    v5->_loadingGuard._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)object
{
  v3 = [(ASCLazy *)self objectIfLoaded];

  if (!v3)
  {
    os_unfair_lock_lock(&self->_loadingGuard);
    id v4 = [(ASCLazy *)self objectIfLoaded];

    if (!v4)
    {
      v5 = [(ASCLazy *)self factory];
      uint64_t v6 = v5[2]();
      [(ASCLazy *)self setObjectIfLoaded:v6];
    }
    os_unfair_lock_unlock(&self->_loadingGuard);
  }

  return [(ASCLazy *)self objectIfLoaded];
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLazy *)self objectIfLoaded];
  [(ASCDescriber *)v3 addObject:v4 withName:@"object"];

  v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (id)objectIfLoaded
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setObjectIfLoaded:(id)a3
{
}

- (id)factory
{
  return self->_factory;
}

- (os_unfair_lock_s)loadingGuard
{
  return self->_loadingGuard;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_factory, 0);

  objc_storeStrong(&self->_objectIfLoaded, 0);
}

@end