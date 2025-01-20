@interface PHPersistentChangeFetchRequest
- (PHPersistentChangeToken)token;
- (unint64_t)maximumChangeThreshold;
- (void)setMaximumChangeThreshold:(unint64_t)a3;
- (void)setToken:(id)a3;
@end

@implementation PHPersistentChangeFetchRequest

- (void).cxx_destruct
{
}

- (void)setMaximumChangeThreshold:(unint64_t)a3
{
  self->_maximumChangeThreshold = a3;
}

- (unint64_t)maximumChangeThreshold
{
  return self->_maximumChangeThreshold;
}

- (void)setToken:(id)a3
{
}

- (PHPersistentChangeToken)token
{
  return self->_token;
}

@end