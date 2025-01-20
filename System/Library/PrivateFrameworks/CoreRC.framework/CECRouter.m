@interface CECRouter
+ (id)routerWithSinkInterface:(id)a3;
- (BOOL)interface:(id)a3 sendFrame:(CECFrame *)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)interface:(id)a3 setAddressMask:(unsigned __int16)a4 error:(id *)a5;
- (BOOL)interface:(id)a3 setSnoopingMode:(BOOL)a4 error:(id *)a5;
- (CECRouter)initWithSinkInterface:(id)a3;
- (id)newRouterInterface;
- (id)properties;
- (void)dealloc;
- (void)interface:(id)a3 receivedFrame:(CECFrame *)a4;
- (void)interfacePropertiesChanged:(id)a3;
@end

@implementation CECRouter

+ (id)routerWithSinkInterface:(id)a3
{
  v3 = [[CECRouter alloc] initWithSinkInterface:a3];
  return v3;
}

- (CECRouter)initWithSinkInterface:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CECRouter;
  v4 = [(CECRouter *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v4->_interfaces = v5;
    if (v5
      && (uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "properties"), "copy"), (v4->_properties = (NSDictionary *)v6) != 0))
    {
      v4->_sinkInterface = (CECInterface *)a3;
      [a3 setDelegate:v4];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CECRouter;
  [(CECRouter *)&v3 dealloc];
}

- (id)newRouterInterface
{
  objc_super v3 = [[CECRouterInterface alloc] initWithRouter:self];
  [(NSMutableSet *)self->_interfaces addObject:v3];
  return v3;
}

- (BOOL)interface:(id)a3 setAddressMask:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  interfaces = self->_interfaces;
  uint64_t v8 = [(NSMutableSet *)interfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(interfaces);
        }
        v10 |= [*(id *)(*((void *)&v14 + 1) + 8 * i) addressMask];
      }
      uint64_t v9 = [(NSMutableSet *)interfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    LOWORD(v10) = 0;
  }
  return [(CECInterface *)self->_sinkInterface setAddressMask:(unsigned __int16)v10 error:a5];
}

- (BOOL)interface:(id)a3 setSnoopingMode:(BOOL)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  interfaces = self->_interfaces;
  uint64_t v8 = [(NSMutableSet *)interfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(interfaces);
        }
        v10 |= [*(id *)(*((void *)&v14 + 1) + 8 * i) snoopingMode];
      }
      uint64_t v9 = [(NSMutableSet *)interfaces countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return [(CECInterface *)self->_sinkInterface setSnoopingMode:v10 & 1 error:a5];
}

- (BOOL)interface:(id)a3 sendFrame:(CECFrame *)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned __int8 v9 = a4->blocks[0];
  sinkInterface = self->_sinkInterface;
  CECFrame v32 = *a4;
  BOOL v11 = [(CECInterface *)sinkInterface sendFrame:&v32 withRetryCount:a5 error:a6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_interfaces;
  uint64_t v12 = [(NSMutableSet *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    BOOL v25 = v11;
    uint64_t v14 = 0;
    int v15 = 1 << (v9 & 0xF);
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(*((void *)&v27 + 1) + 8 * i);
        int v19 = [v18 snoopingMode];
        int v20 = [v18 addressMask] & v15;
        if (v20) {
          int v21 = 1;
        }
        else {
          int v21 = v19;
        }
        if (v18 != a3 && v21 != 0)
        {
          CECFrame v32 = *a4;
          [v18 receivedFrame:&v32];
        }
        if (v20) {
          ++v14;
        }
      }
      uint64_t v13 = [(NSMutableSet *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
    BOOL v23 = v14 != 0;
    BOOL v11 = v25;
  }
  else
  {
    BOOL v23 = 0;
  }
  return v11 || v23;
}

- (id)properties
{
  return [(CECInterface *)self->_sinkInterface properties];
}

- (void)interface:(id)a3 receivedFrame:(CECFrame *)a4
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  CECFrame v4 = *a4;
  [(CECRouter *)self interface:a3 sendFrame:&v4 withRetryCount:0 error:0];
}

- (void)interfacePropertiesChanged:(id)a3
{
  self->_properties = (NSDictionary *)[a3 properties];
}

@end