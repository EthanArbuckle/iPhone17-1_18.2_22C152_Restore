@interface AVTCompositor
- (AVTCompositor)init;
- (void)addClient:(id)a3;
- (void)componentDidChangeForTypes:(unint64_t)a3;
- (void)configureMaterial:(id)a3 propertyNamed:(id)a4 memoji:(id)a5;
- (void)removeClient:(id)a3;
- (void)skinColorDidChange;
@end

@implementation AVTCompositor

- (AVTCompositor)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVTCompositor;
  v2 = [(AVTCompositor *)&v6 init];
  if (v2)
  {
    CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
    textureProviders = v2->_textureProviders;
    v2->_textureProviders = (NSMutableSet *)Mutable;
  }
  return v2;
}

- (void)addClient:(id)a3
{
}

- (void)removeClient:(id)a3
{
}

- (void)skinColorDidChange
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_textureProviders;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "skinColorDidChange", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)componentDidChangeForTypes:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = self->_textureProviders;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "componentDidChangeForTypes:", a3, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)configureMaterial:(id)a3 propertyNamed:(id)a4 memoji:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v13 valueForKey:v8];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F16A88]);
    [v13 setValue:v10 forKey:v8];
  }
  long long v11 = [v10 contents];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = [[AVTCompositorTextureProvider alloc] initWithCompositor:self memoji:v9 propertyName:v8];
    [v10 setContents:v12];
  }
}

- (void).cxx_destruct
{
}

@end