@interface AXAuditObjectTransportInfoMasquerade
- (AXAuditObjectTransportInfo)masqueradeTransportInfo;
- (AXAuditObjectTransportInfoMasquerade)init;
- (Class)masqueradeAsClass;
- (id)createLocalObjectWithMasqueradeObjectBlock;
- (id)createMasqueradeObjectBlock;
- (void)_initializeBlocks;
- (void)setCreateLocalObjectWithMasqueradeObjectBlock:(id)a3;
- (void)setCreateMasqueradeObjectBlock:(id)a3;
- (void)setMasqueradeAsClass:(Class)a3;
- (void)setMasqueradeTransportInfo:(id)a3;
@end

@implementation AXAuditObjectTransportInfoMasquerade

- (AXAuditObjectTransportInfoMasquerade)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAuditObjectTransportInfoMasquerade;
  v2 = [(AXAuditObjectTransportInfoMasquerade *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AXAuditObjectTransportInfo *)v2 setRequiresRawTransportDictionary:1];
    [(AXAuditObjectTransportInfoMasquerade *)v3 _initializeBlocks];
  }
  return v3;
}

- (void)_initializeBlocks
{
  objc_initWeak(&location, self);
  [(AXAuditObjectTransportInfo *)self setCanEncodeObjectBlock:&__block_literal_global_3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_2;
  v5[3] = &unk_26520CF78;
  objc_copyWeak(&v6, &location);
  [(AXAuditObjectTransportInfo *)self setCreateLocalObjectBlock:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_3;
  v3[3] = &unk_26520CFA0;
  objc_copyWeak(&v4, &location);
  [(AXAuditObjectTransportInfo *)self setCreateTransportObjectBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke()
{
  return 1;
}

id __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained masqueradeTransportInfo];
  id v6 = [v5 createLocalObjectBlock];
  v7 = ((void (**)(void, id))v6)[2](v6, v3);

  id v8 = objc_loadWeakRetained(v2);
  v9 = [v8 createLocalObjectWithMasqueradeObjectBlock];
  v10 = ((void (**)(void, void *))v9)[2](v9, v7);

  return v10;
}

id __57__AXAuditObjectTransportInfoMasquerade__initializeBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained createMasqueradeObjectBlock];
  id v6 = ((void (**)(void, id))v5)[2](v5, v3);

  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 masqueradeTransportInfo];
  v9 = [v8 createTransportObjectBlock];
  v10 = ((void (**)(void, void *))v9)[2](v9, v6);

  return v10;
}

- (Class)masqueradeAsClass
{
  return self->_masqueradeAsClass;
}

- (void)setMasqueradeAsClass:(Class)a3
{
}

- (AXAuditObjectTransportInfo)masqueradeTransportInfo
{
  return self->_masqueradeTransportInfo;
}

- (void)setMasqueradeTransportInfo:(id)a3
{
}

- (id)createMasqueradeObjectBlock
{
  return self->_createMasqueradeObjectBlock;
}

- (void)setCreateMasqueradeObjectBlock:(id)a3
{
}

- (id)createLocalObjectWithMasqueradeObjectBlock
{
  return self->_createLocalObjectWithMasqueradeObjectBlock;
}

- (void)setCreateLocalObjectWithMasqueradeObjectBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createLocalObjectWithMasqueradeObjectBlock, 0);
  objc_storeStrong(&self->_createMasqueradeObjectBlock, 0);
  objc_storeStrong((id *)&self->_masqueradeTransportInfo, 0);

  objc_storeStrong((id *)&self->_masqueradeAsClass, 0);
}

@end