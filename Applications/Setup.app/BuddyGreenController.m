@interface BuddyGreenController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (id)writeGreenInformedDefaultPlistIfNecessaryBlock;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3;
@end

@implementation BuddyGreenController

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(void))[(BuddyGreenController *)v5 writeGreenInformedDefaultPlistIfNecessaryBlock];
  v3[2](v3);

  (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)writeGreenInformedDefaultPlistIfNecessaryBlock
{
  return self->_writeGreenInformedDefaultPlistIfNecessaryBlock;
}

- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end