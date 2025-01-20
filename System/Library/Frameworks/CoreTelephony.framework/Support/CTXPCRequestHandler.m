@interface CTXPCRequestHandler
- (CTXPCRequestHandler)initWithClientHandler:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation CTXPCRequestHandler

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&OBJC_PROTOCOL___CTXPCRequestHandling, a3, 1, 1);
  name = (void *)MethodDescription.name;
  if (MethodDescription.name)
  {
    name = +[NSMethodSignature signatureWithObjCTypes:MethodDescription.types];
  }

  return name;
}

- (CTXPCRequestHandler)initWithClientHandler:(id)a3
{
  return self;
}

- (void)forwardInvocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end