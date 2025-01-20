@interface MAAbstractEdge
- (BOOL)isDirected;
- (MAAbstractEdge)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (MAAbstractEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 minimum:(unint64_t)a8 maximum:(unint64_t)a9 directed:(BOOL)a10;
- (id)oppositeNode:(id)a3;
- (id)sourceNode;
- (id)targetNode;
- (unint64_t)maximum;
- (unint64_t)minimum;
@end

@implementation MAAbstractEdge

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetAbstractNode);
  objc_destroyWeak((id *)&self->_sourceAbstractNode);
}

- (BOOL)isDirected
{
  return self->_isDirected;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (unint64_t)minimum
{
  return self->_minimum;
}

- (id)oppositeNode:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MAAbstractEdge;
  v3 = [(MAEdge *)&v5 oppositeNode:a3];
  return v3;
}

- (id)targetNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetAbstractNode);
  return WeakRetained;
}

- (id)sourceNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceAbstractNode);
  return WeakRetained;
}

- (MAAbstractEdge)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MAAbstractEdge;
  LODWORD(v6) = 1.0;
  return [(MAConcreteEdge *)&v8 initWithLabel:a3 sourceNode:0 targetNode:0 domain:a4 weight:a6 properties:v6];
}

- (MAAbstractEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 minimum:(unint64_t)a8 maximum:(unint64_t)a9 directed:(BOOL)a10
{
  id v15 = a4;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MAAbstractEdge;
  LODWORD(v17) = 1.0;
  v18 = [(MAConcreteEdge *)&v21 initWithLabel:a3 sourceNode:0 targetNode:0 domain:1 weight:MEMORY[0x1E4F1CC08] properties:v17];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_sourceAbstractNode, v15);
    objc_storeWeak((id *)&v19->_targetAbstractNode, v16);
    v19->_minimum = a8;
    v19->_maximum = a9;
    v19->_isDirected = a10;
  }

  return v19;
}

@end