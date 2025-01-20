@interface BSXPCServiceConnectionRootContext
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoot;
- (atomic_ullong)uniqueChildContext;
- (id)debugDescription;
- (id)endpointDescription;
- (unint64_t)hash;
- (void)_initWithType:(void *)a3 eDesc:;
- (void)childContextWithRemoteIdentifier:(void *)a1;
@end

@implementation BSXPCServiceConnectionRootContext

- (BOOL)isRoot
{
  return 1;
}

- (id)endpointDescription
{
  return self->_eDesc;
}

- (void)_initWithType:(void *)a3 eDesc:
{
  id v5 = a3;
  if (a1)
  {
    unint64_t v6 = atomic_fetch_add_explicit(&_initWithType_eDesc____uniqueCounter, 1uLL, memory_order_relaxed) + 1;
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"[%c:%llx]", a2, v6);
    a1 = -[BSXPCServiceConnectionContext _initWithProem:](a1, v7);

    if (a1)
    {
      a1[2] = v6;
      uint64_t v8 = [v5 copy];
      v9 = (void *)a1[4];
      a1[4] = v8;
    }
  }

  return a1;
}

- (void)childContextWithRemoteIdentifier:(void *)a1
{
  if (a1)
  {
    v4 = [BSXPCServiceConnectionChildContext alloc];
    id v5 = NSString;
    int v6 = [a1 isClient];
    uint64_t v7 = 83;
    if (v6) {
      uint64_t v7 = 67;
    }
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", @"[%c:%llx-%llxr]", v7, a1[2], a2);
    v9 = -[BSXPCServiceConnectionChildContext _initWithParent:identifier:remote:proem:](v4, a1, a2, 1, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (atomic_ullong)uniqueChildContext
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = atomic_fetch_add_explicit(a1 + 3, 1uLL, memory_order_relaxed) + 1;
    v3 = [BSXPCServiceConnectionChildContext alloc];
    v4 = NSString;
    int v5 = [(atomic_ullong *)v1 isClient];
    uint64_t v6 = 83;
    if (v5) {
      uint64_t v6 = 67;
    }
    uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", @"[%c:%llx-%llx]", v6, v1[2], v2);
    v1 = -[BSXPCServiceConnectionChildContext _initWithParent:identifier:remote:proem:](v3, v1, v2, 0, v7);
  }

  return v1;
}

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return self->_unique;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSXPCServiceConnectionRootContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_unique == v4->_unique;
  }

  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(BSXPCServiceConnectionContext *)self isClient];
  uint64_t v6 = @"server";
  if (v5) {
    uint64_t v6 = @"client";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p %@ %llx %@>", v4, self, v6, self->_unique, self->_eDesc];
}

@end