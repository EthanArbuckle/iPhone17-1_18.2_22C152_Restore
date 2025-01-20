@interface DTXProxyChannel
- (DTXChannel)channel;
- (DTXProxyChannel)initWithChannel:(id)a3 remoteProtocol:(id)a4 localProtocol:(id)a5;
- (NSSet)additionalAllowedClassesForProtocolMethods;
- (Protocol)remoteInterface;
- (id)_allowedClassesForArgumentsOfRemoteInterfaceSelector:(SEL)a3 methodSignature:(id)a4;
- (id)_allowedClassesForReturnValues;
- (id)_validateDispatch:(id)a3;
- (id)remoteObjectProxy;
- (void)_sendInvocationMessage:(id)a3;
- (void)cancel;
- (void)setAdditionalAllowedClassesForProtocolMethods:(id)a3;
- (void)setChannel:(id)a3;
- (void)setExportedObject:(id)a3 queue:(id)a4;
- (void)setRemoteInterface:(id)a3;
@end

@implementation DTXProxyChannel

- (DTXProxyChannel)initWithChannel:(id)a3 remoteProtocol:(id)a4 localProtocol:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DTXProxyChannel;
  v12 = [(DTXProxyChannel *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_channel, a3);
    objc_storeStrong((id *)&v13->_remoteInterface, a4);
    objc_storeStrong((id *)&v13->_exportedInterface, a5);
    uint64_t v16 = [MEMORY[0x263EFFA08] setValue:v14 forKey:v15];
    additionalAllowedClassesForProtocolMethods = v13->_additionalAllowedClassesForProtocolMethods;
    v13->_additionalAllowedClassesForProtocolMethods = (NSSet *)v16;

    objc_initWeak(&location, v13);
    channel = v13->_channel;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_22AF38264;
    v21[3] = &unk_264883A08;
    objc_copyWeak(&v22, &location);
    [channel setDispatchValidator:v19];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)remoteObjectProxy
{
  v3 = [_DTXProxy alloc];
  v5 = [v3 initWithChannel:v4 channelID:(uint64_t)self];

  return v5;
}

- (void)cancel
{
  channel = self->_channel;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_22AF38390;
  v3[3] = &unk_264883918;
  v3[4] = self;
  [channel sendControlAsync:a2 replyHandler:v3];
}

- (id)_allowedClassesForArgumentsOfRemoteInterfaceSelector:(SEL)a3 methodSignature:(id)a4
{
  id v5 = a4;
  v8 = [DTXMessage defaultAllowedSecureCodingClasses:v6 withTransitionContext:v7];
  id v9 = v5;
  id v10 = objc_opt_new();
  if ([v9 numberOfArguments:v11, v12])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v9 classForObjectAtArgumentIndex:v13];
      if (v15) {
        [v10 addObject:v16];
      }
      ++v14;
    }
    while (v14 < [v9 numberOfArgumentsWithTransitionContext:v16 completion:v17]);
  }

  if ([v10 _isEqualToObject:v18 withHash:v19])
  {
    uint64_t v22 = [v8 setByAddingObjectsFromSet:v20];

    v8 = (void *)v22;
  }
  v23 = [self additionalAllowedClassesForProtocolMethods:v20 withProtocol:v21];
  if ([v23 _callOutQueue_willDestroyWithTransitionContext:v24 completion:v25])
  {
    uint64_t v27 = [v8 setByAddingObjectsFromSet:v26];

    v8 = (void *)v27;
  }

  return v8;
}

- (id)_allowedClassesForReturnValues
{
  v4 = [DTXMessage _defaultAllowedSecureCodingClasses:a2];
  uint64_t v7 = [self _additionalAllowedClassesForProtocolMethods:v5 withSelector:v6];
  if ([v7 count:v8 with:v9])
  {
    uint64_t v11 = [v4 setByAddingObjectsFromSet:v10];

    v4 = (void *)v11;
  }

  return v4;
}

