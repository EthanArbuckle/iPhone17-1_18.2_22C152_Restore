@interface CKDDeviceCapabilityLastSentCapabilitiesAndUsageEntry
- (NSArray)deviceCapabilityStringSet;
- (NSDate)capabilitySetSavedDate;
- (NSDate)usageSavedDate;
- (NSNumber)rowID;
- (void)setCapabilitySetSavedDate:(id)a3;
- (void)setDeviceCapabilityStringSet:(id)a3;
- (void)setRowID:(id)a3;
- (void)setUsageSavedDate:(id)a3;
@end

@implementation CKDDeviceCapabilityLastSentCapabilitiesAndUsageEntry

- (NSNumber)rowID
{
  return self->_rowID;
}

- (void)setRowID:(id)a3
{
}

- (NSArray)deviceCapabilityStringSet
{
  return self->_deviceCapabilityStringSet;
}

- (void)setDeviceCapabilityStringSet:(id)a3
{
}

- (NSDate)capabilitySetSavedDate
{
  return self->_capabilitySetSavedDate;
}

- (void)setCapabilitySetSavedDate:(id)a3
{
}

- (NSDate)usageSavedDate
{
  return self->_usageSavedDate;
}

- (void)setUsageSavedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageSavedDate, 0);
  objc_storeStrong((id *)&self->_capabilitySetSavedDate, 0);
  objc_storeStrong((id *)&self->_deviceCapabilityStringSet, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
}

@end