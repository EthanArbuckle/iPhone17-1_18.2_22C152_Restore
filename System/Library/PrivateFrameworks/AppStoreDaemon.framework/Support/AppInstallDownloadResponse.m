@interface AppInstallDownloadResponse
@end

@implementation AppInstallDownloadResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_assetSize, 0);
  objc_storeStrong((id *)&self->_assetRequest, 0);
}

@end