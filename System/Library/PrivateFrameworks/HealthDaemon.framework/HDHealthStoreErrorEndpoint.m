@interface HDHealthStoreErrorEndpoint
- (void)remote_serverForConfiguration:(id)a3 completion:(id)a4;
@end

@implementation HDHealthStoreErrorEndpoint

- (void)remote_serverForConfiguration:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, NSError *))a4 + 2))(a4, 0, self->_error);
  }
}

- (void).cxx_destruct
{
}

@end