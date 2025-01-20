@interface MSSearch
+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5 delegate:(id)a6;
+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 delegate:(id)a7;
+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 onlyInboxes:(BOOL)a7 delegate:(id)a8;
- (MSSearch)initWithRemoteObjectInterface:(id)a3;
- (MSSearchDelegate)delegate;
- (id)_initWithDelegate:(id)a3;
- (id)newConnectionForInterface:(id)a3;
- (void)_delegateDidFindResults:(id)a3;
- (void)_delegateDidFinishWithError:(id)a3;
- (void)_findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5;
- (void)cancel;
- (void)foundResults:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MSSearch

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5 delegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [[MSSearch alloc] _initWithDelegate:v11];
  [v12 _findMessageData:v9 matchingCriterion:v10 options:a5];

  return v12;
}

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 delegate:(id)a7
{
  uint64_t v7 = 4;
  if (a5) {
    uint64_t v7 = 5;
  }
  if (a6) {
    uint64_t v8 = v7 | 2;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = [a1 findMessageData:a3 matchingCriterion:a4 options:v8 delegate:a7];

  return v9;
}

+ (id)findMessageData:(id)a3 matchingCriterion:(id)a4 shouldFetch:(BOOL)a5 onServer:(BOOL)a6 onlyInboxes:(BOOL)a7 delegate:(id)a8
{
  uint64_t v8 = a5;
  if (a6) {
    uint64_t v8 = a5 | 2;
  }
  if (a7) {
    uint64_t v9 = v8 | 4;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [a1 findMessageData:a3 matchingCriterion:a4 options:v9 delegate:a8];

  return v10;
}

- (id)_initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C607608];
  v10.receiver = self;
  v10.super_class = (Class)MSSearch;
  v6 = [(MSXPCService *)&v10 initWithRemoteObjectInterface:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    uint64_t v8 = v7;
  }

  return v7;
}

- (MSSearch)initWithRemoteObjectInterface:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSSearch;
  return [(MSXPCService *)&v4 initWithRemoteObjectInterface:a3];
}

- (id)newConnectionForInterface:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MSSearch;
  id v4 = [(MSXPCService *)&v18 newConnectionForInterface:a3];
  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C605988];
  [v4 setExportedInterface:v5];
  v6 = [[MSSearchProxy alloc] initWithSearch:self];
  [v4 setExportedObject:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__MSSearch_newConnectionForInterface___block_invoke;
  v15[3] = &unk_2642433A8;
  objc_copyWeak(&v16, &location);
  uint64_t v7 = (void *)MEMORY[0x2166BBCE0](v15);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__MSSearch_newConnectionForInterface___block_invoke_2;
  v13[3] = &unk_2642433D0;
  id v8 = v7;
  id v14 = v8;
  [v4 setInterruptionHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__MSSearch_newConnectionForInterface___block_invoke_3;
  v11[3] = &unk_2642433D0;
  id v9 = v8;
  id v12 = v9;
  [v4 setInvalidationHandler:v11];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v4;
}

void __38__MSSearch_newConnectionForInterface___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08608];
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"MSMailSearchErrorDomain" code:1500 userInfo:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _delegateDidFinishWithError:v6];
}

void __38__MSSearch_newConnectionForInterface___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __38__MSSearch_newConnectionForInterface___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)cancel
{
  id v2 = [(MSXPCService *)self connection];
  [v2 invalidate];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!obj && WeakRetained)
  {
    v6 = [(MSXPCService *)self connection];
    [v6 invalidate];
  }
  objc_storeWeak((id *)p_delegate, obj);
}

- (void)foundResults:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(MSSearch *)self _delegateDidFindResults:v7];
  }
  else {
    [(MSSearch *)self _delegateDidFinishWithError:v6];
  }
}

- (void)_findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MSSearch.m", 357, @"Invalid parameter not satisfying: %@", @"criterion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MSSearch.m", 358, @"Invalid parameter not satisfying: %@", @"resultKeys" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__MSSearch__findMessageData_matchingCriterion_options___block_invoke;
  v14[3] = &unk_264242F40;
  v14[4] = self;
  id v11 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v14];
  [v11 findMessageData:v9 matchingCriterion:v10 options:a5];
}

void __55__MSSearch__findMessageData_matchingCriterion_options___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08608];
  v9[0] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v5 errorWithDomain:@"MSMailSearchErrorDomain" code:1500 userInfo:v6];
  [v4 _delegateDidFinishWithError:v7];
}

- (void)_delegateDidFinishWithError:(id)a3
{
  id v7 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained search:self didFinishWithError:v7];
  }
  id v6 = [(MSXPCService *)self connection];
  [v6 invalidate];

  objc_storeWeak((id *)p_delegate, 0);
}

- (void)_delegateDidFindResults:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained search:self didFindResults:v5] & 1) == 0)
  {
    [(MSSearch *)self _delegateDidFinishWithError:0];
  }
}

- (MSSearchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSSearchDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end