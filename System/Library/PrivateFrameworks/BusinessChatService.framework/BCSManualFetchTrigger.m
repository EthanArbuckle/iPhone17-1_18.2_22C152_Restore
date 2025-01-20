@interface BCSManualFetchTrigger
- (void)scheduleFetchBlock:(id)a3;
- (void)triggerFetchForReason:(unint64_t)a3 completion:(id)a4;
@end

@implementation BCSManualFetchTrigger

- (void)scheduleFetchBlock:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic_copy(self, a2, a3, 8);
  }
}

- (void)triggerFetchForReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self)
  {
    id fetchBlock = self->_fetchBlock;
    if (fetchBlock)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __58__BCSManualFetchTrigger_triggerFetchForReason_completion___block_invoke;
      v9[3] = &unk_264248838;
      id v10 = v6;
      (*((void (**)(id, void, unint64_t, void *))fetchBlock + 2))(fetchBlock, 0, a3, v9);
    }
  }
}

uint64_t __58__BCSManualFetchTrigger_triggerFetchForReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end