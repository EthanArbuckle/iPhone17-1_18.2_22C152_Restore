@interface HDTinkerProfile
- (BOOL)setDSID:(id)a3 error:(id *)a4;
- (BOOL)setPairedNRDeviceUUID:(id)a3 error:(id *)a4;
- (HDTinkerProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6;
- (id)attachmentManager;
- (id)dsidWithError:(id *)a3;
- (id)pairedNRDeviceUUIDWithError:(id *)a3;
- (void)awakeFromDisk;
@end

@implementation HDTinkerProfile

- (HDTinkerProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HDTinkerProfile;
  v6 = [(HDProfile *)&v10 initWithDirectoryPath:a3 medicalIDDirectoryPath:a4 daemon:a5 profileIdentifier:a6];
  if (v6)
  {
    v7 = [[HDAttachmentManager alloc] initWithProfile:v6];
    attachmentManager = v6->_attachmentManager;
    v6->_attachmentManager = v7;
  }
  return v6;
}

- (void)awakeFromDisk
{
  if (![(HDProfile *)self testModeEnabled])
  {
    v3 = [(HDProfile *)self database];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__HDTinkerProfile_awakeFromDisk__block_invoke;
    v5[3] = &unk_1E62F3208;
    v5[4] = self;
    [v3 performWhenDataProtectedByFirstUnlockIsAvailable:v5];

    v4.receiver = self;
    v4.super_class = (Class)HDTinkerProfile;
    [(HDProfile *)&v4 awakeFromDisk];
  }
}

void __32__HDTinkerProfile_awakeFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cloudSyncManager];
  id v9 = 0;
  v3 = [v2 shareOwnerParticipantWithError:&v9];
  id v4 = v9;

  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29FA8];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup share owner participant upon profile awake from disk; assuming it is set for this launch.",
          buf,
          0xCu);
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: No share owner participant set after launch for this Tinker profile. Triggering deletion.", buf, 0xCu);
      }
      [*(id *)(a1 + 32) triggerDeletion];
    }
  }
}

- (id)pairedNRDeviceUUIDWithError:(id *)a3
{
  id v4 = HDTinkerKeyValueDomainWithProfile(self);
  v5 = [v4 dataForKey:@"TinkerNRDeviceUUIDKey" error:a3];
  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)setPairedNRDeviceUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = HDTinkerKeyValueDomainWithProfile(self);
  uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a4];

  if (v8) {
    char v9 = [v7 setData:v8 forKey:@"TinkerNRDeviceUUIDKey" error:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (id)dsidWithError:(id *)a3
{
  id v4 = HDTinkerSyncedProtectedKeyValueDomainWithProfile(self);
  v5 = [v4 numberForKey:@"TinkerDSIDKey" error:a3];

  return v5;
}

- (BOOL)setDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = HDTinkerSyncedProtectedKeyValueDomainWithProfile(self);
  LOBYTE(a4) = [v7 setNumber:v6 forKey:@"TinkerDSIDKey" error:a4];

  return (char)a4;
}

- (id)attachmentManager
{
  return self->_attachmentManager;
}

- (void).cxx_destruct
{
}

@end