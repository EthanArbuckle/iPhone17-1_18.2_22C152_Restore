@interface DummyWebAccessStateController
- (DummyWebAccessStateController)init;
- (unint64_t)webAccessStatus:(id *)a3;
- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation DummyWebAccessStateController

- (DummyWebAccessStateController)init
{
  v3.receiver = self;
  v3.super_class = (Class)DummyWebAccessStateController;
  result = [(DummyWebAccessStateController *)&v3 init];
  if (result) {
    result->webAccessStatus = 2;
  }
  return result;
}

- (void)webAccessStatusWithCompletion:(id)a3
{
}

- (unint64_t)webAccessStatus:(id *)a3
{
  return self->webAccessStatus;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  self->webAccessStatus = a3;
  (*((void (**)(id, void))a4 + 2))(a4, 0);
}

@end