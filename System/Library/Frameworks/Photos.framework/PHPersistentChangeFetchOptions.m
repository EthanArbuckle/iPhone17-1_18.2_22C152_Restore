@interface PHPersistentChangeFetchOptions
- (BOOL)excludesPrivateChanges;
- (unint64_t)maximumChangeThreshold;
- (void)setExcludesPrivateChanges:(BOOL)a3;
- (void)setMaximumChangeThreshold:(unint64_t)a3;
@end

@implementation PHPersistentChangeFetchOptions

- (void)setExcludesPrivateChanges:(BOOL)a3
{
  self->_excludesPrivateChanges = a3;
}

- (BOOL)excludesPrivateChanges
{
  return self->_excludesPrivateChanges;
}

- (void)setMaximumChangeThreshold:(unint64_t)a3
{
  self->_maximumChangeThreshold = a3;
}

- (unint64_t)maximumChangeThreshold
{
  return self->_maximumChangeThreshold;
}

@end