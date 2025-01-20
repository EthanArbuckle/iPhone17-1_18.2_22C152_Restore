@interface NSProtocolChecker
+ (NSProtocolChecker)allocWithZone:(_NSZone *)a3;
+ (NSProtocolChecker)protocolCheckerWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSObject)target;
- (NSProtocolChecker)initWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol;
- (Protocol)protocol;
- (const)_localClassNameForClass;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (objc_method_description)methodDescriptionForSelector:(SEL)a3;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation NSProtocolChecker

+ (NSProtocolChecker)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if (self == a1) {
    v4 = (objc_class *)self;
  }

  return (NSProtocolChecker *)NSAllocateObject(v4, 0, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = [(NSProtocolChecker *)self methodDescriptionForSelector:a3];
  if (result)
  {
    uint64_t v4 = *((void *)result + 1);
    v5 = (void *)MEMORY[0x1E4F1CA38];
    return (id)[v5 signatureWithObjCTypes:v4];
  }
  return result;
}

- (objc_method_description)methodDescriptionForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 1, 1);
  types = MethodDescription.types;
  SEL name = MethodDescription.name;
  if (MethodDescription.name
    || ([(NSProtocolChecker *)self target], (objc_opt_respondsToSelector() & 1) != 0)
    && (objc_method_description v11 = protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 0, 1),
        types = v11.types,
        (SEL name = v11.name) != 0))
  {
    v8 = name;
    v9 = types;
    id result = (objc_method_description *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", 16), "mutableBytes");
    result->SEL name = v8;
    result->types = v9;
  }
  else if (sel_respondsToSelector_ == a3 || sel__conformsToProtocolNamed_ == a3 || sel_conformsToProtocol_ == a3)
  {
    v14 = (void *)MEMORY[0x1E4FBA8A8];
    return (objc_method_description *)[v14 instanceMethodDescriptionForSelector:a3];
  }
  else
  {
    return 0;
  }
  return result;
}

- (Protocol)protocol
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSProtocolChecker");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSObject)target
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSProtocolChecker");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** NSProtocolChecker: target protocol does not recognize selector: %s", sel_getName(a3)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5 = 1;
  if (!(unint64_t)protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 1, 1).name)
  {
    if (!(unint64_t)protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 0, 1).name) {
      return 0;
    }
    [(NSProtocolChecker *)self target];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
  }
  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  uint64_t v4 = [(NSProtocolChecker *)self protocol];

  return protocol_conformsToProtocol(v4, (Protocol *)a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (!(unint64_t)protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 1, 1).name)
  {
    if (!(unint64_t)protocol_getMethodDescription([(NSProtocolChecker *)self protocol], a3, 0, 1).name) {
      return 0;
    }
    [(NSProtocolChecker *)self target];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
  }

  return [(NSProtocolChecker *)self target];
}

- (const)_localClassNameForClass
{
  v2 = [(NSProtocolChecker *)self target];

  return (const char *)[v2 _localClassNameForClass];
}

- (void)forwardInvocation:(id)a3
{
  BOOL v5 = (char *)[a3 selector];
  if (v5 != sel_respondsToSelector_ && v5 != sel__conformsToProtocolNamed_ && v5 != sel_conformsToProtocol_)
  {
    v8 = v5;
    if (![(NSProtocolChecker *)self methodDescriptionForSelector:v5]) {
      [(NSProtocolChecker *)self doesNotRecognizeSelector:v8];
    }
    self = [(NSProtocolChecker *)self target];
  }

  [a3 invokeWithTarget:self];
}

+ (NSProtocolChecker)protocolCheckerWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithTarget:anObject protocol:aProtocol];

  return (NSProtocolChecker *)v4;
}

- (NSProtocolChecker)initWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
}

@end