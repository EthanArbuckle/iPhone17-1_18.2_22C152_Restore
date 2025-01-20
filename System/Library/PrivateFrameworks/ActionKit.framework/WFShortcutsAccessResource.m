@interface WFShortcutsAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (id)localizedAttemptRecoveryFromErrorMessage;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedImportErrorReasonForStatus:(unint64_t)a3;
- (unint64_t)status;
@end

@implementation WFShortcutsAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)localizedAttemptRecoveryFromErrorMessage
{
  return 0;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return 0;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  return 0;
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.shortcuts";
}

@end