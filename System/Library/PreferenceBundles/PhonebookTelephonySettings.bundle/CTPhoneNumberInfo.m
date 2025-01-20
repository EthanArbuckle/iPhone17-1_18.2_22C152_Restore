@interface CTPhoneNumberInfo
- (NSString)tps_localizedNumber;
- (NSString)tps_normalizedNumber;
@end

@implementation CTPhoneNumberInfo

- (NSString)tps_localizedNumber
{
  v2 = [(CTPhoneNumberInfo *)self number];
  uint64_t active = CPPhoneNumberCopyActiveCountryCode();
  v4 = (void *)active;
  v5 = 0;
  if (v2 && active)
  {
    v5 = TPSLocalizedPhoneNumberString();
  }
  v6 = TPSPhonebookLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v2;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Telephone number was localized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v8, 0x20u);
  }

  return (NSString *)v5;
}

- (NSString)tps_normalizedNumber
{
  v2 = [(CTPhoneNumberInfo *)self number];
  uint64_t active = CPPhoneNumberCopyActiveCountryCode();
  v4 = (void *)active;
  v5 = 0;
  if (v2 && active)
  {
    v5 = TPSNormalizedPhoneNumberString();
  }
  v6 = TPSPhonebookLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v2;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Telephone number was normalized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v8, 0x20u);
  }

  return (NSString *)v5;
}

@end