@interface MPAVItem(MPCReportingAdditions)
- (MPCReportingDeviceIdentityPropertiesLoader)mpcReporting_identityPropertiesLoader;
- (uint64_t)mpcReporting_equivalencySourceAdamID;
- (uint64_t)mpcReporting_isValidReportingItem;
- (uint64_t)mpcReporting_itemType;
- (uint64_t)mpcReporting_jingleTimedMetadata;
- (uint64_t)mpcReporting_requestingBundleIdentifier;
- (uint64_t)mpcReporting_requestingBundleVersion;
- (uint64_t)mpcReporting_shouldReportPlayEventsToStore;
- (uint64_t)mpcReporting_shouldUseRelativeTimePositions;
- (uint64_t)mpcReporting_siriInitiated;
- (uint64_t)mpcReporting_trackInfo;
@end

@implementation MPAVItem(MPCReportingAdditions)

- (uint64_t)mpcReporting_trackInfo
{
  return 0;
}

- (uint64_t)mpcReporting_siriInitiated
{
  return 0;
}

- (uint64_t)mpcReporting_shouldUseRelativeTimePositions
{
  return 0;
}

- (uint64_t)mpcReporting_shouldReportPlayEventsToStore
{
  return 0;
}

- (uint64_t)mpcReporting_requestingBundleVersion
{
  return 0;
}

- (uint64_t)mpcReporting_requestingBundleIdentifier
{
  return 0;
}

- (uint64_t)mpcReporting_jingleTimedMetadata
{
  return 0;
}

- (uint64_t)mpcReporting_itemType
{
  return 0;
}

- (uint64_t)mpcReporting_isValidReportingItem
{
  return 1;
}

- (uint64_t)mpcReporting_equivalencySourceAdamID
{
  return 0;
}

- (MPCReportingDeviceIdentityPropertiesLoader)mpcReporting_identityPropertiesLoader
{
  return +[MPCReportingDeviceIdentityPropertiesLoader sharedLoader];
}

@end