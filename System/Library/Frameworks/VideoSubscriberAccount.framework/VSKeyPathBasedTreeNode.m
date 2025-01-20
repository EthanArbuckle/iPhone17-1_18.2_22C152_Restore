@interface VSKeyPathBasedTreeNode
- (NSString)keyPath;
- (VSKeyPathBasedTreeNode)init;
- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3;
- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3 keyPath:(id)a4;
@end

@implementation VSKeyPathBasedTreeNode

- (VSKeyPathBasedTreeNode)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VSKeyPathBasedTreeNode)initWithRepresentedObject:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The modelObject parameter must not be nil."];
  if (!v8) {
LABEL_3:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keyPath parameter must not be nil."];
LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)VSKeyPathBasedTreeNode;
  v9 = [(VSTreeNode *)&v21 initWithRepresentedObject:v6];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    v12 = [v6 valueForKeyPath:v8];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 count];
      if (v14)
      {
        uint64_t v15 = v14;
        v16 = [(VSTreeNode *)v9 mutableChildNodes];
        for (uint64_t i = 0; i != v15; ++i)
        {
          v18 = [v13 objectAtIndex:i];
          v19 = [[VSKeyPathBasedTreeNode alloc] initWithRepresentedObject:v18 keyPath:v8];
          [v16 addObject:v19];
        }
      }
    }
  }
  return v9;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
}

@end