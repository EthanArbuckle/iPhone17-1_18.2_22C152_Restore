@interface MockASDTSystemStatus
- (BOOL)publishedEnabled;
- (void)setPublishedEnabled:(BOOL)a3;
@end

@implementation MockASDTSystemStatus

- (BOOL)publishedEnabled
{
  return self->_publishedEnabled;
}

- (void)setPublishedEnabled:(BOOL)a3
{
  self->_publishedEnabled = a3;
}

@end