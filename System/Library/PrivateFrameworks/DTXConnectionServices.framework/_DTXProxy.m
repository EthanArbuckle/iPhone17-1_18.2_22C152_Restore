@interface _DTXProxy
- (_DTXProxy)initWithChannel:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _DTXProxy

- (_DTXProxy)initWithChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DTXProxy;
  v6 = [(_DTXProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyChannel, a3);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)_DTXProxy;
  id v5 = -[_DTXProxy methodSignatureForSelector:](&v23, sel_methodSignatureForSelector_);
  v8 = v5;
  if (v5)
  {
    id v9 = v5;
  }
  else
  {
    [self->_proxyChannel objc_msgSend_remoteInterface:v6, v7];
    v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    objc_method_description MethodDescription = protocol_getMethodDescription(v10, a3, 1, 1);

    if (!MethodDescription.name)
    {
      v13 = (void *)MEMORY[0x263EFF940];
      uint64_t v14 = *MEMORY[0x263EFF488];
      v15 = NSStringFromSelector(a3);
      [self->_proxyChannel performSelector:v16 withObject:v17];
      v18 = (Protocol *)objc_claimAutoreleasedReturnValue();
      Name = protocol_getName(v18);
      [v13 raiseFormat:@"Selector %@ is not part of the remote interface \"%s\"", v14, Name];
    }
    [MEMORY[0x263EFF970] setValue:v12 forKey:[MethodDescription types]];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v9;

  return v21;
}

- (void).cxx_destruct
{
}

@end