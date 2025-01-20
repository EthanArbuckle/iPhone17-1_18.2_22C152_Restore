@interface DAPriorityRequest
- (int64_t)UIDataclasses;
- (int64_t)refreshDataclasses;
- (void)setRefreshDataclasses:(int64_t)a3;
- (void)setUIDataclasses:(int64_t)a3;
@end

@implementation DAPriorityRequest

- (int64_t)refreshDataclasses
{
  return self->_refreshDataclasses;
}

- (void)setRefreshDataclasses:(int64_t)a3
{
  self->_refreshDataclasses = a3;
}

- (int64_t)UIDataclasses
{
  return self->_UIDataclasses;
}

- (void)setUIDataclasses:(int64_t)a3
{
  self->_UIDataclasses = a3;
}

@end