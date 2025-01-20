@interface MPPlayableContentManagerContext
- (BOOL)contentLimitsEnforced;
- (BOOL)endpointAvailable;
- (NSInteger)enforcedContentItemsCount;
- (NSInteger)enforcedContentTreeDepth;
- (void)setContentLimitsEnforced:(BOOL)a3;
- (void)setEndpointAvailable:(BOOL)a3;
- (void)setEnforcedContentItemsCount:(int64_t)a3;
- (void)setEnforcedContentTreeDepth:(int64_t)a3;
@end

@implementation MPPlayableContentManagerContext

- (void)setEndpointAvailable:(BOOL)a3
{
  self->_endpointAvailable = a3;
}

- (BOOL)endpointAvailable
{
  return self->_endpointAvailable;
}

- (void)setContentLimitsEnforced:(BOOL)a3
{
  self->_contentLimitsEnforced = a3;
}

- (BOOL)contentLimitsEnforced
{
  return self->_contentLimitsEnforced;
}

- (void)setEnforcedContentTreeDepth:(int64_t)a3
{
  self->_enforcedContentTreeDepth = a3;
}

- (NSInteger)enforcedContentTreeDepth
{
  return self->_enforcedContentTreeDepth;
}

- (void)setEnforcedContentItemsCount:(int64_t)a3
{
  self->_enforcedContentItemsCount = a3;
}

- (NSInteger)enforcedContentItemsCount
{
  return self->_enforcedContentItemsCount;
}

@end