@interface IDSDevice(DNDServer)
- (BOOL)_dnds_isIOS14EraOS;
- (uint64_t)_dnds_assertionSyncProtocolVersion;
- (uint64_t)_dnds_configurationSyncProtocolVersion;
- (uint64_t)_dnds_minorBuildVersion;
- (uint64_t)_dnds_pairedDeviceClass;
- (uint64_t)_dnds_supportsSilenceLists;
@end

@implementation IDSDevice(DNDServer)

- (uint64_t)_dnds_pairedDeviceClass
{
  uint64_t v1 = [a1 deviceType];
  if ((unint64_t)(v1 - 1) > 8) {
    return 0;
  }
  else {
    return qword_1D3122090[v1 - 1];
  }
}

- (uint64_t)_dnds_minorBuildVersion
{
  uint64_t v1 = [a1 productBuildVersion];
  uint64_t v2 = DNDSMinorBuildVersionFromBuildVersion(v1);

  return v2;
}

- (uint64_t)_dnds_assertionSyncProtocolVersion
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  [a1 operatingSystemVersion];
  uint64_t v2 = [a1 productBuildVersion];
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
  [a1 operatingSystemVersion];
  uint64_t v2 = [a1 productBuildVersion];
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
  [a1 operatingSystemVersion];
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
  [a1 operatingSystemVersion];
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