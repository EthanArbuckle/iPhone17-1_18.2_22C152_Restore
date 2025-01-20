@interface MPAVRoutingControllerSelection
- (MPAVRoutingControllerSelection)initWithRoutes:(id)a3 selectionOperation:(int64_t)a4;
- (NSArray)routes;
- (id)completion;
- (id)description;
- (int64_t)selectionOperation;
- (void)setCompletion:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSelectionOperation:(int64_t)a3;
@end

@implementation MPAVRoutingControllerSelection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_routes, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setSelectionOperation:(int64_t)a3
{
  self->_selectionOperation = a3;
}

- (int64_t)selectionOperation
{
  return self->_selectionOperation;
}

- (void)setRoutes:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (id)description
{
  unint64_t selectionOperation = self->_selectionOperation;
  if (selectionOperation > 2) {
    v3 = 0;
  }
  else {
    v3 = off_1E57EF098[selectionOperation];
  }
  return (id)[NSString stringWithFormat:@"<%@: %p operationName=%@ routes=%@>", objc_opt_class(), self, v3, self->_routes];
}

- (MPAVRoutingControllerSelection)initWithRoutes:(id)a3 selectionOperation:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAVRoutingControllerSelection;
  v8 = [(MPAVRoutingControllerSelection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_routes, a3);
    v9->_unint64_t selectionOperation = a4;
  }

  return v9;
}

@end