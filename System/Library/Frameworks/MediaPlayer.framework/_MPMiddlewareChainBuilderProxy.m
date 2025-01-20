@interface _MPMiddlewareChainBuilderProxy
+ (id)allocWithProtocol:(id)a3;
- (SEL)_methodDescriptionFromProtocolHierarchy:(const char *)a3 selector:;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _MPMiddlewareChainBuilderProxy

- (void).cxx_destruct
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  -[_MPMiddlewareChainBuilderProxy _methodDescriptionFromProtocolHierarchy:selector:]((uint64_t)self, self->_protocol, a3);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SEL)_methodDescriptionFromProtocolHierarchy:(const char *)a3 selector:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = (Protocol *)v5;
    objc_method_description MethodDescription = protocol_getMethodDescription(v7, a3, 0, 1);
    if (MethodDescription.types)
    {
      SEL name = MethodDescription.name;
    }
    else
    {
      objc_method_description v10 = protocol_getMethodDescription(v7, a3, 1, 1);
      SEL name = v10.name;

      if (!v10.types)
      {
        unsigned int outCount = 0;
        v11 = protocol_copyProtocolList(v7, &outCount);
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            SEL name = (SEL)-[_MPMiddlewareChainBuilderProxy _methodDescriptionFromProtocolHierarchy:selector:](a1, v11[i], a3);
            if (v13) {
              break;
            }
          }
        }
        free(v11);
      }
    }
  }
  else
  {
    SEL name = 0;
  }

  return name;
}

+ (id)allocWithProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 methodSignature];
  if ((unint64_t)[v5 numberOfArguments] > 1)
  {
    id v8 = 0;
    objc_msgSend(v4, "getArgument:atIndex:", &v8, objc_msgSend(v5, "numberOfArguments") - 1);
    uint64_t v6 = [v4 selector];
    [v8 setBuilderSelector:v6];
    v7 = [v8 nextObject];
    [v4 invokeWithTarget:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MPMiddlewareChainBuilderProxy;
    [(_MPMiddlewareChainBuilderProxy *)&v9 forwardInvocation:v4];
  }
}

@end