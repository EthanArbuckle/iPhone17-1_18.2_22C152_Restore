@interface NRDevice(DNDServer)
- (BOOL)_dnds_isIOS14EraOS;
- (uint64_t)_dnds_assertionSyncProtocolVersion;
- (uint64_t)_dnds_configurationSyncProtocolVersion;
- (uint64_t)_dnds_minorBuildVersion;
- (uint64_t)_dnds_pairedDeviceClass;
- (uint64_t)_dnds_supportsSilenceLists;
- (void)_dnds_operatingSystemVersion;
@end

@implementation NRDevice(DNDServer)

- (uint64_t)_dnds_pairedDeviceClass
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F79E18]];
  if ([v1 rangeOfString:@"iPod"] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 rangeOfString:@"iPad"] == 0x7FFFFFFFFFFFFFFFLL
    && [v1 rangeOfString:@"iPhone"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v1 rangeOfString:@"Mac"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v1 rangeOfString:@"Watch"] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v2 = 4 * ([v1 rangeOfString:@"RealityDevice"] != 0x7FFFFFFFFFFFFFFFLL);
      }
      else {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 2;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

- (uint64_t)_dnds_minorBuildVersion
{
  v1 = [a1 valueForProperty:*MEMORY[0x1E4F79E40]];
  uint64_t v2 = DNDSMinorBuildVersionFromBuildVersion(v1);

  return v2;
}

- (void)_dnds_operatingSystemVersion
{
  v3 = [a1 valueForProperty:*MEMORY[0x1E4F79E60]];
  id v17 = [v3 componentsSeparatedByString:@"."];

  unint64_t v4 = [v17 count];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4 < 3)
  {
    if (v4)
    {
      if (v4 == 2)
      {
        v11 = [v17 objectAtIndexedSubscript:0];
        uint64_t v12 = [v11 integerValue];

        v13 = [v17 objectAtIndexedSubscript:1];
        uint64_t v14 = [v13 integerValue];

        *a2 = v12;
        a2[1] = v14;
        a2[2] = 0;
      }
      else
      {
        v15 = [v17 objectAtIndexedSubscript:0];
        uint64_t v16 = [v15 integerValue];

        a2[1] = 0;
        a2[2] = 0;
        *a2 = v16;
      }
    }
  }
  else
  {
    v5 = [v17 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 integerValue];

    v7 = [v17 objectAtIndexedSubscript:1];
    uint64_t v8 = [v7 integerValue];

    v9 = [v17 objectAtIndexedSubscript:2];
    uint64_t v10 = [v9 integerValue];

    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
  }
}

- (uint64_t)_dnds_assertionSyncProtocolVersion
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  uint64_t v2 = [a1 valueForProperty:*MEMORY[0x1E4F79E40]];
  uint64_t v3 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  long long v6 = v8;
  uint64_t v7 = v9;
  uint64_t v4 = DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v6, v2, v3);

  return v4;
}

- (uint64_t)_dnds_configurationSyncProtocolVersion
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  uint64_t v2 = [a1 valueForProperty:*MEMORY[0x1E4F79E40]];
  uint64_t v3 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  long long v6 = v8;
  uint64_t v7 = v9;
  uint64_t v4 = DNDSConfigurationSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v6, v2, v3);

  return v4;
}

- (BOOL)_dnds_isIOS14EraOS
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  uint64_t v2 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  if (v2 == 1) {
    return v4 == 14;
  }
  if (v2 == 3) {
    return v4 == 7;
  }
  return v2 == 2 && v4 == 10 && v5 == 18;
}

- (uint64_t)_dnds_supportsSilenceLists
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  switch(objc_msgSend(a1, "_dnds_pairedDeviceClass"))
  {
    case 1:
      if (v3 <= 15) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 2:
      if (v3 > 12) {
        goto LABEL_9;
      }
      goto LABEL_7;
    case 3:
      if (v3 <= 8) {
        goto LABEL_7;
      }
      goto LABEL_9;
    case 4:
      if (v3 <= 0) {
        goto LABEL_7;
      }
LABEL_9:
      uint64_t result = 1;
      break;
    default:
LABEL_7:
      uint64_t result = 0;
      break;
  }
  return result;
}

@end