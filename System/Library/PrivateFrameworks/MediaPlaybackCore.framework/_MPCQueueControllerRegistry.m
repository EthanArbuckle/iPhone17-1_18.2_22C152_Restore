@interface _MPCQueueControllerRegistry
+ (_MPCQueueControllerRegistry)shared;
- (MPCQueueControllerPublisher)publisherProxy;
- (NSMapTable)transportableExtensions;
- (_MPCQueueControllerRegistry)init;
@end

@implementation _MPCQueueControllerRegistry

+ (_MPCQueueControllerRegistry)shared
{
  if (shared_onceToken[0] != -1) {
    dispatch_once(shared_onceToken, &__block_literal_global_713);
  }
  v2 = (void *)shared___shared;

  return (_MPCQueueControllerRegistry *)v2;
}

- (NSMapTable)transportableExtensions
{
  return self->_transportableExtensions;
}

- (MPCQueueControllerPublisher)publisherProxy
{
  return self->_publisherProxy;
}

- (_MPCQueueControllerRegistry)init
{
  v14.receiver = self;
  v14.super_class = (Class)_MPCQueueControllerRegistry;
  v3 = [(_MPCQueueControllerRegistry *)&v14 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F12188] proxyForObjects:MEMORY[0x263EFFA68] protocol:&unk_26CC2DAA8];
    publisherProxy = v3->_publisherProxy;
    v3->_publisherProxy = (MPCQueueControllerPublisher *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:1282 valueOptions:0 capacity:6];
    transportableExtensions = v3->_transportableExtensions;
    v3->_transportableExtensions = (NSMapTable *)v6;

    v8 = 0;
    do
    {
      switch((unint64_t)v8)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
          objc_opt_class();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        case 5uLL:
          id v10 = (id)__testBehaviorClass;
LABEL_6:
          id v9 = v10;
          break;
        default:
          id v9 = 0;
          break;
      }
      if ([v9 conformsToProtocol:&unk_26CC23EC8])
      {
        v11 = [v9 makeExtensionWithInvalidatable:v3->_publisherProxy];
        if (!v11)
        {
          v13 = [MEMORY[0x263F08690] currentHandler];
          [v13 handleFailureInMethod:a2, v3, @"MPCQueueController.m", 1784, @"Behavior conforms to MPCQueueControllerBehaviorTransportableImplementation, but failed to provide transportable extension" object file lineNumber description];
        }
        NSMapInsert(v3->_transportableExtensions, v8, v11);
      }
      ++v8;
    }
    while (v8 != (char *)6);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportableExtensions, 0);

  objc_storeStrong((id *)&self->_publisherProxy, 0);
}

@end