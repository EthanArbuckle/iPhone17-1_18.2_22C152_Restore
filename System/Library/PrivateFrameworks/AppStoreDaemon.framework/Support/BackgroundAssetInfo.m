@interface BackgroundAssetInfo
@end

@implementation BackgroundAssetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_dataPromise, 0);
}

@end