@interface PHAdjustmentDataRequestBehaviorSpec
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
@end

@implementation PHAdjustmentDataRequestBehaviorSpec

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

@end