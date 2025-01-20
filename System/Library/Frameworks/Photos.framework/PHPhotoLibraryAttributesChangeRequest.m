@interface PHPhotoLibraryAttributesChangeRequest
- (BOOL)enableCloudSync;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (BOOL)prepareForServicePreflightCheck:(id *)a3;
- (NSString)changeTypeForSummary;
- (NSString)name;
- (NSString)userDescription;
- (PHPhotoLibraryAttributesChangeRequest)init;
- (PLChangesForServiceHandling)changesForServiceHandler;
- (int64_t)accessScopeOptionsRequirement;
- (unsigned)cloudResourcePrefetchMode;
- (void)setCloudResourcePrefetchMode:(unsigned __int16)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setUserDescription:(id)a3;
@end

@implementation PHPhotoLibraryAttributesChangeRequest

- (void).cxx_destruct
{
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  return 1;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 type];
  int v6 = v5;
  if (a4 && v5)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Change must be performed within the sharedPhotoLibrary";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (PLChangesForServiceHandling)changesForServiceHandler
{
  return self->_changes;
}

- (unsigned)cloudResourcePrefetchMode
{
  v2 = [(PLPhotoLibraryAttributesChanges *)self->_changes cloudResourcePrefetchModeValue];
  uint64_t v3 = [v2 integerValue];

  if (v3 == 1) {
    return 2;
  }
  else {
    return v3 == 0;
  }
}

- (void)setCloudResourcePrefetchMode:(unsigned __int16)a3
{
  uint64_t v4 = 1;
  if (a3 != 2) {
    uint64_t v4 = 2;
  }
  if (a3 == 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5 == 2)
  {
    changes = self->_changes;
    [(PLPhotoLibraryAttributesChanges *)changes setCloudResourcePrefetchModeValue:0];
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(PLPhotoLibraryAttributesChanges *)self->_changes setCloudResourcePrefetchModeValue:v7];
  }
}

- (BOOL)enableCloudSync
{
  v2 = [(PLPhotoLibraryAttributesChanges *)self->_changes enableCloudSyncValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(PLPhotoLibraryAttributesChanges *)self->_changes setEnableCloudSyncValue:v4];
}

- (NSString)userDescription
{
  return (NSString *)[(PLPhotoLibraryAttributesChanges *)self->_changes userDescription];
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(PLPhotoLibraryAttributesChanges *)self->_changes name];
}

- (void)setName:(id)a3
{
}

- (NSString)changeTypeForSummary
{
  return (NSString *)@"LibraryAttributes";
}

- (PHPhotoLibraryAttributesChangeRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHPhotoLibraryAttributesChangeRequest;
  v2 = [(PHPhotoLibraryAttributesChangeRequest *)&v8 init];
  if (v2)
  {
    char v3 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    id v4 = v3;
    if (v3)
    {
      [v3 recordOtherChangeRequest:v2];
      uint64_t v5 = (PLPhotoLibraryAttributesChanges *)objc_alloc_init(MEMORY[0x1E4F8AA88]);
      changes = v2->_changes;
      v2->_changes = v5;
    }
    else
    {
      changes = v2;
      v2 = 0;
    }
  }
  return v2;
}

@end