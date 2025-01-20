@interface HUFakeXPCClient
- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4;
- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3;
- (void)registerMessageBlock:(id)a3;
@end

@implementation HUFakeXPCClient

- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3
{
  return 1;
}

- (void)registerMessageBlock:(id)a3
{
  self->_updateBlock = (id)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4
{
  updateBlock = (void (**)(id, void *))self->_updateBlock;
  if (updateBlock)
  {
    v5 = [a3 payload];
    updateBlock[2](updateBlock, v5);
  }
  return updateBlock != 0;
}

- (void).cxx_destruct
{
}

@end