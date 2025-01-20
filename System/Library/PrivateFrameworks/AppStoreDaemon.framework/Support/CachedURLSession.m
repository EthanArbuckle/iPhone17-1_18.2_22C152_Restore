@interface CachedURLSession
@end

@implementation CachedURLSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWatchCellularTransferSize, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end