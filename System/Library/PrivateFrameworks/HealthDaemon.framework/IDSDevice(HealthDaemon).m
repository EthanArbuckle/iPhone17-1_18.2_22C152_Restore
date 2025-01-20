@interface IDSDevice(HealthDaemon)
- (id)hd_destinationIdentifier;
- (id)hd_shortDescription;
- (uint64_t)hd_isEquivalentToDevice:()HealthDaemon;
@end

@implementation IDSDevice(HealthDaemon)

- (id)hd_destinationIdentifier
{
  v0 = (void *)IDSCopyIDForDevice();

  return v0;
}

- (uint64_t)hd_isEquivalentToDevice:()HealthDaemon
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hd_deviceIdentifier");
  v6 = objc_msgSend(v4, "hd_deviceIdentifier");
  if (v5 == v6)
  {
    uint64_t v10 = 1;
  }
  else
  {
    v7 = objc_msgSend(v4, "hd_deviceIdentifier");
    if (v7)
    {
      v8 = objc_msgSend(a1, "hd_deviceIdentifier");
      v9 = objc_msgSend(v4, "hd_deviceIdentifier");
      uint64_t v10 = [v8 isEqualToString:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  return v10;
}

- (id)hd_shortDescription
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [a1 name];
  if ([a1 isActive]) {
    v5 = "active";
  }
  else {
    v5 = "inactive";
  }
  v6 = objc_msgSend(a1, "hd_deviceIdentifier");
  v7 = [v2 stringWithFormat:@"<%@:%p \"%@\" (%s) device-id:%@>", v3, a1, v4, v5, v6];

  return v7;
}

@end