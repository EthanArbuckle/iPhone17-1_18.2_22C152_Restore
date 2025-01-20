@interface SIQueryTask
- (SPCoreSpotlightTask)queryTask;
- (void)cancel;
- (void)setQueryTask:(id)a3;
@end

@implementation SIQueryTask

- (void)cancel
{
}

- (SPCoreSpotlightTask)queryTask
{
  return self->_queryTask;
}

- (void)setQueryTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end