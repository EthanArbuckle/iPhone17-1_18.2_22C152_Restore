@interface RFSelfAuthInputs
- (BOOL)addAPTagToTicket;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (void)setAddAPTagToTicket:(BOOL)a3;
@end

@implementation RFSelfAuthInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Validating parmaeters: %@", buf, 0xCu);
  }
  if (v4) {
    uint64_t v6 = [v4 ds_BOOLFromKey:@"addAPTagToTicket" defaultValue:1 failed:&v8];
  }
  else {
    uint64_t v6 = 1;
  }
  [(RFSelfAuthInputs *)self setAddAPTagToTicket:v6];

  return 1;
}

- (BOOL)addAPTagToTicket
{
  return self->_addAPTagToTicket;
}

- (void)setAddAPTagToTicket:(BOOL)a3
{
  self->_addAPTagToTicket = a3;
}

@end