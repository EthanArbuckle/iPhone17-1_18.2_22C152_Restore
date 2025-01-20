@interface MTLFunctionStitchingGraph
- (MTLFunctionStitchingFunctionNode)outputNode;
- (MTLFunctionStitchingGraph)init;
- (MTLFunctionStitchingGraph)initWithFunctionName:(NSString *)functionName nodes:(NSArray *)nodes outputNode:(MTLFunctionStitchingFunctionNode *)outputNode attributes:(NSArray *)attributes;
- (NSArray)attributes;
- (NSArray)nodes;
- (NSString)functionName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (void)dealloc;
- (void)setAttributes:(NSArray *)attributes;
- (void)setFunctionName:(NSString *)functionName;
- (void)setNodes:(NSArray *)nodes;
- (void)setOutputNode:(MTLFunctionStitchingFunctionNode *)outputNode;
@end

@implementation MTLFunctionStitchingGraph

- (MTLFunctionStitchingFunctionNode)outputNode
{
  return self->_outputNode;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionStitchingGraph;
  [(MTLFunctionStitchingGraph *)&v3 dealloc];
}

- (MTLFunctionStitchingGraph)initWithFunctionName:(NSString *)functionName nodes:(NSArray *)nodes outputNode:(MTLFunctionStitchingFunctionNode *)outputNode attributes:(NSArray *)attributes
{
  v13.receiver = self;
  v13.super_class = (Class)MTLFunctionStitchingGraph;
  v10 = [(MTLFunctionStitchingGraph *)&v13 init];
  v10->_functionName = (NSString *)[(NSString *)functionName copy];
  v10->_nodes = (NSArray *)[(NSArray *)nodes copy];
  if (shouldOutputNodePropertyRetain(void)::onceToken != -1) {
    dispatch_once(&shouldOutputNodePropertyRetain(void)::onceToken, &__block_literal_global_20);
  }
  if (shouldOutputNodePropertyRetain(void)::result) {
    v11 = outputNode;
  }
  else {
    v11 = (MTLFunctionStitchingFunctionNode *)[(MTLFunctionStitchingFunctionNode *)outputNode copy];
  }
  v10->_outputNode = v11;
  v10->_attributes = (NSArray *)[(NSArray *)attributes copy];
  return v10;
}

- (void)setOutputNode:(MTLFunctionStitchingFunctionNode *)outputNode
{
  v6 = self->_outputNode;
  if (shouldOutputNodePropertyRetain(void)::onceToken != -1) {
    dispatch_once(&shouldOutputNodePropertyRetain(void)::onceToken, &__block_literal_global_20);
  }
  if (shouldOutputNodePropertyRetain(void)::result) {
    v5 = outputNode;
  }
  else {
    v5 = (MTLFunctionStitchingFunctionNode *)[(MTLFunctionStitchingFunctionNode *)outputNode copy];
  }
  self->_outputNode = v5;
}

- (MTLFunctionStitchingGraph)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingGraph;
  v2 = [(MTLFunctionStitchingGraph *)&v5 init];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(MTLFunctionStitchingGraph *)v2 setNodes:MEMORY[0x1E4F1CBF0]];
  [(MTLFunctionStitchingGraph *)v2 setAttributes:v3];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setFunctionName:self->_functionName];
  [v4 setNodes:self->_nodes];
  [v4 setOutputNode:self->_outputNode];
  [v4 setAttributes:self->_attributes];
  return v4;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = self;
  nodes = self->_nodes;
  uint64_t v7 = [(NSArray *)nodes countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(nodes);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (v9) {
          [v9 appendString:v5];
        }
        else {
          id v9 = (id)objc_opt_new();
        }
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      uint64_t v8 = [(NSArray *)nodes countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  attributes = self->_attributes;
  uint64_t v14 = [(NSArray *)attributes countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(attributes);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if (v16) {
          [v16 appendString:v5];
        }
        else {
          id v16 = (id)objc_opt_new();
        }
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      uint64_t v15 = [(NSArray *)attributes countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }
  v20 = NSString;
  v28.receiver = v27;
  v28.super_class = (Class)MTLFunctionStitchingGraph;
  id v21 = [(MTLFunctionStitchingGraph *)&v28 description];
  v37[0] = v5;
  v37[1] = @"functionName =";
  v37[2] = v27->_functionName;
  v37[3] = v5;
  v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v23 = v9;
  }
  else {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }
  v37[4] = @"nodes =";
  v37[5] = v23;
  v37[6] = v5;
  v37[7] = @"outputNode =";
  uint64_t outputNode = (uint64_t)v27->_outputNode;
  if (!outputNode) {
    uint64_t outputNode = [MEMORY[0x1E4F1CA98] null];
  }
  v37[8] = outputNode;
  v37[9] = v5;
  if (v16) {
    id v25 = v16;
  }
  else {
    id v25 = v22;
  }
  v37[10] = @"attributes =";
  v37[11] = v25;
  return (id)[v20 stringWithFormat:@"%@%@", v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v37, 12), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLFunctionStitchingGraph *)self formattedDescription:0];
}

- (void)setFunctionName:(NSString *)functionName
{
}

- (void)setNodes:(NSArray *)nodes
{
}

- (void)setAttributes:(NSArray *)attributes
{
}

@end