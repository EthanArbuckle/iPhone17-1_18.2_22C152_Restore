@interface NSXPCListenerEndpoint
+ (BOOL)supportsSecureCoding;
- (NSXPCListenerEndpoint)init;
- (NSXPCListenerEndpoint)initWithCoder:(id)a3;
- (id)_endpoint;
- (id)_initWithConnection:(id)a3;
- (void)_setEndpoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSXPCListenerEndpoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  endpoint = self->_endpoint;
  if (endpoint) {
    xpc_release(endpoint);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSXPCListenerEndpoint;
  [(NSXPCListenerEndpoint *)&v4 dealloc];
}

- (NSXPCListenerEndpoint)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This class may only be decoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSXPCListenerEndpoint;
  v6 = [(NSXPCListenerEndpoint *)&v10 init];
  v7 = (OS_xpc_object *)[a3 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"ep"];
  v6->_endpoint = v7;
  v6->_lock._os_unfair_lock_opaque = 0;
  if (v7) {
    xpc_retain(v7);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This class may only be encoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeXPCObject:forKey:", -[NSXPCListenerEndpoint _endpoint](self, "_endpoint"), @"ep");
}

- (id)_endpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  if (endpoint) {
    xpc_retain(endpoint);
  }
  os_unfair_lock_unlock(p_lock);

  return endpoint;
}

- (id)_initWithConnection:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSXPCListenerEndpoint;
  objc_super v4 = [(NSXPCListenerEndpoint *)&v6 init];
  v4->_endpoint = xpc_endpoint_create((xpc_connection_t)a3);
  v4->_lock._os_unfair_lock_opaque = 0;
  return v4;
}

- (NSXPCListenerEndpoint)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCListenerEndpoint;
  result = [(NSXPCListenerEndpoint *)&v3 init];
  result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)_setEndpoint:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  self->_endpoint = (OS_xpc_object *)xpc_retain(a3);
  if (endpoint) {
    xpc_release(endpoint);
  }

  os_unfair_lock_unlock(p_lock);
}

@end