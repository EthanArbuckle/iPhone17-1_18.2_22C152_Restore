@interface AXMOutputRequestHandle
- (AXMOutputRequestHandle)init;
- (NSArray)actionHandles;
- (void)addActionHandle:(id)a3;
@end

@implementation AXMOutputRequestHandle

- (AXMOutputRequestHandle)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMOutputRequestHandle;
  v2 = [(AXMOutputRequestHandle *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    actionHandles = v2->_actionHandles;
    v2->_actionHandles = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addActionHandle:(id)a3
{
}

- (NSArray)actionHandles
{
  v2 = (void *)[(NSMutableArray *)self->_actionHandles copy];

  return (NSArray *)v2;
}

- (void).cxx_destruct
{
}

@end