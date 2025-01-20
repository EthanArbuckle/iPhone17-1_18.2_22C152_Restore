@interface DBWorkspaceStateChangeRequest
- (NSArray)changeItems;
- (id)_initWithRequest:(id)a3;
- (id)completionHandler;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation DBWorkspaceStateChangeRequest

- (id)_initWithRequest:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)DBWorkspaceStateChangeRequest;
  v5 = [(DBWorkspaceStateChangeRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4[1] copy];
    changeItems = v5->_changeItems;
    v5->_changeItems = (NSMutableArray *)v6;

    objc_storeStrong((id *)&v5->_source, v4[2]);
  }

  return v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F29C40]) initWithObject:self];
  [v3 appendArraySection:self->_changeItems withName:@"changeItems" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_source withName:@"source" skipIfNil:1];
  v5 = [v3 build];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DBMutableWorkspaceStateChangeRequest alloc];
  return [(DBWorkspaceStateChangeRequest *)v4 _initWithRequest:self];
}

- (NSArray)changeItems
{
  return &self->_changeItems->super;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_changeItems, 0);
}

@end