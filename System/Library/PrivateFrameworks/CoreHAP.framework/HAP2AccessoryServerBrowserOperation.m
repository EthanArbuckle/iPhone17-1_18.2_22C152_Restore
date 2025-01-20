@interface HAP2AccessoryServerBrowserOperation
- (HAP2AccessoryServerBrowserOperation)initWithType:(unint64_t)a3;
- (NSError)error;
- (NSMutableSet)pendingCoordinators;
- (unint64_t)type;
- (void)setError:(id)a3;
- (void)setPendingCoordinators:(id)a3;
@end

@implementation HAP2AccessoryServerBrowserOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_pendingCoordinators, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setPendingCoordinators:(id)a3
{
}

- (NSMutableSet)pendingCoordinators
{
  return self->_pendingCoordinators;
}

- (unint64_t)type
{
  return self->_type;
}

- (HAP2AccessoryServerBrowserOperation)initWithType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerBrowserOperation;
  v4 = [(HAP2AccessoryServerBrowserOperation *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    pendingCoordinators = v5->_pendingCoordinators;
    v5->_pendingCoordinators = (NSMutableSet *)v6;
  }
  return v5;
}

@end