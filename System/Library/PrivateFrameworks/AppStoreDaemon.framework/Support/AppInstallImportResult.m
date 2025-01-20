@interface AppInstallImportResult
@end

@implementation AppInstallImportResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end