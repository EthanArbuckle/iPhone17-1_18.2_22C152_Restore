@interface HSPCDataProvider
- (BOOL)isLoaded;
- (HSPCDataProvider)initWithCoordinator:(id)a3 configuration:(id)a4;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)items;
- (id)loadData;
- (id)userFacingStringForItem:(id)a3;
- (unint64_t)initialRowIndex;
- (void)setConfig:(id)a3;
- (void)setInitialRowIndex:(unint64_t)a3;
- (void)setItems:(id)a3;
- (void)setLoaded:(BOOL)a3;
@end

@implementation HSPCDataProvider

- (HSPCDataProvider)initWithCoordinator:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HSPCDataProvider;
  v7 = [(HSPCDataProvider *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_config, a4);
    items = v8->_items;
    v8->_items = (NSArray *)&__NSArray0__struct;
  }
  return v8;
}

- (id)userFacingStringForItem:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)loadData
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (unint64_t)initialRowIndex
{
  return self->_initialRowIndex;
}

- (void)setInitialRowIndex:(unint64_t)a3
{
  self->_initialRowIndex = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (HSSetupStateMachineConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end