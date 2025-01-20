@interface TestCNUIIDSHandleAvailability
- (BOOL)available;
- (BOOL)isEqual:(id)a3;
- (CNUIIDSHandle)handle;
- (TestCNUIIDSHandleAvailability)initWithHandle:(id)a3 availability:(BOOL)a4;
- (unint64_t)hash;
- (void)setAvailable:(BOOL)a3;
- (void)setHandle:(id)a3;
@end

@implementation TestCNUIIDSHandleAvailability

- (TestCNUIIDSHandleAvailability)initWithHandle:(id)a3 availability:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TestCNUIIDSHandleAvailability;
  v8 = [(TestCNUIIDSHandleAvailability *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_available = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke;
  v15[3] = &unk_2640172E0;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke_2;
  objc_super v12 = &unk_2640172E0;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) handle];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) handle];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) handle];
  v5 = [*(id *)(a1 + 40) handle];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t __41__TestCNUIIDSHandleAvailability_isEqual___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) available];
  return v2 ^ [*(id *)(a1 + 40) available] ^ 1;
}

- (unint64_t)hash
{
  int v2 = (void *)MEMORY[0x263F335E8];
  aBlock[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__TestCNUIIDSHandleAvailability_hash__block_invoke;
  v7[3] = &unk_264017308;
  v7[4] = self;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__TestCNUIIDSHandleAvailability_hash__block_invoke_2;
  aBlock[3] = &unk_264017308;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __37__TestCNUIIDSHandleAvailability_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  int v2 = [*(id *)(a1 + 32) handle];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __37__TestCNUIIDSHandleAvailability_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  uint64_t v2 = [*(id *)(a1 + 32) available];
  return [v1 BOOLHash:v2];
}

- (CNUIIDSHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
}

@end