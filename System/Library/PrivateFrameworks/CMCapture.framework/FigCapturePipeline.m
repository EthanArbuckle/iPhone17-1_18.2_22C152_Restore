@interface FigCapturePipeline
- (BOOL)addNode:(id)a3 error:(id *)a4;
- (BWGraph)graph;
- (FigCapturePipeline)initWithGraph:(id)a3 name:(id)a4;
- (NSArray)nodes;
- (NSString)name;
- (void)dealloc;
- (void)removeAllNodes;
@end

@implementation FigCapturePipeline

- (BOOL)addNode:(id)a3 error:(id *)a4
{
  BOOL v6 = [(BWGraph *)self->_graph addNode:a3 error:a4];
  if (v6)
  {
    [(NSMutableArray *)self->_nodes addObject:a3];
    [a3 setSubgraphName:self->_name];
  }
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (FigCapturePipeline)initWithGraph:(id)a3 name:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FigCapturePipeline;
  BOOL v6 = [(FigCapturePipeline *)&v8 init];
  if (v6)
  {
    v6->_graph = (BWGraph *)a3;
    v6->_name = (NSString *)[a4 copy];
    v6->_nodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v6;
}

- (NSArray)nodes
{
  return &self->_nodes->super;
}

- (BWGraph)graph
{
  return self->_graph;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (void)removeAllNodes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  nodes = self->_nodes;
  uint64_t v4 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(nodes);
        }
        [(BWGraph *)self->_graph removeNode:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableArray *)nodes countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end