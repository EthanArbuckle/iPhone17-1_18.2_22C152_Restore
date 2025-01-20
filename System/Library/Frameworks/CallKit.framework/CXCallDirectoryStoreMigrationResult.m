@interface CXCallDirectoryStoreMigrationResult
- (BOOL)requiresExtensionDisablement;
- (BOOL)requiresExtensionSynchronization;
- (int64_t)endingSchemaVersion;
- (int64_t)startingSchemaVersion;
- (void)setEndingSchemaVersion:(int64_t)a3;
- (void)setRequiresExtensionDisablement:(BOOL)a3;
- (void)setRequiresExtensionSynchronization:(BOOL)a3;
- (void)setStartingSchemaVersion:(int64_t)a3;
@end

@implementation CXCallDirectoryStoreMigrationResult

- (int64_t)startingSchemaVersion
{
  return self->_startingSchemaVersion;
}

- (void)setStartingSchemaVersion:(int64_t)a3
{
  self->_startingSchemaVersion = a3;
}

- (int64_t)endingSchemaVersion
{
  return self->_endingSchemaVersion;
}

- (void)setEndingSchemaVersion:(int64_t)a3
{
  self->_endingSchemaVersion = a3;
}

- (BOOL)requiresExtensionDisablement
{
  return self->_requiresExtensionDisablement;
}

- (void)setRequiresExtensionDisablement:(BOOL)a3
{
  self->_requiresExtensionDisablement = a3;
}

- (BOOL)requiresExtensionSynchronization
{
  return self->_requiresExtensionSynchronization;
}

- (void)setRequiresExtensionSynchronization:(BOOL)a3
{
  self->_requiresExtensionSynchronization = a3;
}

@end