@interface PHASERandomNodeDefinition
- (NSInteger)uniqueSelectionQueueLength;
- (NSMutableArray)subtrees;
- (PHASERandomNodeDefinition)init;
- (PHASERandomNodeDefinition)initWithIdentifier:(NSString *)identifier;
- (id)children;
- (int64_t)noRepeatLastX;
- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree weight:(NSNumber *)weight;
- (void)setNoRepeatLastX:(int64_t)a3;
- (void)setSubtrees:(id)a3;
- (void)setUniqueSelectionQueueLength:(NSInteger)uniqueSelectionQueueLength;
@end

@implementation PHASERandomNodeDefinition

- (PHASERandomNodeDefinition)initWithIdentifier:(NSString *)identifier
{
  v4 = identifier;
  v5 = [(PHASERandomNodeDefinition *)self init];
  v6 = v5;
  if (v5)
  {
    [(PHASEDefinition *)v5 setIdentifier:v4];
    v7 = v6;
  }

  return v6;
}

- (PHASERandomNodeDefinition)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHASERandomNodeDefinition;
  v2 = [(PHASEDefinition *)&v7 initInternal];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    subtrees = v2->_subtrees;
    v2->_subtrees = v3;

    v2->_uniqueSelectionQueueLength = 0;
    v5 = v2;
  }

  return v2;
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree weight:(NSNumber *)weight
{
  v15 = subtree;
  objc_super v7 = weight;
  if (v15)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = NSStringFromSelector(a2);
      [(NSNumber *)v7 doubleValue];
      double v12 = PHASEGetPropertyBounded<double>(v9, v10, v11, 1.0, 8.98846567e307);

      v13 = objc_alloc_init(RandomSubtree);
      [(RandomSubtree *)v13 setSubtree:v15];
      [(RandomSubtree *)v13 setWeight:v12];
      [(NSMutableArray *)self->_subtrees addObject:v13];

      goto LABEL_7;
    }
    v14 = @"Cannot add a subTree to a PHASERandomNodeDefinition with a nil weight";
  }
  else
  {
    v14 = @"Cannot add a nil subTree to a PHASERandomNodeDefinition";
  }
  [MEMORY[0x263EFF940] raise:@"API Misuse" format:v14];
LABEL_7:
}

- (id)children
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_subtrees;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "subtree", (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int64_t)noRepeatLastX
{
  return self->_uniqueSelectionQueueLength;
}

- (void)setNoRepeatLastX:(int64_t)a3
{
  self->_uniqueSelectionQueueLength = a3;
}

- (NSInteger)uniqueSelectionQueueLength
{
  return self->_uniqueSelectionQueueLength;
}

- (void)setUniqueSelectionQueueLength:(NSInteger)uniqueSelectionQueueLength
{
  self->_uniqueSelectionQueueLength = uniqueSelectionQueueLength;
}

- (NSMutableArray)subtrees
{
  return self->_subtrees;
}

- (void)setSubtrees:(id)a3
{
}

- (void).cxx_destruct
{
}

@end