- (id)_validateDispatch:(id)a3
{
  id v6 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_hasProcessedMessage);
  if (!self->_exportedInterface) {
    [MEMORY[0x263EFF940] raise:@"DTXMissingInterfaceException" format:@"No exported interface has been specified"];
  }
  uint64_t v7 = (const char *)[v6 performSelector:v4 withObject:v5];
  uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  if (!MethodTypeEncoding)
  {
    id v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = NSStringFromSelector(v7);
    [v10 raise:@"DTXSelectorNotAllowedException" format:@"Selector %@ is not part of the exported interface", v11];
  }
  v13 = [MEMORY[0x263EFF970] methodSignatureForSelector:v8];
  uint64_t v16 = [v6 methodSignatureForSelector:v14];
  uint64_t v19 = [v16 numberOfArguments:v17, v18];
  uint64_t v22 = [v13 numberOfArguments:v20, v21];

  if (v19 != v22)
  {
    uint64_t v25 = (void *)MEMORY[0x263EFF940];
    v26 = NSStringFromSelector(v7);
    [v25 raise:@"DTXSelectorMismatchException" format:@"Incorrect number of arguments in incoming message with selector %@", v26];
  }
  v54 = v6;
  v28 = [v6 performSelector:v23 withObject:v24];
  char v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x263EFF940];
    v33 = NSStringFromSelector(v7);
    [v32 _DTXSelectorUnimplementedException:v34, @"Selector %@ is a valid part of the exported interface, but the exported object does not implement it.", v33];
  }
  if (v13.numberOfArguments >= 3)
  {
    unint64_t v35 = 2;
    do
    {
      id v36 = v13;
      ArgumentTypeAtIndex = (unsigned char *)[v36 _getArgumentTypeAtIndex:v37];
      if (*ArgumentTypeAtIndex != 64)
      {
        v41 = ArgumentTypeAtIndex;
        v42 = (void *)MEMORY[0x263EFF940];
        v43 = NSStringFromSelector(v7);
        [v42 raiseFormat:@"DTXSelectorInvalidArgumentTypeException" format:@"Invalid argument type %s at index %lu of selector %@", v41, v35, v43];
      }
      ++v35;
    }
    while (v35 < [v36 numberOfArgumentsWithTransitionContext:v39 completion:v40]);
  }
  id v45 = v13;
  if (*(unsigned char *)[v45 methodReturnType:v46 selector:v47] != 64)
  {
    v49 = (void *)MEMORY[0x263EFF940];
    v50 = NSStringFromSelector(v7);
    [v49 _DTXSelectorInvalidReturnTypeException:v51 format:@"Selector %@ is a part of the exported interface, but return type is not an object.", v50];
  }
  v52 = [self _allowedClassesForArgumentsOfRemoteInterfaceSelector:v48 methodSignature:v45];

  return v52;
}

- (void)setExportedObject:(id)a3 queue:(id)a4
{
  id v10 = (char *)a3;
  id v6 = a4;
  uint64_t v7 = v10;
  id v8 = v6;
  if (v10)
  {
    char v9 = [v10 conformsToProtocol:self->_exportedInterface];
    uint64_t v7 = v10;
    if ((v9 & 1) == 0)
    {
      [MEMORY[0x263EFF940] raiseFormat:v10 format:MEMORY[0x263EFF488] format:@"Exported object does not conform to the exported interface."];
      uint64_t v7 = v10;
    }
  }
  [self->_channel setDispatchTarget:v7 queue:(dispatch_queue_t)v7];
}

- (void)setAdditionalAllowedClassesForProtocolMethods:(id)a3
{
  uint64_t v5 = (NSSet *)a3;
  if (atomic_exchange((atomic_uchar *volatile)&self->_hasProcessedMessage, 1u))
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF488];
    id v8 = [NSString stringWithUTF8String:"-[DTXProxyChannel setAdditionalAllowedClassesForProtocolMethods:]"];
    [v6 _raise_format_:v9, v7, @"%@ must only be called once, before sending or receiving messages", v8];
  }
  additionalAllowedClassesForProtocolMethods = self->_additionalAllowedClassesForProtocolMethods;
  self->_additionalAllowedClassesForProtocolMethods = v5;
}

- (void)_sendInvocationMessage:(id)a3
{
  atomic_store(1u, (unsigned __int8 *)&self->_hasProcessedMessage);
  id v4 = a3;
  id v17 = (id)objc_opt_new();
  [v4 setReturnValue:&v17];
  [v4 retainArguments:v6, v7];
  id v8 = [DTXMessage alloc];
  id v10 = [v8 initWithInvocation:v9];

  v13 = [self v11:v12];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22AF38A90;
  v15[3] = &unk_264883A30;
  v15[4] = self;
  id v16 = v17;
  [v13 sendControlAsync:v14 replyHandler:v15];
}

- (Protocol)remoteInterface
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteInterface:(id)a3
{
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSSet)additionalAllowedClassesForProtocolMethods
{
  return self->_additionalAllowedClassesForProtocolMethods;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalAllowedClassesForProtocolMethods, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);

  objc_storeStrong((id *)&self->_remoteInterface, 0);
}

@end