@interface NSString(CRLPersonNameComponents)
@end

@implementation NSString(CRLPersonNameComponents)

+ (void)crl_localizedDisplayNameWithPersonNameComponents:()CRLPersonNameComponents .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to use AddressBook API. Localization format may be incorrect.", v1, 2u);
}

@end