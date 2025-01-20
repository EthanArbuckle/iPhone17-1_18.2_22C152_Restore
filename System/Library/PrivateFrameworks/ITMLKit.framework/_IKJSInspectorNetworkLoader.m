@interface _IKJSInspectorNetworkLoader
- (IKJSInspectorNetworkAgent)agent;
- (NSMutableDictionary)requestRecords;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)parentIdentifier;
- (RWIProtocolNetworkDomainEventDispatcher)dispatcher;
- (_IKJSInspectorNetworkLoader)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 agent:(id)a5 dispatcher:(id)a6;
- (double)currentTimeIntervalSince1970;
- (id)_recordForResource:(int64_t)a3 withInitiator:(int64_t)a4 synchronousOperation:(BOOL)a5;
- (id)recordForResource:(int64_t)a3 withInitiator:(int64_t)a4;
- (void)dispatchEventWithBlock:(id)a3;
- (void)setParentIdentifier:(id)a3;
@end

@implementation _IKJSInspectorNetworkLoader

- (_IKJSInspectorNetworkLoader)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 agent:(id)a5 dispatcher:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_IKJSInspectorNetworkLoader;
  v14 = [(_IKJSInspectorNetworkLoader *)&v20 init];
  v15 = v14;
  if (v14)
  {
    if (v10) {
      v16 = v10;
    }
    else {
      v16 = @"Inspector";
    }
    objc_storeStrong((id *)&v14->_identifier, v16);
    objc_storeStrong((id *)&v15->_parentIdentifier, a4);
    objc_storeWeak((id *)&v15->_agent, v12);
    objc_storeWeak((id *)&v15->_dispatcher, v13);
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    requestRecords = v15->_requestRecords;
    v15->_requestRecords = (NSMutableDictionary *)v17;
  }
  return v15;
}

- (id)recordForResource:(int64_t)a3 withInitiator:(int64_t)a4
{
  return [(_IKJSInspectorNetworkLoader *)self _recordForResource:a3 withInitiator:a4 synchronousOperation:0];
}

- (id)_recordForResource:(int64_t)a3 withInitiator:(int64_t)a4 synchronousOperation:(BOOL)a5
{
  v8 = [(_IKJSInspectorNetworkLoader *)self agent];
  v9 = [v8 controller];
  v10 = [v9 inspector];
  int v11 = [v10 connected];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v12 UUIDString];

    v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v13 loader:self resourceType:a3 initiatorType:a4];
    if (v14)
    {
      v15 = [(_IKJSInspectorNetworkLoader *)self requestRecords];
      [v15 setObject:v14 forKey:v13];
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)dispatchEventWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(_IKJSInspectorNetworkLoader *)self agent];
  v6 = [v5 controller];
  v7 = [v6 inspector];
  int v8 = [v7 connected];

  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = [(_IKJSInspectorNetworkLoader *)self agent];
    v10 = [v9 controller];
    int v11 = [v10 appContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54___IKJSInspectorNetworkLoader_dispatchEventWithBlock___block_invoke;
    v12[3] = &unk_1E6DE5408;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [v11 evaluate:v12 completionBlock:0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (double)currentTimeIntervalSince1970
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  v6 = [(_IKJSInspectorNetworkLoader *)self agent];
  v7 = [v6 controller];
  int v8 = [v7 inspectorConnectDate];
  [v8 timeIntervalSince1970];
  double v10 = v5 - v9;

  return v10;
}

- (NSString)debugDescription
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  v6 = [(_IKJSInspectorNetworkLoader *)self identifier];
  v7 = [(_IKJSInspectorNetworkLoader *)self parentIdentifier];
  int v8 = [(_IKJSInspectorNetworkLoader *)self requestRecords];
  double v9 = [v3 stringWithFormat:@"<%@: %p, identifier = %@, parent = %@> requestRecords: %@", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKJSInspectorNetworkAgent)agent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  return (IKJSInspectorNetworkAgent *)WeakRetained;
}

- (RWIProtocolNetworkDomainEventDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (RWIProtocolNetworkDomainEventDispatcher *)WeakRetained;
}

- (NSMutableDictionary)requestRecords
{
  return self->_requestRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRecords, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_destroyWeak((id *)&self->_agent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

@end