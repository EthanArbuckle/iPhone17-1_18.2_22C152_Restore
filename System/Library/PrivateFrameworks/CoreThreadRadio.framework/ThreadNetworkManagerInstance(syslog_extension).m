@interface ThreadNetworkManagerInstance(syslog_extension)
- (void)getRCPProperties;
@end

@implementation ThreadNetworkManagerInstance(syslog_extension)

- (void)getRCPProperties
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "TNM(sysdiag_extn): getRCPProperties : Last Known state is not associated", v1, 2u);
}

@end