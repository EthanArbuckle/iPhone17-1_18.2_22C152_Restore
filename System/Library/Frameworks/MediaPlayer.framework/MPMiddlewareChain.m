@interface MPMiddlewareChain
+ (id)builderProxyForProtocol:(id)a3;
- (MPMiddlewareChain)initWithMiddleware:(id)a3 protocol:(id)a4;
- (SEL)builderSelector;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)nextObject;
- (void)forwardInvocation:(id)a3;
- (void)setBuilderSelector:(SEL)a3;
@end

@implementation MPMiddlewareChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlewareEnumerator, 0);
  objc_storeStrong((id *)&self->_builders, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MPMiddlewareChain;
  v5 = -[MPMiddlewareChain methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(id)objc_opt_class() builderProxyForProtocol:self->_protocol];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

+ (id)builderProxyForProtocol:(id)a3
{
  id v3 = +[_MPMiddlewareChainBuilderProxy allocWithProtocol:a3];

  return v3;
}

- (void)forwardInvocation:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 methodSignature];
  uint64_t v5 = [v4 methodReturnLength];

  [v3 getArgument:(char *)v6 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) atIndex:2];
  [v3 setReturnValue:(char *)v6 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
}

- (id)nextObject
{
  uint64_t v3 = [(NSEnumerator *)self->_middlewareEnumerator nextObject];
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (MPMiddlewareChain *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  v6 = v5;

  if (self->_builderSelector && v6 != self && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = [(MPMiddlewareChain *)self nextObject];

    v6 = (MPMiddlewareChain *)v7;
  }

  return v6;
}

- (void)setBuilderSelector:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_builderSelector = v3;
}

- (MPMiddlewareChain)initWithMiddleware:(id)a3 protocol:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (Protocol *)a4;
  v27.receiver = self;
  v27.super_class = (Class)MPMiddlewareChain;
  v8 = [(MPMiddlewareChain *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protocol, a4);
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    objc_super v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
          v17 = (objc_class *)objc_opt_class();
          if (class_conformsToProtocol(v17, v7)) {
            -[NSArray addObject:](v10, "addObject:", v16, (void)v23);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    builders = v9->_builders;
    v9->_builders = v10;
    v19 = v10;

    uint64_t v20 = [(NSArray *)v19 objectEnumerator];
    middlewareEnumerator = v9->_middlewareEnumerator;
    v9->_middlewareEnumerator = (NSEnumerator *)v20;
  }
  return v9;
}

- (SEL)builderSelector
{
  if (self->_builderSelector) {
    return self->_builderSelector;
  }
  else {
    return 0;
  }
}

@end