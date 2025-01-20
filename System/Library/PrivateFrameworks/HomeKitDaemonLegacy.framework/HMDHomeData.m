@interface HMDHomeData
+ (void)configureKeyedArchiverClassMappings;
- (BOOL)accessAllowedWhenLocked;
- (BOOL)demoFinalized;
- (HMDAccount)account;
- (HMDAccountHandle)primaryAccountHandle;
- (HMDApplicationData)applicationData;
- (NSArray)UUIDsOfRemovedHomes;
- (NSArray)accessories;
- (NSArray)cloudZones;
- (NSArray)homes;
- (NSArray)incomingInvitations;
- (NSArray)pendingReasonSaved;
- (NSArray)pendingUserManagementOperations;
- (NSArray)remoteAccounts;
- (NSArray)unprocessedOperationIdentifiers;
- (NSDictionary)demoAccessories;
- (NSString)currentDevice;
- (NSUUID)dataTag;
- (NSUUID)lastCurrentHomeUUID;
- (NSUUID)primaryHomeUUID;
- (id)homeWithUUID:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)dataVersion;
- (int64_t)recoveryVersion;
- (int64_t)residentEnabledState;
- (int64_t)schemaVersion;
- (void)setAccessAllowedWhenLocked:(BOOL)a3;
- (void)setAccessories:(id)a3;
- (void)setAccount:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setCloudZones:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setDataTag:(id)a3;
- (void)setDataVersion:(int64_t)a3;
- (void)setDemoAccessories:(id)a3;
- (void)setDemoFinalized:(BOOL)a3;
- (void)setHomes:(id)a3;
- (void)setIncomingInvitations:(id)a3;
- (void)setLastCurrentHomeUUID:(id)a3;
- (void)setPendingReasonSaved:(id)a3;
- (void)setPendingUserManagementOperations:(id)a3;
- (void)setPrimaryAccountHandle:(id)a3;
- (void)setPrimaryHomeUUID:(id)a3;
- (void)setRecoveryVersion:(int64_t)a3;
- (void)setRemoteAccounts:(id)a3;
- (void)setResidentEnabledState:(int64_t)a3;
- (void)setSchemaVersion:(int64_t)a3;
- (void)setUUIDsOfRemovedHomes:(id)a3;
- (void)setUnprocessedOperationIdentifiers:(id)a3;
@end

@implementation HMDHomeData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoAccessories, 0);
  objc_storeStrong((id *)&self->_primaryAccountHandle, 0);
  objc_storeStrong((id *)&self->_remoteAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_unprocessedOperationIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingUserManagementOperations, 0);
  objc_storeStrong((id *)&self->_pendingReasonSaved, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_incomingInvitations, 0);
  objc_storeStrong((id *)&self->_cloudZones, 0);
  objc_storeStrong((id *)&self->_UUIDsOfRemovedHomes, 0);
  objc_storeStrong((id *)&self->_dataTag, 0);
  objc_storeStrong((id *)&self->_lastCurrentHomeUUID, 0);
  objc_storeStrong((id *)&self->_primaryHomeUUID, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

- (void)setDemoFinalized:(BOOL)a3
{
  self->_demoFinalized = a3;
}

- (BOOL)demoFinalized
{
  return self->_demoFinalized;
}

- (void)setDemoAccessories:(id)a3
{
}

- (NSDictionary)demoAccessories
{
  return self->_demoAccessories;
}

- (void)setAccessAllowedWhenLocked:(BOOL)a3
{
  self->_accessAllowedWhenLocked = a3;
}

- (BOOL)accessAllowedWhenLocked
{
  return self->_accessAllowedWhenLocked;
}

- (void)setPrimaryAccountHandle:(id)a3
{
}

- (HMDAccountHandle)primaryAccountHandle
{
  return self->_primaryAccountHandle;
}

- (void)setRemoteAccounts:(id)a3
{
}

- (NSArray)remoteAccounts
{
  return self->_remoteAccounts;
}

- (void)setAccount:(id)a3
{
}

- (HMDAccount)account
{
  return self->_account;
}

- (void)setResidentEnabledState:(int64_t)a3
{
  self->_residentEnabledState = a3;
}

- (int64_t)residentEnabledState
{
  return self->_residentEnabledState;
}

- (void)setApplicationData:(id)a3
{
}

- (HMDApplicationData)applicationData
{
  return self->_applicationData;
}

- (void)setUnprocessedOperationIdentifiers:(id)a3
{
}

- (NSArray)unprocessedOperationIdentifiers
{
  return self->_unprocessedOperationIdentifiers;
}

- (void)setPendingUserManagementOperations:(id)a3
{
}

- (NSArray)pendingUserManagementOperations
{
  return self->_pendingUserManagementOperations;
}

- (void)setPendingReasonSaved:(id)a3
{
}

- (NSArray)pendingReasonSaved
{
  return self->_pendingReasonSaved;
}

- (void)setCurrentDevice:(id)a3
{
}

- (NSString)currentDevice
{
  return self->_currentDevice;
}

- (void)setIncomingInvitations:(id)a3
{
}

- (NSArray)incomingInvitations
{
  return self->_incomingInvitations;
}

- (void)setCloudZones:(id)a3
{
}

- (NSArray)cloudZones
{
  return self->_cloudZones;
}

- (void)setUUIDsOfRemovedHomes:(id)a3
{
}

- (NSArray)UUIDsOfRemovedHomes
{
  return self->_UUIDsOfRemovedHomes;
}

- (void)setDataTag:(id)a3
{
}

- (NSUUID)dataTag
{
  return self->_dataTag;
}

- (void)setRecoveryVersion:(int64_t)a3
{
  self->_recoveryVersion = a3;
}

- (int64_t)recoveryVersion
{
  return self->_recoveryVersion;
}

- (void)setSchemaVersion:(int64_t)a3
{
  self->_schemaVersion = a3;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setDataVersion:(int64_t)a3
{
  self->_dataVersion = a3;
}

- (int64_t)dataVersion
{
  return self->_dataVersion;
}

- (void)setLastCurrentHomeUUID:(id)a3
{
}

- (NSUUID)lastCurrentHomeUUID
{
  return self->_lastCurrentHomeUUID;
}

- (void)setPrimaryHomeUUID:(id)a3
{
}

- (NSUUID)primaryHomeUUID
{
  return self->_primaryHomeUUID;
}

- (void)setAccessories:(id)a3
{
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setHomes:(id)a3
{
}

- (NSArray)homes
{
  return self->_homes;
}

- (id)homeWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDHomeData *)self homes];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[HMDMutableHomeData allocWithZone:](HMDMutableHomeData, "allocWithZone:") init];
  __HMDHomeDataCopyProperties(v5, self, (uint64_t)a3);
  return v5;
}

+ (void)configureKeyedArchiverClassMappings
{
  [MEMORY[0x1E4F28DB0] setClassName:@"HMDAccessory" forClass:objc_opt_class()];
  [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"HMDAccessory"];
  [MEMORY[0x1E4F28DB0] setClassName:@"HMDCharacteristicNotificationRegistry" forClass:objc_opt_class()];
  [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"HMDCharacteristicNotificationRegistry"];
  [MEMORY[0x1E4F28DB0] setClassName:@"HMDResidentDeviceManager" forClass:objc_opt_class()];
  [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"HMDResidentDeviceManager"];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  [v2 setClass:v3 forClassName:@"HMDWHAAccessory"];
}

@end