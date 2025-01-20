@interface PHASESwitchNodeDefinition
+ (PHASESwitchNodeDefinition)new;
- (NSMutableArray)subtrees;
- (PHASEStringMetaParameterDefinition)switchMetaParameterDefinition;
- (PHASESwitchNodeDefinition)init;
- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition;
- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition identifier:(NSString *)identifier;
- (id)children;
- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree switchValue:(NSString *)switchValue;
- (void)setSubtrees:(id)a3;
@end

@implementation PHASESwitchNodeDefinition

- (PHASESwitchNodeDefinition)init
{
  return 0;
}

+ (PHASESwitchNodeDefinition)new
{
  return 0;
}

- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition identifier:(NSString *)identifier
{
  v6 = switchMetaParameterDefinition;
  v7 = identifier;
  v8 = [(PHASESwitchNodeDefinition *)self initWithSwitchMetaParameterDefinition:v6];
  v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (PHASESwitchNodeDefinition)initWithSwitchMetaParameterDefinition:(PHASEStringMetaParameterDefinition *)switchMetaParameterDefinition
{
  v5 = switchMetaParameterDefinition;
  if (!v5)
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a PHASESwitchNodeDefinition with a nil switchMetaParameterDefinition"];
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)PHASESwitchNodeDefinition;
  id v6 = [(PHASEDefinition *)&v11 initInternal];
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v7;

  objc_storeStrong((id *)v6 + 2, switchMetaParameterDefinition);
  self = (PHASESwitchNodeDefinition *)v6;
  v9 = self;
LABEL_7:

  return v9;
}

- (void)addSubtree:(PHASESoundEventNodeDefinition *)subtree switchValue:(NSString *)switchValue
{
  v8 = subtree;
  id v6 = switchValue;
  id v7 = objc_alloc_init(SwitchSubtree);
  [(SwitchSubtree *)v7 setSwitchValue:v6];
  [(SwitchSubtree *)v7 setSubtree:v8];
  [(NSMutableArray *)self->_subtrees addObject:v7];
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

- (PHASEStringMetaParameterDefinition)switchMetaParameterDefinition
{
  return self->_switchMetaParameterDefinition;
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
  objc_storeStrong((id *)&self->_subtrees, 0);

  objc_storeStrong((id *)&self->_switchMetaParameterDefinition, 0);
}

@end