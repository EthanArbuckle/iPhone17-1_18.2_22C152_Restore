@interface BEDragInteraction
- (BEDragInteraction)initWithDelegate:(id)a3;
- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5;
- (BOOL)_supportsAddingItemsAsynchronously;
- (void)_prepareForSession:(id)a3 completion:(id)a4;
@end

@implementation BEDragInteraction

- (BEDragInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BEDragInteraction;
  v5 = [(UIDragInteraction *)&v10 initWithDelegate:v4];
  if (v5)
  {
    *(unsigned char *)&v5->_char delegateImplements = *(unsigned char *)&v5->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    char v6 = objc_opt_respondsToSelector();
    char delegateImplements = (char)v5->_delegateImplements;
    if (v6) {
      char v8 = 2;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&v5->_char delegateImplements = delegateImplements & 0xFD | v8;
    if (delegateImplements)
    {
      [(UIDragInteraction *)v5 _setLiftDelay:0.65];
      [(UIDragInteraction *)v5 _setAllowsPointerDragBeforeLiftDelay:0];
    }
  }

  return v5;
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (*(unsigned char *)&self->_delegateImplements)
  {
    id v8 = a3;
    v9 = [_BEBurnableBlock alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__BEDragInteraction__prepareForSession_completion___block_invoke;
    v16[3] = &unk_2651791E0;
    id v17 = v6;
    objc_super v10 = [(_BEBurnableBlock *)v9 initWithTimeout:v16 block:&__block_literal_global defaultInputProvider:0.5];
    v11 = [(UIDragInteraction *)self delegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__BEDragInteraction__prepareForSession_completion___block_invoke_3;
    v14[3] = &unk_265179228;
    v15 = v10;
    v12 = v10;
    [v11 dragInteraction:self prepareDragSession:v8 completion:v14];

    id v7 = v17;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BEDragInteraction;
    id v7 = a3;
    [(UIDragInteraction *)&v13 _prepareForSession:v7 completion:v6];
  }
}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 BOOLValue];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke_2()
{
  return MEMORY[0x263EFFA80];
}

uint64_t __51__BEDragInteraction__prepareForSession_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithInput:MEMORY[0x263EFFA88]];
}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a5;
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v13 = a3;
    v14 = [_BEBurnableBlock alloc];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke;
    v22[3] = &unk_265179250;
    id v23 = v10;
    v15 = [(_BEBurnableBlock *)v14 initWithTimeout:v22 block:&__block_literal_global_12 defaultInputProvider:0.5];
    v16 = [(UIDragInteraction *)self delegate];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3;
    v20[3] = &unk_265179298;
    v21 = v15;
    id v17 = v15;
    objc_msgSend(v16, "dragInteraction:itemsForAddingToSession:forTouchAtPoint:completion:", self, v13, v20, var0, var1);

    BOOL v12 = 1;
    id v11 = v23;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BEDragInteraction;
    id v11 = a3;
    BOOL v12 = -[UIDragInteraction _itemsForAddingToSession:atPoint:completion:](&v19, sel__itemsForAddingToSession_atPoint_completion_, v11, v10, var0, var1, var2);
  }

  return v12;
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_2()
{
  return MEMORY[0x263EFFA68];
}

uint64_t __65__BEDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performWithInput:a2];
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return (*(unsigned char *)&self->_delegateImplements >> 1) & 1;
}

@end