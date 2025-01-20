@interface NRDevice(HealthDaemon)
- (id)hd_shortDescription;
- (uint64_t)hd_isActive;
- (uint64_t)hd_isAltAccount;
- (uint64_t)hd_lastActiveDate;
- (uint64_t)hd_lastInactiveDate;
- (uint64_t)hd_name;
- (uint64_t)hd_pairingID;
- (uint64_t)hd_productType;
- (uint64_t)hd_systemBuildVersion;
@end

@implementation NRDevice(HealthDaemon)

- (uint64_t)hd_name
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79E08]];
}

- (uint64_t)hd_pairingID
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79E10]];
}

- (uint64_t)hd_systemBuildVersion
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79E40]];
}

- (uint64_t)hd_productType
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79E18]];
}

- (uint64_t)hd_isActive
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F79D90]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)hd_isAltAccount
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F79DA0]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)hd_lastActiveDate
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79DB8]];
}

- (uint64_t)hd_lastInactiveDate
{
  return [a1 valueForProperty:*MEMORY[0x1E4F79DC0]];
}

- (id)hd_shortDescription
{
  uint64_t v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(a1, "hd_name");
  v5 = objc_msgSend(a1, "hd_pairingID");
  v6 = [v5 UUIDString];
  v7 = [v2 stringWithFormat:@"<%@:%p \"%@\" %@>", v3, a1, v4, v6];

  return v7;
}

@end