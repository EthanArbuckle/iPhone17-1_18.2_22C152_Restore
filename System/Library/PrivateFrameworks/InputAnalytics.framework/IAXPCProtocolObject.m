@interface IAXPCProtocolObject
- (void)didAction:(id)a3;
- (void)didSessionBeginWithSessionMetadata:(id)a3;
- (void)didSessionEndWithSessionMetadata:(id)a3;
- (void)getDateWithReply:(id)a3;
- (void)logMessage:(id)a3;
- (void)reportStatus;
@end

@implementation IAXPCProtocolObject

- (void)didAction:(id)a3
{
  v3 = sub_252A0588C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_252A11470();
  }
}

- (void)didSessionBeginWithSessionMetadata:(id)a3
{
  v3 = sub_252A0588C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_252A114A4();
  }
}

- (void)didSessionEndWithSessionMetadata:(id)a3
{
  v3 = sub_252A0588C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_252A114D8();
  }
}

- (void)getDateWithReply:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    v3 = sub_252A0588C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_252A1150C();
    }
  }
}

- (void)logMessage:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    v3 = sub_252A0588C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_252A11540();
    }
  }
}

- (void)reportStatus
{
  if (os_variant_has_internal_diagnostics())
  {
    v2 = sub_252A0588C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_252A11574();
    }
  }
}

@end