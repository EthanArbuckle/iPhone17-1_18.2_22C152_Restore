@interface PHASEContainerNodeDefinition
+ (PHASEContainerNodeDefinition)new;
- (PHASEContainerNodeDefinition)init;
- (PHASEContainerNodeDefinition)initWithIdentifier:(NSString *)identifier;
- (id)children;
- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree;
@end

@implementation PHASEContainerNodeDefinition

- (PHASEContainerNodeDefinition)initWithIdentifier:(NSString *)identifier
{
  v4 = identifier;
  v11.receiver = self;
  v11.super_class = (Class)PHASEContainerNodeDefinition;
  v5 = [(PHASEDefinition *)&v11 initInternal];
  v6 = v5;
  if (v5)
  {
    [(PHASEDefinition *)v5 setIdentifier:v4];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    subtrees = v6->_subtrees;
    v6->_subtrees = v7;

    v9 = v6;
  }

  return v6;
}

- (PHASEContainerNodeDefinition)init
{
  v2 = [(PHASEContainerNodeDefinition *)self initWithIdentifier:&stru_26D47BF58];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (PHASEContainerNodeDefinition)new
{
  v2 = [PHASEContainerNodeDefinition alloc];

  return [(PHASEContainerNodeDefinition *)v2 initWithIdentifier:&stru_26D47BF58];
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree
{
  v4 = subtree;
  v5 = v4;
  if (v4) {
    [(NSMutableArray *)self->_subtrees addObject:v4];
  }
  else {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot add a nil subtree to a PHASEContainerNodeDefinition"];
  }
}

- (id)children
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->_subtrees];
}

- (void).cxx_destruct
{
}

@end