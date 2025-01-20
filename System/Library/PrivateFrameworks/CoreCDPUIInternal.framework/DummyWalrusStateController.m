@interface DummyWalrusStateController
- (DummyWalrusStateController)init;
- (unint64_t)walrusStatus:(id *)a3;
- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4;
- (void)walrusStatusWithCompletion:(id)a3;
@end

@implementation DummyWalrusStateController

- (DummyWalrusStateController)init
{
  v3.receiver = self;
  v3.super_class = (Class)DummyWalrusStateController;
  result = [(DummyWalrusStateController *)&v3 init];
  if (result) {
    result->walrusStatus = 2;
  }
  return result;
}

- (void)walrusStatusWithCompletion:(id)a3
{
}

- (unint64_t)walrusStatus:(id *)a3
{
  return self->walrusStatus;
}

- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4
{
  self->walrusStatus = a3;
  (*((void (**)(id, void))a4 + 2))(a4, 0);
}

@end