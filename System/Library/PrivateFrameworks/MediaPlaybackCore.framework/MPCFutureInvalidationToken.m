@interface MPCFutureInvalidationToken
- (MPCFuture)future;
- (id)description;
- (void)setFuture:(id)a3;
@end

@implementation MPCFutureInvalidationToken

- (void)setFuture:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MPCFuture)future
{
  return self->_future;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCFutureInvalidationToken %p %@>", self, self->_future];
}

@end