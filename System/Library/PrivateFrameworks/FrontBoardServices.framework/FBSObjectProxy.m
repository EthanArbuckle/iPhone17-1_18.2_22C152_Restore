@interface FBSObjectProxy
+ (FBSObjectProxy)proxyForClass:(uint64_t)a1;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)class;
- (Class)superclass;
- (id)bs_secureEncoded;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)length;
- (void)forwardInvocation:(id)a3;
@end

@implementation FBSObjectProxy

+ (FBSObjectProxy)proxyForClass:(uint64_t)a1
{
  self;
  v3 = [FBSObjectProxy alloc];
  v3->_class = a2;

  return v3;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

- (void)forwardInvocation:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[FBSObjectProxy forwardInvocation:](a3, (uint64_t)self);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(objc_class *)self->_class instanceMethodSignatureForSelector:a3];
}

- (unint64_t)count
{
  return 1;
}

- (unint64_t)length
{
  return 1;
}

- (id)bs_secureEncoded
{
  v2 = (objc_class *)objc_opt_class();

  return +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v2);
}

- (id)objectForKey:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return [(objc_class *)self->_class instancesRespondToSelector:a3];
}

- (BOOL)isEqual:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)hash
{
  return [(objc_class *)self->_class hash];
}

- (Class)superclass
{
  return (Class)[(objc_class *)self->_class superclass];
}

- (Class)class
{
  return self->_class;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return [(objc_class *)self->_class isSubclassOfClass:a3];
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return [(objc_class *)self->_class isMemberOfClass:a3];
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 1;
}

- (BOOL)isProxy
{
  return 1;
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector((SEL)[a1 selector]);
  v4 = NSStringFromClass(*(Class *)(a2 + 8));
  int v5 = 138412546;
  v6 = v3;
  __int16 v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "ignoring %@ called on %@", (uint8_t *)&v5, 0x16u);
}

@end