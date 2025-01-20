@interface KGEdgeChangeRequest
- (KGEdge)edge;
- (KGEdgeChangeRequest)initWithEdge:(id)a3 properties:(id)a4;
- (NSDictionary)properties;
@end

@implementation KGEdgeChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_edge, 0);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (KGEdge)edge
{
  return self->_edge;
}

- (KGEdgeChangeRequest)initWithEdge:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGEdgeChangeRequest;
  v9 = [(KGEdgeChangeRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_edge, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
  }

  return v10;
}

@end