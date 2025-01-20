@interface BSXPCServiceConnectionChildContext
- (BOOL)isChild;
- (BOOL)isClient;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonLaunching;
- (BOOL)isServer;
- (id)debugDescription;
- (id)endpointDescription;
- (unint64_t)hash;
- (void)_initWithParent:(uint64_t)a3 identifier:(char)a4 remote:(void *)a5 proem:;
@end

@implementation BSXPCServiceConnectionChildContext

- (void).cxx_destruct
{
}

- (BOOL)isServer
{
  return [(BSXPCServiceConnectionContext *)self->_parent isServer];
}

- (BOOL)isChild
{
  return 1;
}

- (BOOL)isClient
{
  return [(BSXPCServiceConnectionContext *)self->_parent isClient];
}

- (id)endpointDescription
{
  return [(BSXPCServiceConnectionRootContext *)self->_parent endpointDescription];
}

- (void)_initWithParent:(uint64_t)a3 identifier:(char)a4 remote:(void *)a5 proem:
{
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    a1 = -[BSXPCServiceConnectionContext _initWithProem:](a1, v10);
    if (a1)
    {
      uint64_t v11 = [v9 copy];
      v12 = (void *)a1[2];
      a1[2] = v11;

      a1[4] = a3;
      *((unsigned char *)a1 + 24) = a4;
    }
  }

  return a1;
}

- (BOOL)isNonLaunching
{
  return [(BSXPCServiceConnectionContext *)self->_parent isNonLaunching];
}

- (unint64_t)hash
{
  return [(BSXPCServiceConnectionRootContext *)self->_parent hash] ^ (self->_identifier << 32);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSXPCServiceConnectionChildContext *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && BSEqualObjects()
      && self->_identifier == v4->_identifier
      && self->_remote == v4->_remote;
  }

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_remote) {
    uint64_t v5 = @"remote ";
  }
  else {
    uint64_t v5 = &stru_1EED42A98;
  }
  unint64_t identifier = self->_identifier;
  v7 = [(BSXPCServiceConnectionRootContext *)self->_parent debugDescription];
  v8 = [v3 stringWithFormat:@"<%@:%p %@%llx>on%@", v4, self, v5, identifier, v7];

  return v8;
}

@end