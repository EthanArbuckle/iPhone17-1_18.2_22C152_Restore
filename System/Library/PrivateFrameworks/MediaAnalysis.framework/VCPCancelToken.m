@interface VCPCancelToken
- (BOOL)isCanceled;
- (void)cancel;
@end

@implementation VCPCancelToken

- (void)cancel
{
}

- (BOOL)isCanceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

@end