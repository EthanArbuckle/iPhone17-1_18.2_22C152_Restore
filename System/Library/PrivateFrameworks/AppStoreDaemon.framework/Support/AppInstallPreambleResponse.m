@interface AppInstallPreambleResponse
@end

@implementation AppInstallPreambleResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end