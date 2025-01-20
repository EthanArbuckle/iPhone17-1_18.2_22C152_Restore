@interface MAGraphReference
- (MAGraph)concreteGraph;
- (MAGraphProxy)graph;
- (MAGraphReference)initWithGraph:(id)a3;
- (unint64_t)hash;
@end

@implementation MAGraphReference

- (void).cxx_destruct
{
}

- (MAGraph)concreteGraph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_concreteGraph);
  return (MAGraph *)WeakRetained;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (MAGraphProxy)graph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_concreteGraph);
  return (MAGraphProxy *)WeakRetained;
}

- (MAGraphReference)initWithGraph:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAGraphReference;
  v5 = [(MAGraphReference *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_concreteGraph, v4);
    v7 = [v4 identifier];
    v6->_hash = [v7 hash];
  }
  return v6;
}

@end